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
  double _progress = 0;
  late InAppWebViewController _webViewController;
  CookieManager cookieManager = CookieManager.instance();
  final sessionService =
      SessionServiceImpl(localStorage: SharedPreferencesLocalStorageImpl());

  bool navigatorPopHasCalled = false;

  void _onNavigationChanged(Uri? uri) async {
    if (uri.toString().startsWith(widget.redirectUrl.toString())) {
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
          _webViewController.goBack();
          return false;
        }

        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text('Autenticação')),
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
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  setState(() {
                    _progress = progress / 100;
                  });
                },
                onLoadStop: (controller, url) async {
                  final identidadeCookie = await cookieManager.getCookie(
                      url: url!, name: '_identidade_session');
                  if (identidadeCookie != null) {
                    await sessionService
                        .saveIdentidadeSessionCookie(identidadeCookie.value);
                  }
                  _onNavigationChanged(url);
                },
                onLoadError: (controller, url, error, string) {
                  Navigator.pop(context);
                },
              ),
              _progress < 1
                  ? LinearProgressIndicator(value: _progress)
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
