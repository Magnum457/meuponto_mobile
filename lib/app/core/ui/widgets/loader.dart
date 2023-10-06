import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart';

class Loader {
  static OverlayEntry? _overlayEntry;
  static bool _open = false;

  Loader._();

  static void show() {
    _overlayEntry ??= OverlayEntry(
      builder: (context) {
        return Container(
          color: Colors.black54,
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          ),
        );
      },
    );
    if (!_open) {
      _open = true;
      Asuka.addOverlay(_overlayEntry!);
    }
  }

  static hide() {
    if (_open) {
      _open = false;
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }
}
