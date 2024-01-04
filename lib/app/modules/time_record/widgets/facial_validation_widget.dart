part of '../time_record_page.dart';

class FacialValidationWidget extends StatelessWidget {
  final TimeRecordStore store;
  InAppWebViewController? _webViewController;

  FacialValidationWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SizedBox(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        child: Stack(
          children: [
            InAppWebView(
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  mediaPlaybackRequiresUserGesture: false,
                  javaScriptEnabled: true,
                ),
              ),
              androidOnPermissionRequest:
                  (controller, origin, resources) async {
                return PermissionRequestResponse(
                    resources: resources,
                    action: PermissionRequestResponseAction.GRANT);
              },
              initialUrlRequest:
                  URLRequest(url: Uri.parse(store.facialValidatorURL)),
              onWebViewCreated: (InAppWebViewController controller) async {
                _webViewController = controller;
                await Permission.camera.request();
              },
              onLoadStart: (InAppWebViewController controller, Uri? url) async {
                store.setLoadingFacialValidation();
              },
              onLoadStop: (InAppWebViewController controller, Uri? url) {
                store.unsetLoadingFacialValidation();
              },
            ),
          ],
        ),
      );
    });
  }
}
