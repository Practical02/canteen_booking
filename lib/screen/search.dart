import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String scannedData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _scanQRCode(),
              child: Text('Scan QR Code'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _scanQRCode() async {
    await Permission.camera.request();

    try {
      String? barcode = await scanner.scan();
      if (barcode != null && barcode.isNotEmpty) {
        setState(() {
          scannedData = barcode;
        });
      } else {
        print('Scanning canceled or no data received.');
      }
    } catch (e) {
      print('Error during scanning: $e');
    }
  }
}
