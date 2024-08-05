import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class Sign extends StatefulWidget {
  final Function(Uint8List) onSignComplete;

  const Sign({Key? key, required this.onSignComplete}) : super(key: key);

  @override
  SignState createState() => SignState();
}

class SignState extends State<Sign> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
  }

  void _handleSaveButtonPressed() async {
    final data = await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
    final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    widget.onSignComplete(bytes!.buffer.asUint8List());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SfSignaturePad(
            key: signatureGlobalKey,
            backgroundColor: Colors.white,
            strokeColor: Colors.black,
            minimumStrokeWidth: 1.0,
            maximumStrokeWidth: 4.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                onPressed: _handleSaveButtonPressed,
                child: const Text('Save'),
              ),
              TextButton(
                onPressed: _handleClearButtonPressed,
                child: const Text('Clear'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
