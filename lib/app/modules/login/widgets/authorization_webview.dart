import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:oauth2/oauth2.dart';

import '../../../core/local_storage/shared_preferences/shared_preferences_local_storage_impl.dart';
import '../../../services/session/session_service_impl.dart';

class AuthorizationWebView extends StatefulWidget {
  final AuthorizationCodeGrant grant;
  final Uri redirectUrl;

  const AuthorizationWebView({
    super.key,
    required this.grant,
    required this.redirectUrl,
  });

  @override
  State<AuthorizationWebView> createState() => _AuthorizationWebViewState();
}

class _AuthorizationWebViewState extends State<AuthorizationWebView> {
  final GlobalKey webViewKey = GlobalKey();
  final ValueNotifier<double> _progress = ValueNotifier<double>(0.0);
  late InAppWebViewController _webViewController;
  CookieManager cookieManager = CookieManager.instance();
  final sessionService =
      SessionServiceImpl(localStorage: SharedPreferencesLocalStorageImpl());

  bool navigatorPopHasCalled = false;

  void _onNavigationChanged(Uri? uri, InAppWebViewController controller) async {
    if (uri.toString().startsWith(widget.redirectUrl.toString())) {
      _webViewController = controller;
      await _webViewController.stopLoading();
      if (!navigatorPopHasCalled) {
        navigatorPopHasCalled = true;
        if (context.mounted) Navigator.of(context).pop(uri);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var isLastPage = await _webViewController.canGoBack();

        if (isLastPage) {
          await _webViewController.goBack();
          return false;
        }

        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              InAppWebView(
                key: webViewKey,
                initialUrlRequest: URLRequest(
                    url: widget.grant.getAuthorizationUrl(widget.redirectUrl)),
                onWebViewCreated: (controller) async {
                  await sessionService.logoutIdentidade();
                  _webViewController = controller;
                },
                onProgressChanged: (controller, progress) {
                  _progress.value = progress / 100;
                },
                onLoadStop: (controller, url) async {
                  final identidadeCookie = await cookieManager.getCookie(
                      url: url!, name: '_identidade_session');
                  if (identidadeCookie != null) {
                    await sessionService
                        .saveIdentidadeSessionCookie(identidadeCookie.value);
                  }
                  _onNavigationChanged(url, controller);
                },
                onLoadError: (controller, url, error, string) {
                  Navigator.pop(context);
                },
              ),
              _progress.value < 1
                  ? ValueListenableBuilder(
                      valueListenable: _progress,
                      builder: (_, value, __) {
                        return LinearProgressIndicator(value: value);
                      })
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
