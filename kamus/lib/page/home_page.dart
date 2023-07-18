import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kamus/page/new_page.dart';
import 'package:kamus/page/translate_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//
  double smallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double bigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

//index dan list Navbar
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    TranslatePage(),
    NewPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      /*  appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Kamus Batak'),
      ), */

      //
      body:

          //style background
          Stack(
        children: [
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
          ),
          Positioned(
            right: -smallDiameter(context) / 5,
            top: -smallDiameter(context) / 3,
            child: Container(
              width: smallDiameter(context),
              height: smallDiameter(context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [Color(0xFF764AF1), Color(0xFF9772FB)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
            ),
          ),
          Positioned(
            left: -smallDiameter(context) / 3,
            top: -smallDiameter(context) / 3,
            child: Container(
              child: Center(
                child: Text(
                  'Kamus Batak',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              width: bigDiameter(context),
              height: bigDiameter(context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [Color(0xFF764AF1), Color(0xFF9772FB)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
            ),
          ),

          // memanggil index navbar
          Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),

      //
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
          child: GNav(
            padding: EdgeInsets.all(10),
            onTabChange: _onItemTapped,
            selectedIndex: _selectedIndex,
            color: Color(0xFF9772FB),
            activeColor: Color(0xFFF32424),
            tabBackgroundColor: Colors.grey.shade200,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.home,
                text: 'Home',
              )
            ],
          ),
        ),
      ),
    );
  }
}
