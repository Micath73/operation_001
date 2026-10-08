import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:operation_001/controllers/saint_of_the_day_controller.dart';
import 'package:operation_001/models/saint_model.dart';
import 'package:operation_001/screens/saint_detail_screen.dart';

class SaintOfDayCard extends StatelessWidget {
  final SaintOfTheDayController? controller;
  final SaintModel? saint;

  const SaintOfDayCard({
    super.key,
    this.controller,
    this.saint,
  });

  @override
  Widget build(BuildContext context) {
    final activeController = controller ?? SaintOfTheDayController.instance;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListenableBuilder(
      listenable: activeController,
      builder: (context, _) {
        final primary = saint ?? activeController.primaryTodaySaint;

        if (primary == null || activeController.isLoading) {
          return Container(
            height: 140,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        final extraCount = activeController.allTodaySaints.length > 1
            ? activeController.allTodaySaints.length - 1
            : 0;

        return GestureDetector(
          onTap: () => _handleTap(context, activeController, primary),
          child: Container(
            height: 140,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  colorScheme.primary,
                  Color.lerp(colorScheme.primary, Colors.black, 0.35)!,
                ],
              ),
              border: Border.all(
                color: colorScheme.secondary.withValues(alpha: 0.35),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.25),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  // Ambient light glow spot in the background
                  Positioned(
                    right: -20,
                    top: -20,
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorScheme.secondary.withValues(alpha: 0.18),
                      ),
                    ),
                  ),

                  // Main Content Row
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        // 1. Saint Portrait Frame
                        Container(
                          width: 100,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: colorScheme.secondary.withValues(alpha: 0.5),
                              width: 1.2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.3),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Image.asset(
                              primary.imagePath.isNotEmpty
                                  ? primary.imagePath
                                  : 'assets/saints/placeholder.jpg',
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: const Color(0xFF1E293B),
                                  child: const Icon(
                                    Icons.church_rounded,
                                    color: Color(0xFFC9A24B),
                                    size: 36,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        const SizedBox(width: 14),

                        // 2. Info Column (High Contrast White & Gold Text)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    primary.isSolemnity ? 'SOLEMNITY' : 'SAINT OF THE DAY',
                                    style: TextStyle(
                                      color: colorScheme.secondary,
                                      fontSize: 10.5,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  if (extraCount > 0) ...[
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: colorScheme.secondary.withValues(alpha: 0.22),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        '+$extraCount More',
                                        style: TextStyle(
                                          color: colorScheme.secondary,
                                          fontSize: 9.5,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                primary.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white, // Crisp white contrast
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 10),
                              // Gold Action Badge
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Reflect Today',
                                      style: TextStyle(
                                        color: colorScheme.onSecondary,
                                        fontSize: 11.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      size: 13,
                                      color: colorScheme.onSecondary,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleTap(
      BuildContext context, SaintOfTheDayController ctrl, SaintModel primary) {
    final saints = ctrl.allTodaySaints;

    if (saints.length <= 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SaintDetailScreen(saint: primary),
        ),
      );
      return;
    }

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return SafeArea(
          child: Container(
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(sheetContext).colorScheme.surface,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Commemorated Today',
                      style: Theme.of(sheetContext).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    itemCount: saints.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (_, index) {
                      final s = saints[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: const Color(0xFF1E293B),
                          foregroundImage: AssetImage(
                            s.imagePath.isNotEmpty ? s.imagePath : 'assets/saints/placeholder.jpg',
                          ),
                          child: const Icon(Icons.church, size: 18, color: Color(0xFFC9A24B)),
                        ),
                        title: Text(s.name),
                        subtitle: Text(
                          s.isPrimary
                              ? (s.isSolemnity ? 'Solemnity' : 'Primary Feast')
                              : 'Optional Memorial',
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.of(sheetContext).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SaintDetailScreen(saint: s),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        );
      },
    );
  }
}