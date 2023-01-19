import 'package:flutter/material.dart';
import 'package:nwdi/module/home/view/home_view.dart';

class BottomWidget extends StatefulWidget {
  const BottomWidget({super.key});

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  int _selectIndex = 0;

  static const List<Widget> _widgetOption = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOption.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _selectIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 24.0,
            ),
            label: ('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today_outlined,
              size: 24.0,
            ),
            label: ('jadwal'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.article_outlined,
              size: 24.0,
            ),
            label: ('Artikel'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
              size: 24.0,
            ),
            label: ('Melontar'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_add_alt_1_outlined,
              size: 24.0,
            ),
            label: ('Profil'),
          ),
        ],
      ),
    );
  }
}
