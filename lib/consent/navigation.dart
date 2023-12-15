import 'package:flutter/material.dart';
import 'package:canteen_booking/consent/colors.dart';
import 'package:canteen_booking/screen/categor.dart';
import 'package:canteen_booking/screen/faverite.dart';
import 'package:canteen_booking/screen/home.dart';
import 'package:canteen_booking/screen/profile.dart';
import 'package:canteen_booking/screen/search.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:qrscan/qrscan.dart' as scanner;

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int index = 0;
  String scannedData = '';

  List screen = [Home(), Category(), Search(), Favorite(), Profil()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _scanQRCode();

          setState(() {
            index = 0;
          });
        },
        child: Icon(Icons.qr_code),
        backgroundColor: maincolor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 27,
                  color: index == 0 ? maincolor : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: Icon(
                  Icons.category,
                  size: 27,
                  color: index == 1 ? maincolor : Colors.grey,
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 3;
                  });
                },
                child: Icon(
                  Icons.shopping_cart,
                  size: 27,
                  color: index == 3 ? maincolor : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 4;
                  });
                },
                child: Icon(
                  Icons.person,
                  size: 27,
                  color: index == 4 ? maincolor : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      body: screen[index],
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
