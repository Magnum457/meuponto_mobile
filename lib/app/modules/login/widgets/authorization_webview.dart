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

  InAppWebViewController? _webViewController;

  final ValueNotifier<double> _progress = ValueNotifier<double>(0.0);
  CookieManager cookieManager = CookieManager.instance();
  final sessionService =
      SessionServiceImpl(localStorage: SharedPreferencesLocalStorageImpl());

  bool navigatorPopHasCalled = false;

  @override
  void dispose() {
    super.dispose();
  }

  void _onNavigationChanged(Uri? uri) async {
    if (uri.toString().startsWith(widget.redirectUrl.toString())) {
      await _webViewController?.stopLoading();
      if (!navigatorPopHasCalled) {
        navigatorPopHasCalled = true;
        if (context.mounted) Navigator.of(context).pop(uri);
      }
    }
    debugPrint('Uri diferente da url de redirecionamento');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InAppWebView(
            key: webViewKey,
            initialUrlRequest: URLRequest(
              url: widget.grant.getAuthorizationUrl(
                widget.redirectUrl,
              ),
            ),
            onWebViewCreated: (controller) async {
              await sessionService.closeSession();

              _webViewController = controller;
            },
            onProgressChanged: (controller, progress) {
              _progress.value = progress / 100;
            },
            onLoadStop: (controller, url) async {
              final identidadeCookie = await cookieManager.getCookie(
                url: url!,
                name: '_identidade_session',
              );
              if (identidadeCookie != null) {
                await sessionService.initializeSession(identidadeCookie.value);
              }
              _onNavigationChanged(url);
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
    );
  }
}
