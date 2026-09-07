import 'package:flutter/material.dart';
import 'package:operation_001/main.dart';

class UserMore extends StatefulWidget {
  const UserMore({super.key});

  @override
  State<UserMore> createState() => _UserMoreState();
}

class _UserMoreState extends State<UserMore> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'More & Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
            child: Text(
              'App Appearance',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
          ),

          // THEME SELECTION CARD
          Card(
            elevation: 0,
            color: theme.colorScheme.surfaceContainerHigh,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: theme.colorScheme.primary.withValues(alpha: 0.15),
              ),
            ),
            child: ValueListenableBuilder<ThemeMode>(
              valueListenable: themeNotifier,
              builder: (context, currentMode, _) {
                return Column(
                  children: [
                    RadioListTile<ThemeMode>(
                      title: const Text(
                        'System Default',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text('Matches your phone\'s system theme'),
                      secondary: Icon(
                        Icons.brightness_auto_rounded,
                        color: theme.colorScheme.primary,
                      ),
                      activeColor: theme.colorScheme.primary,
                      value: ThemeMode.system,
                      groupValue: currentMode,
                      onChanged: (ThemeMode? newMode) {
                        if (newMode != null) {
                          setState(() {
                            themeNotifier.value = newMode;
                          });
                        }
                      },
                    ),
                    Divider(
                      height: 1,
                      indent: 16,
                      endIndent: 16,
                      color: theme.colorScheme.outlineVariant,
                    ),
                    RadioListTile<ThemeMode>(
                      title: const Text(
                        'Light Mode',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      secondary: Icon(
                        Icons.wb_sunny_rounded,
                        color: theme.colorScheme.primary,
                      ),
                      activeColor: theme.colorScheme.primary,
                      value: ThemeMode.light,
                      groupValue: currentMode,
                      onChanged: (ThemeMode? newMode) {
                        if (newMode != null) {
                          setState(() {
                            themeNotifier.value = newMode;
                          });
                        }
                      },
                    ),
                    Divider(
                      height: 1,
                      indent: 16,
                      endIndent: 16,
                      color: theme.colorScheme.outlineVariant,
                    ),
                    RadioListTile<ThemeMode>(
                      title: const Text(
                        'Dark Mode',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      secondary: Icon(
                        Icons.nightlight_round,
                        color: theme.colorScheme.primary,
                      ),
                      activeColor: theme.colorScheme.primary,
                      value: ThemeMode.dark,
                      groupValue: currentMode,
                      onChanged: (ThemeMode? newMode) {
                        if (newMode != null) {
                          setState(() {
                            themeNotifier.value = newMode;
                          });
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}