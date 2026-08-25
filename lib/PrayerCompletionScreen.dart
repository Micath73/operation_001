import 'package:operation_001/db_helper.dart';
import 'dart:ui';
import 'package:flutter/material.dart';

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
  final String?
  bgImagePath; // Path to background image (e.g. assets/images/prayer_bg.jpg)

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
    this.bgImagePath = 'assets/images/prayer_bg.jpg', // Default prayer bg asset
  });

  @override
  State<PrayerCompletionScreen> createState() => _PrayerCompletionScreenState();
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
    String selectedFilter = 'today';
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            backgroundColor: const Color(0xFF140C24).withOpacity(0.95),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: const Color(0xFFE8B84B).withOpacity(0.3)),
            ),
            title: Text(
              widget.isAmharic ? 'የጸሎት የታሪክ መዝገብ' : 'Prayer History Logs',
              style: const TextStyle(
                color: Color(0xFFE8B84B),
                fontFamily: 'Georgia',
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
                      future: DatabaseHelper.instance.getFilteredPrayerHistory(
                        selectedFilter,
                      ),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Color(0xFFE8B84B),
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
                              style: const TextStyle(color: Colors.white70),
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: history.length,
                          itemBuilder: (context, index) {
                            final entry = history[index];
                            final dt = DateTime.parse(entry['completed_at']);
                            final formattedTime =
                                "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')} (${dt.year}-${dt.month}-${dt.day})";
                            return ListTile(
                              dense: true,
                              leading: const Icon(
                                Icons.check_circle_outline,
                                color: Color(0xFFE8B84B),
                                size: 18,
                              ),
                              title: Text(
                                entry['prayer_name'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                "${entry['prayer_type']} • $formattedTime",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 11,
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
                  style: const TextStyle(color: Color(0xFFE8B84B)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _filterChip(
    String label,
    String value,
    String currentSelected,
    Function(String) onSelect,
  ) {
    final isSelected = value == currentSelected;
    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: ChoiceChip(
        label: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: isSelected ? Colors.black : Colors.white,
          ),
        ),
        selected: isSelected,
        selectedColor: const Color(0xFFE8B84B),
        backgroundColor: Colors.white.withOpacity(0.1),
        onSelected: (bool selected) {
          if (selected) onSelect(value);
        },
      ),
    );
  }

  void _showResetConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF140C24).withOpacity(0.95),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.redAccent.withOpacity(0.4)),
        ),
        title: Text(
          widget.isAmharic ? 'ጸሎትን እንደገና አስጀምር?' : 'Reset Today\'s Prayers?',
          style: const TextStyle(color: Colors.white, fontFamily: 'Georgia'),
        ),
        content: Text(
          widget.isAmharic
              ? 'የዛሬውን የጸሎት መዝገብ በሙሉ ማጽዳት ይፈልጋሉ?'
              : 'Do you want to reset all of today\'s logged prayers?',
          style: TextStyle(color: Colors.white.withOpacity(0.8)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              widget.isAmharic ? 'አይ' : 'Cancel',
              style: const TextStyle(color: Colors.white54),
            ),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await DatabaseHelper.instance.resetTodaysPrayers();
              await _refreshStatsOnly();
            },
            child: Text(
              widget.isAmharic ? 'አዎ' : 'Reset',
              style: const TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassCard({required Widget child, VoidCallback? onTap}) {
    return ClipRRect(
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
              color: Colors.white.withOpacity(0.07),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.15)),
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final displaySubtitle = widget.isAmharic
        ? (widget.subtitleAm ?? widget.detailValue)
        : (widget.subtitleEn ?? widget.detailValue);

    return Scaffold(
      body: Stack(
        children: [
          // 1. Background Image Asset
          Positioned.fill(
            child: widget.bgImagePath != null
                ? Image.asset(
                    widget.bgImagePath!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Container(color: const Color(0xFF0D0814)),
                  )
                : Container(color: const Color(0xFF0D0814)),
          ),

          // 2. Frosted Glass Blur & Dark Overlay
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
              child: Container(color: Colors.black.withOpacity(0.55)),
            ),
          ),

          // 3. Foreground Content
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
                  // Golden Check Ring
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFE8B84B).withOpacity(0.15),
                      border: Border.all(
                        color: const Color(0xFFE8B84B),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE8B84B).withOpacity(0.25),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      color: Color(0xFFE8B84B),
                      size: 52,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    widget.isAmharic ? widget.titleAm : widget.titleEn,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Georgia',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.1,
                    ),
                  ),
                  if (displaySubtitle.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      displaySubtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFFE8B84B),
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                  const SizedBox(height: 36),
                  _isLoading
                      ? const CircularProgressIndicator(
                          color: Color(0xFFE8B84B),
                        )
                      : Row(
                          children: [
                            // 1. Streak Card
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
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
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
                                        color: Colors.white.withOpacity(0.6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 14),

                            // 2. Total Prayers Card + Embedded Corner Reset Button
                            Expanded(
                              child: Stack(
                                children: [
                                  _buildGlassCard(
                                    onTap: _showPrayerHistoryDialog,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.auto_awesome_rounded,
                                          color: Color(0xFFE8B84B),
                                          size: 28,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          '$_totalPrayers',
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
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
                                            color: Colors.white.withOpacity(
                                              0.6,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Reset icon overlaid neatly on the top-right corner
                                  Positioned(
                                    top: 2,
                                    right: 2,
                                    child: IconButton(
                                      splashRadius: 18,
                                      icon: Icon(
                                        Icons.refresh_rounded,
                                        size: 18,
                                        color: Colors.white.withOpacity(0.4),
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
                  // Golden Glass Return Button
                  Container(
                    width: double.infinity,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFE8B84B), Color(0xFFC5952B)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE8B84B).withOpacity(0.3),
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
                        Navigator.of(
                          context,
                        ).popUntil((route) => route.isFirst);
                      },
                      child: Text(
                        widget.isAmharic ? 'ወደ መነሻ ገጽ ተመለስ' : 'RETURN HOME',
                        style: const TextStyle(
                          fontFamily: 'Georgia',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A0F2E),
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
