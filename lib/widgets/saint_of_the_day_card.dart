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

    return ListenableBuilder(
      listenable: activeController,
      builder: (context, _) {
        final primary = saint ?? activeController.primaryTodaySaint;

        if (primary == null || activeController.isLoading) {
          return Container(
            height: 280,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        final extraCount = activeController.allTodaySaints.length > 1
            ? activeController.allTodaySaints.length - 1
            : 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: GestureDetector(
            onTap: () => _handleTap(context, activeController, primary),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  // EXPANDED PORTRAIT CARD RATIO (3:4 aspect ratio gives generous vertical headroom)
                  AspectRatio(
                    aspectRatio: 3 / 4,
                    child: Image.asset(
                      primary.imagePath.isNotEmpty ? primary.imagePath : 'assets/saints/placeholder.jpg',
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/saints/placeholder.jpg',
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          errorBuilder: (context, secondError, secondStackTrace) {
                            return Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
                                ),
                              ),
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.church_rounded,
                                      size: 56,
                                      color: Color(0xFFC9A24B),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Feast Day Reflection',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                        letterSpacing: 0.8,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),

                  // GRADIENT OVERLAY
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.85),
                          ],
                          stops: const [0.4, 1.0],
                        ),
                      ),
                    ),
                  ),

                  // EXTRA FEASTS BADGE
                  if (extraCount > 0)
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.65),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white30),
                        ),
                        child: Text(
                          '+$extraCount Other Feast${extraCount > 1 ? 's' : ''} Today',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                  // CARD TITLE & LITURGICAL RANK
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (primary.isSolemnity)
                          const Text(
                            'SOLEMNITY',
                            style: TextStyle(
                              color: Color(0xFFC9A24B),
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        Text(
                          primary.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
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

  void _handleTap(BuildContext context, SaintOfTheDayController ctrl, SaintModel primary) {
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