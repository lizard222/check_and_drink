import 'dart:io';
import 'package:check_and_drink/result_windows/qr_result_window.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:camera/camera.dart';

class QrFirstScreen extends StatefulWidget {
  const QrFirstScreen({super.key});

  @override
  _QrFirstScreenState createState() => _QrFirstScreenState();
}

class _QrFirstScreenState extends State<QrFirstScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;
  double _zoomLevel = 1.0;
  List<CameraDescription>? cameras;

  @override
  void initState() {
    super.initState();
    _loadCameras();
  }


  Future<void> _loadCameras() async {
    cameras = await availableCameras();
    setState(() {});
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 10),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: Color.fromARGB(255, 128, 0, 32),
                          size: 35.0),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 100),
                    const Center(
                      child: Text(
                        'Скан',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                     const SizedBox(width: 100),
                    IconButton(
                      icon: const Icon(Icons.next_plan,
                          color: Color.fromARGB(255, 128, 0, 32),
                          size: 35.0),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>QrResultScreen()),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: _buildQrView(context),
                ),
                if (cameras != null)
                 SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color.fromARGB(255, 128, 0, 32), // Цвет активной части
                      inactiveTrackColor: Colors.grey[300], // Цвет неактивной части
                      thumbColor: Color.fromARGB(255, 128, 0, 32), // Цвет ползунка
                      overlayColor: Color.fromARGB(255, 128, 0, 32).withAlpha(32), // Цвет оверлея при нажатии
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
                    ),
                    child: Slider(
                      value: _zoomLevel,
                      min: 1.0,
                      max: 4.0,
                      onChanged: (value) {
                        setState(() {
                          _zoomLevel = value;
                          //controller?.setZoomLevel(value);
                        });
                      },
                    ),
                  ),
                if (result != null)
                  Text(
                      'Result: ${result!.code}',
                       style: const TextStyle(
                      fontSize: 16,
                       fontWeight: FontWeight.bold,
                       color: Color.fromARGB(255, 128, 0, 32)),),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Color.fromARGB(255, 128, 0, 32),
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: MediaQuery.of(context).size.width * 0.8,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}