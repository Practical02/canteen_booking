import 'package:flutter/material.dart';
import 'package:canteen_booking/consent/colors.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  List<Icon> icons = <Icon>[
    Icon(Icons.person, color: maincolor),
    Icon(Icons.settings, color: maincolor),
    Icon(Icons.note_add, color: maincolor),
    Icon(Icons.favorite, color: maincolor),
    Icon(Icons.chat, color: maincolor),
    Icon(Icons.login, color: maincolor),
  ];

  List titls = [
    'Perconal data',
    'Settings',
    'E-Statement',
    'Refferal Code',
    'FAQs',
    'Logout'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: maincolor, width: 2),
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/p3.jpg'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'John Doe',
            style: TextStyle(fontSize: 18, color: font, fontFamily: 'ro'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              height: 40,
              thickness: 2,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Container(
                  width: 37,
                  height: 37,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: icons[index],
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    titls[index],
                    style: TextStyle(fontSize: 17, color: font),
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 15,
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}
