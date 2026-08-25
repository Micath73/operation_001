import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:operation_001/pages/bible.dart';
import 'package:operation_001/pages/daily.dart';
import 'package:operation_001/pages/home.dart';
import 'package:operation_001/pages/more.dart';
import 'package:operation_001/theme.dart';
import 'package:operation_001/theme.dart';

void main() => runApp(const CatholicApp());

class CatholicApp extends StatelessWidget {
  const CatholicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catholic Prayer App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Automatically adapts to Light/Dark mode
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const UserHome(),
    const UserBible(),
    const UserDaily(),
    const UserMore(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.08),
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: theme.colorScheme.primary.withOpacity(0.1),
              hoverColor: theme.colorScheme.primary.withOpacity(0.05),
              gap: 8,
              activeColor:
                  theme.colorScheme.primary, // Uses 0xFF4A2574 (Deep Violet)
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: theme.colorScheme.primary.withOpacity(0.12),
              color: theme.colorScheme.onSurface.withOpacity(0.6),
              tabs: const [
                GButton(icon: Icons.home, text: 'Home'),
                GButton(icon: Icons.menu_book, text: 'Bible'),
                GButton(icon: Icons.auto_awesome, text: 'Daily'),
                GButton(icon: Icons.more_horiz, text: 'More'),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() => _selectedIndex = index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
