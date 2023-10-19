import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:oauth2/oauth2.dart';

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
  CookieManager cookieManager = CookieManager.instance();

  bool navigatorPopHasCalled = false;

  void _onNavigationChanged(Uri? uri) async {
    if (uri.toString().startsWith(widget.redirectUrl.toString())) {
      await _webViewController?.stopLoading();
      if (!navigatorPopHasCalled) {
        navigatorPopHasCalled = true;
        if (context.mounted) Navigator.of(context).pop(uri);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Autenticação')),
      body: InAppWebView(
        key: webViewKey,
        initialUrlRequest: URLRequest(
            url: widget.grant.getAuthorizationUrl(widget.redirectUrl)),
        onWebViewCreated: (controller) async {
          _webViewController = controller;
          await cookieManager.deleteAllCookies();
        },
        onLoadStop: (controller, url) async {
          _onNavigationChanged(url);
        },
        onLoadError: (controller, url, error, string) {
          Navigator.pop(context);
        },
      ),
    );
  }
}
