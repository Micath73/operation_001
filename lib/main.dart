import 'package:flutter/material.dart';
import 'package:operation_001/pages/bible.dart';
import 'package:operation_001/pages/daily.dart';
import 'package:operation_001/pages/home.dart';
import 'package:operation_001/pages/library.dart';
import 'package:operation_001/pages/more.dart';

void main()=>runApp(MaterialApp(

  home: Home(),

));

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex=0;
  void _navigationBar(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

  final List<Widget> _pages=[
    UserHome(),
    UserBible(),
    UserDaily(),
    UserLibrary(),
    UserMore(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: IndexedStack(
          index: _selectedIndex,
          children: _pages),
      bottomNavigationBar: BottomNavigationBar(


          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        unselectedLabelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),

        type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _navigationBar,

          items:[
            
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'menu'),
            BottomNavigationBarItem(icon: Icon(Icons.today), label: 'daily'),
            BottomNavigationBarItem(icon: Icon(Icons.auto_stories), label: 'library'),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'more'),
          ]),
      
      
    );
  }
}
