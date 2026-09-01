import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:operation_001/pages/bible.dart';
import 'package:operation_001/pages/home.dart';
import 'package:operation_001/pages/mass.dart';
import 'package:operation_001/pages/more.dart';
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
      themeMode: ThemeMode.system,
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

  final List<Widget> _pages = const [
    UserHome(),
    UserBible(),
    UserMass(),
    UserMore(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: isDark
                  ? Colors.black.withValues(alpha: 0.3)
                  : Colors.black.withValues(alpha: 0.08),
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: theme.colorScheme.primary.withValues(alpha: 0.15),
              hoverColor: theme.colorScheme.primary.withValues(alpha: 0.08),
              gap: 8,
              activeColor: theme.colorScheme.primary,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor:
              theme.colorScheme.primaryContainer.withValues(alpha: 0.4),
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              tabs: const [
                GButton(
                  icon: Icons.home_rounded,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.menu_book_rounded,
                  text: 'Bible',
                ),
                GButton(
                  icon: Icons.church_rounded,
                  text: 'Mass',
                ),
                GButton(
                  icon: Icons.more_horiz_rounded,
                  text: 'More',
                ),
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