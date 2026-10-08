import 'package:flutter/material.dart';
import 'package:operation_001/controllers/language_controller.dart';

class AppNavigationDrawer extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const AppNavigationDrawer({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ListenableBuilder(
      listenable: LanguageController.instance,
      builder: (context, _) {
        final langCtrl = LanguageController.instance;
        final isAmharic = langCtrl.isAmharic;

        return Drawer(
          backgroundColor: theme.colorScheme.surface,
          child: Column(
            children: [
              // ── TELEGRAM-STYLE HEADER ──
              Container(
                padding: EdgeInsets.fromLTRB(
                  20,
                  MediaQuery.of(context).padding.top + 16,
                  16,
                  20,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: isDark
                        ? [
                      theme.colorScheme.surfaceContainerHighest,
                      theme.colorScheme.surfaceContainer,
                    ]
                        : [
                      theme.colorScheme.primary,
                      theme.colorScheme.primary.withValues(alpha: 0.85),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: isDark
                              ? theme.colorScheme.primary.withValues(alpha: 0.2)
                              : Colors.white.withValues(alpha: 0.2),
                          child: Icon(
                            Icons.church_rounded,
                            color: isDark
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onPrimary,
                            size: 28,
                          ),
                        ),
                        // Telegram-style Animated Sun/Moon Toggle Button
                        IconButton(
                          tooltip: isAmharic ? 'ጭብጥ ቀይር' : 'Toggle Theme',
                          style: IconButton.styleFrom(
                            backgroundColor: isDark
                                ? Colors.white.withValues(alpha: 0.1)
                                : Colors.white.withValues(alpha: 0.2),
                          ),
                          icon: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            transitionBuilder: (child, anim) => RotationTransition(
                              turns: anim,
                              child: ScaleTransition(scale: anim, child: child),
                            ),
                            child: Icon(
                              isDarkMode
                                  ? Icons.wb_sunny_rounded
                                  : Icons.dark_mode_rounded,
                              key: ValueKey(isDarkMode),
                              color: isDark
                                  ? const Color(0xFFE5C158)
                                  : theme.colorScheme.onPrimary,
                              size: 22,
                            ),
                          ),
                          onPressed: () => onThemeChanged(!isDarkMode),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      isAmharic
                          ? 'ካቶሊካዊ የጸሎት ማዕከል'
                          : 'Catholic Devotional Hub',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontFamily: 'Serif',
                        fontWeight: FontWeight.bold,
                        color: isDark
                            ? theme.colorScheme.onSurface
                            : theme.colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Pax Vobiscum • Peace be with you',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontFamily: 'Serif',
                        fontStyle: FontStyle.italic,
                        color: isDark
                            ? theme.colorScheme.onSurfaceVariant
                            : theme.colorScheme.onPrimary.withValues(alpha: 0.85),
                      ),
                    ),
                  ],
                ),
              ),

              // ── DRAWER NAVIGATION MENU ──
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  children: [
                    _buildSectionHeader(
                      context,
                      isAmharic ? 'መንፈሳዊ ሕይወት' : 'SPIRITUAL LIFE',
                    ),
                    _buildDrawerTile(
                      context,
                      icon: Icons.bookmark_border_rounded,
                      title: isAmharic
                          ? 'የተቀመጡ ጸሎቶች እና ሐሳቦች'
                          : 'Saved Prayers & Intentions',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _buildDrawerTile(
                      context,
                      icon: Icons.notifications_active_outlined,
                      title: isAmharic ? 'የጸሎት ማስታወሻዎች' : 'Prayer Reminders',
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          isAmharic ? 'መልአከ እግዚአብሔር / ምሕረት' : 'Angelus / Mercy',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _buildDrawerTile(
                      context,
                      icon: Icons.auto_graph_rounded,
                      title: isAmharic
                          ? 'የኖቬና እና ትምህርት እድገት'
                          : 'Novena & Lesson Progress',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),

                    const Divider(height: 24, indent: 12, endIndent: 12),

                    _buildSectionHeader(
                      context,
                      isAmharic ? 'ማስተካከያዎች' : 'SETTINGS & PREFERENCES',
                    ),

                    // ── PRO LANGUAGE SWITCHER TILE ──
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: theme.colorScheme.outlineVariant
                              .withValues(alpha: 0.5),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.language_rounded,
                              color: theme.colorScheme.primary,
                              size: 22,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    isAmharic
                                        ? 'የመተግበሪያ ቋንቋ'
                                        : 'App Language',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: theme.colorScheme.onSurface,
                                    ),
                                  ),
                                  Text(
                                    isAmharic
                                        ? 'አማርኛ (ኢትዮጵያ)'
                                        : 'English (US)',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: theme.colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Segmented Language Toggle Pill
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: theme.colorScheme.outline
                                      .withValues(alpha: 0.2),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _buildLangSegment(
                                    label: 'አማ',
                                    isSelected: isAmharic,
                                    onTap: () => langCtrl.setLanguage('am'),
                                    theme: theme,
                                  ),
                                  _buildLangSegment(
                                    label: 'EN',
                                    isSelected: !isAmharic,
                                    onTap: () => langCtrl.setLanguage('en'),
                                    theme: theme,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    _buildDrawerTile(
                      context,
                      icon: Icons.palette_outlined,
                      title: isAmharic ? 'የመተግበሪያ ገጽታ' : 'App Theme',
                      trailing: Text(
                        isDarkMode
                            ? (isAmharic ? 'ጨለማ ገጽታ' : 'Dark Mode')
                            : (isAmharic ? 'ብርሃን ገጽታ' : 'Light Mode'),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      onTap: () => onThemeChanged(!isDarkMode),
                    ),

                    const Divider(height: 24, indent: 12, endIndent: 12),

                    _buildSectionHeader(
                      context,
                      isAmharic ? 'ስለ መተግበሪያው' : 'ABOUT & CREDENTIALS',
                    ),
                    _buildDrawerTile(
                      context,
                      icon: Icons.verified_user_outlined,
                      title: isAmharic
                          ? 'የካቶሊክ ትምህርተ ክርስቶስ ምንጮች'
                          : 'Catholic Doctrine Sources',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _buildDrawerTile(
                      context,
                      icon: Icons.info_outline_rounded,
                      title: isAmharic ? 'ስለ መተግበሪያው' : 'About App',
                      onTap: () {
                        Navigator.pop(context);
                        showAboutDialog(
                          context: context,
                          applicationName: isAmharic
                              ? 'ካቶሊካዊ የጸሎት ማዕከል'
                              : 'Catholic Devotional Hub',
                          applicationVersion: '1.2.0',
                          applicationIcon: Icon(
                            Icons.church_rounded,
                            color: theme.colorScheme.primary,
                            size: 32,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Footer
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Ad Maiorem Dei Gloriam',
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontFamily: 'Serif',
                    fontStyle: FontStyle.italic,
                    color: theme.colorScheme.outline,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget _buildDrawerTile(
      BuildContext context, {
        required IconData icon,
        required String title,
        Widget? trailing,
        required VoidCallback onTap,
      }) {
    final theme = Theme.of(context);

    return ListTile(
      dense: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      leading: Icon(icon, color: theme.colorScheme.onSurfaceVariant, size: 22),
      title: Text(
        title,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget _buildLangSegment({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    required ThemeData theme,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: isSelected
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}