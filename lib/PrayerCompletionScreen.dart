import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:operation_001/prayer_tracker.dart';

class PrayerCompletionScreen extends StatefulWidget {
  final bool isAmharic;
  final String detailValue;
  final String detailLabelEn;
  final String detailLabelAm;
  final String titleEn;
  final String titleAm;
  final String? subtitleEn;
  final String? subtitleAm;

  const PrayerCompletionScreen({
    super.key,
    required this.isAmharic,
    required this.detailValue,
    this.detailLabelEn = 'Prayer',
    this.detailLabelAm = 'ጸሎት',
    this.titleEn = 'Prayer Completed',
    this.titleAm = 'ጸሎቱ በስኬት ተጠናቋል',
    this.subtitleEn,
    this.subtitleAm,
  });

  @override
  State<PrayerCompletionScreen> createState() => _PrayerCompletionScreenState();
}

class _PrayerCompletionScreenState extends State<PrayerCompletionScreen> {
  int _currentStreak = 1;
  int _totalPrayers = 1;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _saveAndFetchProgress();
  }

  Future<void> _saveAndFetchProgress() async {
    try {
      final stats = await PrayerTracker.recordCompletion(widget.detailValue);
      if (mounted) {
        setState(() {
          _currentStreak = stats['streak'] ?? 1;
          _totalPrayers = stats['total'] ?? 1;
        });
      }
    } catch (e) {
      // Fallback log if SharedPreferences or platform plugin encounters an issue
      debugPrint('Error saving prayer completion progress: $e');
    } finally {
      // Always stop loading regardless of success or error
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0814),
      body: Stack(
        children: [
          // Background Image with Blur
          Positioned.fill(
            child: Image.asset(
              'assets/img_19.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  color: Colors.black.withOpacity(0.65),
                ),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),

                  // Completion Checkmark Icon
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFE8B84B).withOpacity(0.15),
                      border: Border.all(color: const Color(0xFFE8B84B), width: 2),
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      color: Color(0xFFE8B84B),
                      size: 52,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Header Title
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
                  const SizedBox(height: 8),

                  // Subtitle with Fallback Defaults
                  Text(
                    widget.isAmharic
                        ? (widget.subtitleAm ?? 'ጸሎትዎን በተሳካ ሁኔታ አጠናቀዋል')
                        : (widget.subtitleEn ?? 'May the grace of your prayer remain with you today.'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Georgia',
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.7),
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 36),

                  // --- STREAK & STATS CARDS ---
                  _isLoading
                      ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: CircularProgressIndicator(color: Color(0xFFE8B84B)),
                  )
                      : Row(
                    children: [
                      // Daily Streak Card
                      Expanded(
                        child: _buildStatTile(
                          icon: Icons.local_fire_department_rounded,
                          iconColor: Colors.orangeAccent,
                          value: '$_currentStreak',
                          label: widget.isAmharic ? 'ቀን ቅደም ተከተል' : 'Day Streak',
                        ),
                      ),
                      const SizedBox(width: 14),
                      // Total Completed Card
                      Expanded(
                        child: _buildStatTile(
                          icon: Icons.auto_awesome_rounded,
                          iconColor: const Color(0xFFE8B84B),
                          value: '$_totalPrayers',
                          label: widget.isAmharic ? 'ጠቅላላ ጸሎቶች' : 'Total Prayers',
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // Return Home Action Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE8B84B),
                        foregroundColor: const Color(0xFF1A0F2E),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      onPressed: () {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      },
                      child: Text(
                        widget.isAmharic ? 'ወደ መነሻ ገጽ ተመለስ' : 'RETURN HOME',
                        style: const TextStyle(
                          fontFamily: 'Georgia',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatTile({
    required IconData icon,
    required Color iconColor,
    required String value,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}