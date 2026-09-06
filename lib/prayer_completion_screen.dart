import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:operation_001/db_helper.dart';

class PrayerCompletionScreen extends StatefulWidget {
  final bool isAmharic;
  final String detailValue;
  final String prayerType;
  final String titleEn;
  final String titleAm;
  final String? detailLabelEn;
  final String? detailLabelAm;
  final String? subtitleEn;
  final String? subtitleAm;
  final String? bgImagePath;

  const PrayerCompletionScreen({
    super.key,
    required this.isAmharic,
    required this.detailValue,
    this.prayerType = 'Rosary',
    this.titleEn = 'Prayer Completed',
    this.titleAm = 'ጸሎቱ በስኬት ተጠናቋል',
    this.detailLabelEn,
    this.detailLabelAm,
    this.subtitleEn,
    this.subtitleAm,
    this.bgImagePath = 'assets/images/prayer_bg.jpg',
  });

  @override
  State<PrayerCompletionScreen> createState() =>
      _PrayerCompletionScreenState();
}

class _PrayerCompletionScreenState extends State<PrayerCompletionScreen> {
  int _currentStreak = 0;
  int _totalPrayers = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _saveAndFetchProgress();
  }

  Future<void> _saveAndFetchProgress() async {
    await DatabaseHelper.instance.logPrayerCompletion(
      prayerType: widget.prayerType,
      prayerName: widget.detailValue.isNotEmpty
          ? widget.detailValue
          : widget.prayerType,
    );
    if (!mounted) return;
    await _refreshStatsOnly();
  }

  Future<void> _refreshStatsOnly() async {
    final total = await DatabaseHelper.instance.getTotalPrayersCount();
    final streak = await DatabaseHelper.instance.calculateStreak();
    if (mounted) {
      setState(() {
        _totalPrayers = total;
        _currentStreak = streak;
        _isLoading = false;
      });
    }
  }

  void _showPrayerHistoryDialog() {
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (context) {
        String selectedFilter = 'today';
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              backgroundColor: Colors.black.withAlpha(220),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: (theme.colorScheme.secondary).withAlpha(100),
                ),
              ),
              title: Text(
                widget.isAmharic ? 'የጸሎት የታሪክ መዝገብ' : 'Prayer History Logs',
                style: TextStyle(
                  color: theme.colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              content: SizedBox(
                width: double.maxFinite,
                height: 380,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _filterChip('Today', 'today', selectedFilter, (val) {
                            setDialogState(() => selectedFilter = val);
                          }),
                          _filterChip('Yesterday', 'yesterday', selectedFilter, (
                              val,
                              ) {
                            setDialogState(() => selectedFilter = val);
                          }),
                          _filterChip(
                            'Last 7 Days',
                            'last_week',
                            selectedFilter,
                                (val) {
                              setDialogState(() => selectedFilter = val);
                            },
                          ),
                          _filterChip(
                            'Last 30 Days',
                            'last_month',
                            selectedFilter,
                                (val) {
                              setDialogState(() => selectedFilter = val);
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: FutureBuilder<List<Map<String, dynamic>>>(
                        key: ValueKey(selectedFilter),
                        future: DatabaseHelper.instance
                            .getFilteredPrayerHistory(selectedFilter),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: theme.colorScheme.secondary,
                              ),
                            );
                          }
                          final history = snapshot.data!;
                          if (history.isEmpty) {
                            return Center(
                              child: Text(
                                widget.isAmharic
                                    ? 'በዚህ ጊዜ ውስጥ የተመዘገበ ጸሎት የለም'
                                    : 'No prayer records found for this filter.',
                                style: TextStyle(
                                  color: Colors.white.withAlpha(180),
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }
                          return ListView.builder(
                            itemCount: history.length,
                            itemBuilder: (context, index) {
                              final entry = history[index];
                              final dt = DateTime.parse(
                                entry['completed_at'] as String,
                              );
                              final formattedTime =
                                  "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')} (${dt.year}-${dt.month}-${dt.day})";
                              return ListTile(
                                dense: true,
                                leading: Icon(
                                  Icons.check_circle_outline,
                                  color: theme.colorScheme.secondary,
                                  size: 18,
                                ),
                                title: Text(
                                  entry['prayer_name'] as String? ?? 'Prayer',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                subtitle: Text(
                                  "${entry['prayer_type']} • $formattedTime",
                                  style: TextStyle(
                                    color: Colors.white.withAlpha(140),
                                    fontSize: 12,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    widget.isAmharic ? 'ዝጋ' : 'Close',
                    style: TextStyle(color: theme.colorScheme.secondary),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _filterChip(
      String label,
      String value,
      String currentSelected,
      Function(String) onSelect,
      ) {
    final theme = Theme.of(context);
    final isSelected = value == currentSelected;

    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: ChoiceChip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? theme.colorScheme.onSecondary
                : Colors.white.withAlpha(220),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 12,
          ),
        ),
        selected: isSelected,
        selectedColor: theme.colorScheme.secondary,
        backgroundColor: Colors.white.withAlpha(25),
        onSelected: (bool selected) {
          if (selected) onSelect(value);
        },
      ),
    );
  }

  void _showResetConfirmationDialog() {
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black.withAlpha(220),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: theme.colorScheme.error.withAlpha(100),
          ),
        ),
        title: Text(
          widget.isAmharic ? 'ጸሎትን እንደገና አስጀምር?' : 'Reset Today\'s Prayers?',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        content: Text(
          widget.isAmharic
              ? 'የዛሬውን የጸሎት መዝገብ በሙሉ ማጽዳት ይፈልጋሉ?'
              : 'Do you want to reset all of today\'s logged prayers?',
          style: TextStyle(
            color: Colors.white.withAlpha(200),
            fontSize: 14,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              widget.isAmharic ? 'አይ' : 'Cancel',
              style: TextStyle(
                color: Colors.white.withAlpha(140),
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await DatabaseHelper.instance.resetTodaysPrayers();
              if (mounted) {
                await _refreshStatsOnly();
              }
            },
            child: Text(
              widget.isAmharic ? 'አዎ' : 'Reset',
              style: TextStyle(color: theme.colorScheme.error),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassCard({required Widget child, VoidCallback? onTap}) {
    final theme = Theme.of(context);

    return CustomPaint(
      painter: GradientBorderPainter(
        strokeWidth: 1.2,
        radius: 20,
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.secondary.withAlpha(166),
            Colors.white.withAlpha(26),
            theme.colorScheme.primary.withAlpha(89),
            Colors.white.withAlpha(128),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(64),
                borderRadius: BorderRadius.circular(20),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final displaySubtitle = widget.isAmharic
        ? (widget.subtitleAm ?? widget.detailValue)
        : (widget.subtitleEn ?? widget.detailValue);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. Background Image Asset
          Positioned.fill(
            child: widget.bgImagePath != null
                ? Image.asset(
              widget.bgImagePath!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Container(color: Colors.black),
            )
                : Container(color: Colors.black),
          ),

          // 2. Fixed Dark Blur Scrim (Prevents Light Mode Washout)
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                child: Container(
                  color: Colors.black.withAlpha(140),
                ),
              ),
            ),
          ),

          // 3. UI Content Area
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),

                  // Completion Check Icon
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.colorScheme.secondary.withAlpha(40),
                      border: Border.all(
                        color: theme.colorScheme.secondary,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.secondary.withAlpha(70),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      color: theme.colorScheme.secondary,
                      size: 52,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Title Text
                  Text(
                    widget.isAmharic ? widget.titleAm : widget.titleEn,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white,
                      letterSpacing: 1.1,
                      shadows: [
                        Shadow(
                          blurRadius: 8,
                          color: Colors.black.withAlpha(153),
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),

                  // Subtitle Text
                  if (displaySubtitle.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      displaySubtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: theme.colorScheme.secondary,
                        fontStyle: FontStyle.italic,
                        fontSize: 15,
                        shadows: [
                          Shadow(
                            blurRadius: 6,
                            color: Colors.black.withAlpha(204),
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 36),

                  // Stats Row
                  _isLoading
                      ? CircularProgressIndicator(
                    color: theme.colorScheme.secondary,
                  )
                      : Row(
                    children: [
                      // Day Streak Card
                      Expanded(
                        child: _buildGlassCard(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.local_fire_department_rounded,
                                color: Colors.orangeAccent,
                                size: 28,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '$_currentStreak',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                widget.isAmharic
                                    ? 'ቀን ቅደም ተከተል'
                                    : 'Day Streak',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white.withAlpha(153),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),

                      // Total Prayers Card
                      Expanded(
                        child: Stack(
                          children: [
                            _buildGlassCard(
                              onTap: _showPrayerHistoryDialog,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.auto_awesome_rounded,
                                    color: theme.colorScheme.secondary,
                                    size: 28,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '$_totalPrayers',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    widget.isAmharic
                                        ? 'ጠቅላላ ጸሎቶች'
                                        : 'Total Prayers',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white.withAlpha(153),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 4,
                              right: 4,
                              child: IconButton(
                                splashRadius: 18,
                                icon: Icon(
                                  Icons.refresh_rounded,
                                  size: 18,
                                  color: Colors.white.withAlpha(100),
                                ),
                                onPressed: _showResetConfirmationDialog,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // Return Home Button
                  Container(
                    width: double.infinity,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.secondary,
                          theme.colorScheme.secondary.withAlpha(200),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.secondary.withAlpha(80),
                          blurRadius: 15,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                      child: Text(
                        widget.isAmharic ? 'ወደ መነሻ ገጽ ተመለስ' : 'RETURN HOME',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSecondary,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  final double strokeWidth;
  final double radius;
  final Gradient gradient;

  GradientBorderPainter({
    required this.strokeWidth,
    required this.radius,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    final RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    final Paint paint =
    Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..shader = gradient.createShader(rect);

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}