import 'dart:math' as math;
import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:operation_001/db_helper.dart';
import 'package:operation_001/widgets/completion_effects.dart';

// GradientBorderPainter moved to completion_effects.dart; re-exported so any
// existing import of this file keeps compiling.
export 'package:operation_001/widgets/completion_effects.dart'
    show GradientBorderPainter;

const _kBg = Color(0xFF0B0B10);
const _kEthiopic = ['Noto Sans Ethiopic', 'Abyssinica SIL', 'Kefa'];
const _kMilestones = {3, 7, 14, 21, 30, 40, 50, 100, 200, 365};

// Short closing words, one per day (rotates by day-of-year).
// Amharic lines are drafts: please have them reviewed.
const _kBlessings = <(String, String)>[
  ('The Lord bless you and keep you.', 'እግዚአብሔር ይባርክህ ይጠብቅህም።'),
  ('Go in peace.', 'በሰላም ሂዱ።'),
  ('Peace be with you.', 'ሰላም ለእናንተ ይሁን።'),
  ('Give thanks to the Lord, for he is good.', 'እግዚአብሔርን አመስግኑ፤ ቸር ነውና።'),
  ('The Lord is near to all who call on him.', 'እግዚአብሔር ለሚጠሩት ሁሉ ቅርብ ነው።'),
  ('My soul rests in God alone.', 'ነፍሴ በእግዚአብሔር ብቻ ታርፋለች።'),
];

class PrayerCompletionScreen extends StatefulWidget {
  final bool isAmharic;
  final String detailValue;
  final String prayerType;
  final String titleEn;
  final String titleAm;

  /// Reserved (currently unused) so existing call sites keep compiling.
  final String? detailLabelEn;
  final String? detailLabelAm;
  final String? subtitleEn;
  final String? subtitleAm;
  final String? bgImagePath;

  /// Unique id for THIS completion (e.g. a timestamp or UUID created where the
  /// screen is pushed). Prevents a double push from logging twice in-session.
  /// For a durable guarantee also add a UNIQUE index in SQLite and use
  /// INSERT OR IGNORE.
  final String? completionId;

  const PrayerCompletionScreen({
    super.key,
    required this.isAmharic,
    required this.detailValue,
    this.prayerType = 'Rosary',
    this.titleEn = 'Prayer Completed',
    this.titleAm = 'ጸሎትዎ ተፈጽሟል',
    this.detailLabelEn,
    this.detailLabelAm,
    this.subtitleEn,
    this.subtitleAm,
    this.bgImagePath = 'assets/images/prayer_bg.jpg',
    this.completionId,
  });

  @override
  State<PrayerCompletionScreen> createState() => _PrayerCompletionScreenState();
}

class _PrayerCompletionScreenState extends State<PrayerCompletionScreen>
    with TickerProviderStateMixin {
  static final Set<String> _handledCompletions = {};

  /// Entrance sequence: badge, text, cards, button (one controller, sliced).
  late final AnimationController _enter;

  /// "Data reveal": counts, flame pop, +N chip, week dots. Starts when the
  /// stats are loaded AND the entrance has reached the cards.
  late final AnimationController _count;

  int _streak = 0, _total = 0, _fromStreak = 0, _fromTotal = 0;
  List<bool> _week = List.filled(7, false);
  bool _statsReady = false;
  bool _loggedOk = false;
  bool _entranceStarted = false;
  bool _countStarted = false;
  bool _buzzed = false;

  @override
  void initState() {
    super.initState();
    _enter = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..addListener(() {
      if (!_buzzed && _enter.value >= 0.62) {
        _buzzed = true;
        HapticFeedback.mediumImpact(); // the check has just landed
      }
      _tryStartCount();
    });
    _count = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );
    _saveAndFetchProgress();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _buzzed = true;
      _countStarted = true;
      _enter.value = 1;
      _count.value = 1;
    } else if (!_entranceStarted) {
      _entranceStarted = true;
      _enter.forward();
    }
  }

  @override
  void dispose() {
    _enter.dispose();
    _count.dispose();
    super.dispose();
  }

  // ------------------------------------------------------------------ data

  void _tryStartCount() {
    if (_statsReady && !_countStarted && _enter.value >= 0.55) {
      _countStarted = true;
      _count.forward();
    }
  }

  Future<void> _saveAndFetchProgress() async {
    final db = DatabaseHelper.instance;

    // Synchronous, before any await, so two screens racing can't both log.
    final id = widget.completionId;
    final isDuplicate = id != null && !_handledCompletions.add(id);

    // Snapshot BEFORE logging so the numbers can tick 41 -> 42, not 0 -> 42.
    int? prevTotal, prevStreak;
    try {
      prevTotal = await db.getTotalPrayersCount();
      prevStreak = await db.calculateStreak();
    } catch (e) {
      debugPrint('Error reading progress before logging: $e');
    }

    if (!isDuplicate) {
      try {
        await db.logPrayerCompletion(
          prayerType: widget.prayerType,
          prayerName: widget.detailValue.isNotEmpty
              ? widget.detailValue
              : widget.prayerType,
        );
        _loggedOk = true;
      } catch (e) {
        // They already prayed; don't strand them. Stats just won't move.
        debugPrint('Error logging prayer completion: $e');
      }
    }
    if (!mounted) return;
    await _loadStats(prevTotal: prevTotal, prevStreak: prevStreak);
  }

  Future<void> _loadStats({int? prevTotal, int? prevStreak}) async {
    try {
      final db = DatabaseHelper.instance;
      final total = await db.getTotalPrayersCount();
      final streak = await db.calculateStreak();
      final rows = await db.getFilteredPrayerHistory('last_week');
      if (!mounted) return;
      setState(() {
        _total = total;
        _streak = streak;
        _fromTotal = prevTotal ?? total;
        _fromStreak = prevStreak ?? streak;
        _week = _weekFlags(rows);
        _statsReady = true;
      });
      _tryStartCount();
    } catch (e) {
      // Cards keep their "–" placeholder instead of a spinner that never ends.
      debugPrint('Error loading progress: $e');
    }
  }

  /// Last 7 calendar days (oldest -> today): did the user pray that day?
  List<bool> _weekFlags(List<Map<String, dynamic>> rows) {
    final days = <DateTime>{};
    for (final r in rows) {
      final dt = DateTime.tryParse('${r['completed_at']}');
      if (dt != null) {
        final l = dt.toLocal(); // stored times may be UTC
        days.add(DateTime(l.year, l.month, l.day));
      }
    }
    final now = DateTime.now();
    return List.generate(7, (i) {
      final d = DateTime(now.year, now.month, now.day - (6 - i));
      return days.contains(d) || (i == 6 && _loggedOk);
    });
  }

  Future<void> _resetToday() async {
    await DatabaseHelper.instance.resetTodaysPrayers();
    _loggedOk = false;
    await _loadStats(); // no prev values -> no "+1" celebration
  }

  // ------------------------------------------------------------------ helpers

  Color get _accent {
    final base = Theme.of(context).colorScheme.secondary;
    final hsl = HSLColor.fromColor(base);
    // The screen is always dark, so make sure the accent is bright enough.
    return hsl.lightness < 0.6
        ? hsl
        .withLightness(0.68)
        .withSaturation(math.min(hsl.saturation, 0.75))
        .toColor()
        : base;
  }

  String _t(String en, String am) => widget.isAmharic ? am : en;

  TextStyle _style(
      double size, {
        FontWeight? weight,
        Color color = Colors.white,
        double spacing = 0,
        bool italic = false,
        double? height,
      }) {
    final am = widget.isAmharic;
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: color,
      // Ge'ez is a syllabary: no tracking, no synthetic italics.
      letterSpacing: am ? 0 : spacing,
      fontStyle: (italic && !am) ? FontStyle.italic : FontStyle.normal,
      height: height ?? (am ? 1.5 : 1.25),
      fontFamilyFallback: am ? _kEthiopic : null,
    );
  }

  void _goHome() {
    HapticFeedback.lightImpact();
    Navigator.of(context).popUntil((r) => r.isFirst);
  }

  void _openHistory() {
    HapticFeedback.selectionClick();
    showDialog<void>(
      context: context,
      builder: (_) => _HistoryDialog(
        isAmharic: widget.isAmharic,
        accent: _accent,
        onReset: _resetToday,
      ),
    );
  }

  // ------------------------------------------------------------------ build

  @override
  Widget build(BuildContext context) {
    final accent = _accent;
    final subtitle = widget.isAmharic
        ? (widget.subtitleAm ?? widget.detailValue)
        : (widget.subtitleEn ?? widget.detailValue);
    final now = DateTime.now();
    final weekDates = List.generate(
      7,
          (i) => DateTime(now.year, now.month, now.day - (6 - i)),
    );
    final blessing = _kBlessings[
    now.difference(DateTime(now.year)).inDays % _kBlessings.length];

    return PopScope(
      canPop: false, // system back should land home, not on the prayer screen
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _goHome();
      },
      child: Scaffold(
        backgroundColor: _kBg,
        body: Stack(
          fit: StackFit.expand,
          children: [
            _Backdrop(path: widget.bgImagePath),
            Positioned.fill(
              child: StaggerIn(
                animation: _enter,
                start: 0.4,
                end: 1.0,
                dy: 0,
                child: IncenseParticles(color: accent),
              ),
            ),
            SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(24, 12, 24, 20),
                          child: Column(
                            children: [
                              const Spacer(flex: 2),
                              SizedBox(
                                width: 200,
                                height: 140,
                                child: Stack(
                                  alignment: Alignment.center,
                                  clipBehavior: Clip.none,
                                  children: [
                                    _RippleRings(
                                      animation: _enter,
                                      color: accent,
                                      size: 112,
                                    ),
                                    DrawnCheckBadge(
                                      progress: _enter,
                                      color: accent,
                                      size: 112,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 14),
                              StaggerIn(
                                animation: _enter,
                                start: 0.35,
                                end: 0.60,
                                child: Text(
                                  _t(widget.titleEn, widget.titleAm),
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: _style(
                                    21,
                                    weight: FontWeight.w700,
                                    spacing: 0.6,
                                  ),
                                ),
                              ),
                              if (subtitle.isNotEmpty) ...[
                                const SizedBox(height: 8),
                                StaggerIn(
                                  animation: _enter,
                                  start: 0.42,
                                  end: 0.66,
                                  child: Text(
                                    subtitle,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: _style(15,
                                        color: accent, italic: true),
                                  ),
                                ),
                              ],
                              const SizedBox(height: 18),
                              StaggerIn(
                                animation: _enter,
                                start: 0.46,
                                end: 0.70,
                                child: Column(
                                  children: [
                                    _Ornament(color: accent),
                                    const SizedBox(height: 12),
                                    Text(
                                      _t(blessing.$1, blessing.$2),
                                      textAlign: TextAlign.center,
                                      style: _style(
                                        15,
                                        color: Colors.white70,
                                        italic: true,
                                        height: 1.4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(flex: 2),
                              StaggerIn(
                                animation: _enter,
                                start: 0.55,
                                end: 0.85,
                                child: _heroCard(accent, weekDates),
                              ),
                              const SizedBox(height: 12),
                              StaggerIn(
                                animation: _enter,
                                start: 0.62,
                                end: 0.90,
                                child: _totalTile(accent),
                              ),
                              const Spacer(flex: 2),
                              StaggerIn(
                                animation: _enter,
                                start: 0.80,
                                end: 1.0,
                                child: _PrimaryButton(
                                  label: _t(
                                    'RETURN HOME',
                                    'ወደ መነሻ ገጽ ተመለስ',
                                  ),
                                  accent: accent,
                                  shine: _enter,
                                  isAmharic: widget.isAmharic,
                                  onPressed: _goHome,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _heroCard(Color accent, List<DateTime> weekDates) {
    final increased = _statsReady && _streak > _fromStreak;
    final milestone = increased && _kMilestones.contains(_streak);
    final bigStyle = _style(56, weight: FontWeight.w700, height: 1.0);

    return _Glass(
      accent: accent,
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _count,
            // The flame pops once, only when the streak really grew.
            builder: (_, child) => Transform.scale(
              scale: increased ? 1 + 0.25 * math.sin(math.pi * _count.value) : 1,
              child: child,
            ),
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (r) => const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0xFFFF7A18), Color(0xFFFFD27A)],
              ).createShader(r),
              child: const Icon(
                Icons.local_fire_department_rounded,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 2),
          _statsReady
              ? CountUpText(
            animation: _count,
            from: _fromStreak,
            to: _streak,
            start: 0,
            end: 1,
            style: bigStyle,
          )
              : Text('–', style: bigStyle),
          const SizedBox(height: 4),
          Text(
            _t('DAY STREAK', 'ተከታታይ ቀናት'),
            style: _style(12,
                color: Colors.white60, weight: FontWeight.w600, spacing: 1.6),
          ),
          if (milestone) ...[
            const SizedBox(height: 10),
            AnimatedBuilder(
              animation: _count,
              builder: (_, child) {
                final t = Interval(0.5, 1.0, curve: Curves.easeOutBack)
                    .transform(_count.value);
                return Opacity(
                  opacity: t < 0 ? 0 : (t > 1 ? 1 : t),
                  child: Transform.scale(scale: t, child: child),
                );
              },
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: accent.withValues(alpha: 0.14),
                  border: Border.all(color: accent.withValues(alpha: 0.6)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.auto_awesome_rounded, size: 14, color: accent),
                    const SizedBox(width: 6),
                    Text(
                      _t('Milestone · $_streak days', 'ምዕራፍ · $_streak ቀናት'),
                      style: _style(12,
                          color: accent, weight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ],
          const SizedBox(height: 18),
          _WeekDots(
            flags: _week,
            dates: weekDates,
            reveal: _count,
            accent: accent,
            isAmharic: widget.isAmharic,
          ),
        ],
      ),
    );
  }

  Widget _totalTile(Color accent) {
    final delta = _total - _fromTotal;
    final numStyle = _style(26, weight: FontWeight.w700, height: 1.1);

    return _Glass(
      accent: accent,
      onTap: _openHistory,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Icon(Icons.auto_awesome_rounded, color: accent, size: 26),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _t('Total Prayers', 'ጠቅላላ ጸሎቶች'),
                  style: _style(15, weight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  _t('View history', 'ታሪክ ይመልከቱ'),
                  style: _style(12, color: Colors.white54),
                ),
              ],
            ),
          ),
          if (_statsReady && delta > 0)
            AnimatedBuilder(
              animation: _count,
              builder: (_, child) {
                final t = Interval(0.7, 1.0, curve: Curves.easeOut)
                    .transform(_count.value);
                return Opacity(
                  opacity: t,
                  child: Transform.translate(
                      offset: Offset(0, (1 - t) * 8), child: child),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  '+$delta',
                  style: _style(14, color: accent, weight: FontWeight.w700),
                ),
              ),
            ),
          _statsReady
              ? CountUpText(
            animation: _count,
            from: _fromTotal,
            to: _total,
            start: 0,
            end: 1,
            style: numStyle,
          )
              : Text('–', style: numStyle),
          const Icon(Icons.chevron_right_rounded, color: Colors.white54),
        ],
      ),
    );
  }
}

// ===========================================================================
// Pieces
// ===========================================================================

/// Blurred, downscaled background with a vignette. Static subtree wrapped in a
/// RepaintBoundary so animations above it never force it to repaint, and the
/// image is decoded small (it's blurred anyway).
class _Backdrop extends StatelessWidget {
  const _Backdrop({required this.path});
  final String? path;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        RepaintBoundary(
          child: path == null
              ? const ColoredBox(color: _kBg)
              : ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: 12,
              sigmaY: 12,
              tileMode: TileMode.mirror,
            ),
            child: Image.asset(
              path!,
              fit: BoxFit.cover,
              cacheWidth: 540,
              filterQuality: FilterQuality.medium,
              errorBuilder: (context, error, stack) {
                debugPrint('Completion background missing: $path');
                return const ColoredBox(color: _kBg);
              },
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 0.55),
                Colors.black.withValues(alpha: 0.35),
                Colors.black.withValues(alpha: 0.70),
              ],
              stops: const [0, 0.5, 1],
            ),
          ),
        ),
      ],
    );
  }
}

/// Two soft rings that radiate once, right after the check lands.
class _RippleRings extends StatelessWidget {
  const _RippleRings({
    required this.animation,
    required this.color,
    required this.size,
  });
  final Animation<double> animation;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, _) => Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [_ring(0.0), _ring(0.12)],
        ),
      ),
    );
  }

  Widget _ring(double delay) {
    final t = Interval(0.62 + delay, 1.0, curve: Curves.easeOutCubic)
        .transform(animation.value);
    if (t <= 0 || t >= 1) return const SizedBox.shrink();
    final d = size * (0.8 + 0.8 * t);
    return Container(
      width: d,
      height: d,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: color.withValues(alpha: 0.5 * (1 - t)),
          width: 1.5,
        ),
      ),
    );
  }
}

/// Fading line - diamond - fading line.
class _Ornament extends StatelessWidget {
  const _Ornament({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    Widget line(bool left) => Container(
      width: 56,
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: left
              ? [Colors.transparent, color.withValues(alpha: 0.8)]
              : [color.withValues(alpha: 0.8), Colors.transparent],
        ),
      ),
    );
    return ExcludeSemantics(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          line(true),
          const SizedBox(width: 8),
          Transform.rotate(
            angle: math.pi / 4,
            child: Container(width: 6, height: 6, color: color),
          ),
          const SizedBox(width: 8),
          line(false),
        ],
      ),
    );
  }
}

/// Frosted glass card: gradient border + specular top highlight, NO blur of
/// its own (the backdrop is already blurred).
class _Glass extends StatelessWidget {
  const _Glass({
    required this.accent,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(18),
  });
  final Color accent;
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GradientBorderPainter(
        strokeWidth: 1.2,
        radius: 22,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            accent.withValues(alpha: 0.7),
            Colors.white.withValues(alpha: 0.08),
            accent.withValues(alpha: 0.25),
            Colors.white.withValues(alpha: 0.30),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Material(
          color: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withValues(alpha: 0.12),
                  Colors.white.withValues(alpha: 0.04),
                ],
              ),
            ),
            child: InkWell(
              onTap: onTap,
              child: Padding(padding: padding, child: child),
            ),
          ),
        ),
      ),
    );
  }
}

/// Last seven days, oldest -> today. Filled dots pop in one after another.
class _WeekDots extends StatelessWidget {
  const _WeekDots({
    required this.flags,
    required this.dates,
    required this.reveal,
    required this.accent,
    required this.isAmharic,
  });
  final List<bool> flags;
  final List<DateTime> dates;
  final Animation<double> reveal;
  final Color accent;
  final bool isAmharic;

  static const _en = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
  static const _am = ['ሰ', 'ማ', 'ረ', 'ሐ', 'ዓ', 'ቅ', 'እ'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [for (var i = 0; i < 7; i++) _dot(i)],
    );
  }

  Widget _dot(int i) {
    final isToday = i == 6;
    final label = (isAmharic ? _am : _en)[dates[i].weekday - 1];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: reveal,
          builder: (context, _) {
            final t = flags[i]
                ? Interval(0.05 * i, 0.05 * i + 0.5, curve: Curves.easeOutBack)
                .transform(reveal.value)
                : 0.0;
            final a = t < 0 ? 0.0 : (t > 1 ? 1.0 : t);
            return Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: accent.withValues(alpha: 0.9 * a),
                border: Border.all(
                  color: isToday ? accent : Colors.white24,
                  width: isToday ? 2 : 1,
                ),
              ),
              child: Transform.scale(
                scale: t,
                child: const Icon(Icons.check_rounded,
                    size: 18, color: Colors.black87),
              ),
            );
          },
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: isToday ? accent : Colors.white54,
            fontWeight: isToday ? FontWeight.w700 : FontWeight.w500,
            fontFamilyFallback: isAmharic ? _kEthiopic : null,
          ),
        ),
      ],
    );
  }
}

class _SlideGradient extends GradientTransform {
  const _SlideGradient(this.percent);
  final double percent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) =>
      Matrix4.translationValues(bounds.width * percent, 0, 0);
}

/// Accent button with a single light sweep as the screen finishes entering.
class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({
    required this.label,
    required this.accent,
    required this.shine,
    required this.isAmharic,
    required this.onPressed,
  });
  final String label;
  final Color accent;
  final Animation<double> shine;
  final bool isAmharic;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final on = accent.computeLuminance() > 0.45 ? Colors.black87 : Colors.white;
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [accent, Color.lerp(accent, Colors.black, 0.18)!],
          ),
          boxShadow: [
            BoxShadow(
              color: accent.withValues(alpha: 0.35),
              blurRadius: 18,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Positioned.fill(
                child: IgnorePointer(
                  child: AnimatedBuilder(
                    animation: shine,
                    builder: (context, _) {
                      final p = Interval(0.82, 1.0, curve: Curves.easeInOut)
                          .transform(shine.value);
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.transparent,
                              Colors.white.withValues(alpha: 0.28),
                              Colors.transparent,
                            ],
                            stops: const [0.35, 0.5, 0.65],
                            transform: _SlideGradient(-1 + 2 * p),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onPressed,
                    child: Center(
                      child: Text(
                        label,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: on,
                          letterSpacing: isAmharic ? 0 : 1.4,
                          fontFamilyFallback: isAmharic ? _kEthiopic : null,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ===========================================================================
// History dialog (own State so the Future is cached, not rebuilt every frame)
// ===========================================================================

class _HistoryDialog extends StatefulWidget {
  const _HistoryDialog({
    required this.isAmharic,
    required this.accent,
    required this.onReset,
  });
  final bool isAmharic;
  final Color accent;
  final Future<void> Function() onReset;

  @override
  State<_HistoryDialog> createState() => _HistoryDialogState();
}

class _HistoryDialogState extends State<_HistoryDialog> {
  static const _dialogBg = Color(0xF516161D);
  static const _filters = <(String, String, String)>[
    ('today', 'Today', 'ዛሬ'),
    ('yesterday', 'Yesterday', 'ትናንት'),
    ('last_week', 'Last 7 Days', 'ባለፉት 7 ቀናት'),
    ('last_month', 'Last 30 Days', 'ባለፉት 30 ቀናት'),
  ];

  String _filter = 'today';
  late Future<List<Map<String, dynamic>>> _future = _fetch();

  Future<List<Map<String, dynamic>>> _fetch() =>
      DatabaseHelper.instance.getFilteredPrayerHistory(_filter);

  String _t(String en, String am) => widget.isAmharic ? am : en;

  TextStyle _s(double size,
      {Color color = Colors.white, FontWeight? weight}) =>
      TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
        fontFamilyFallback: widget.isAmharic ? _kEthiopic : null,
      );

  Future<void> _confirmReset() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: _dialogBg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.redAccent.withValues(alpha: 0.4)),
        ),
        title: Text(
          _t('Reset today\'s prayers?', 'ጸሎትን እንደገና አስጀምር?'),
          style: _s(18, weight: FontWeight.w700),
        ),
        content: Text(
          _t('Do you want to reset all of today\'s logged prayers?',
              'የዛሬውን የጸሎት መዝገብ በሙሉ ማጽዳት ይፈልጋሉ?'),
          style: _s(14, color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(_t('Cancel', 'ተመለስ'),
                style: _s(14, color: Colors.white60)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(_t('Reset', 'አጽዳ'),
                style: _s(14, color: Colors.redAccent)),
          ),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    await widget.onReset();
    if (!mounted) return;
    setState(() => _future = _fetch());
  }

  @override
  Widget build(BuildContext context) {
    final loc = MaterialLocalizations.of(context);
    final height = math.min(380.0, MediaQuery.sizeOf(context).height * 0.5);

    return AlertDialog(
      backgroundColor: _dialogBg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: widget.accent.withValues(alpha: 0.4)),
      ),
      title: Text(
        _t('Prayer History', 'የጸሎት የታሪክ መዝገብ'),
        style: _s(20, color: widget.accent, weight: FontWeight.w700),
      ),
      content: SizedBox(
        width: double.maxFinite,
        height: height,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final f in _filters)
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: ChoiceChip(
                        showCheckmark: false,
                        selected: _filter == f.$1,
                        selectedColor: widget.accent,
                        backgroundColor: Colors.white.withValues(alpha: 0.06),
                        side: BorderSide.none,
                        label: Text(
                          _t(f.$2, f.$3),
                          style: _s(
                            12,
                            color: _filter == f.$1
                                ? Colors.black87
                                : Colors.white70,
                            weight: _filter == f.$1
                                ? FontWeight.w700
                                : FontWeight.w400,
                          ),
                        ),
                        onSelected: (_) => setState(() {
                          _filter = f.$1;
                          _future = _fetch();
                        }),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _future,
                builder: (context, snap) {
                  if (snap.hasError) {
                    return Center(
                      child: Text(
                        _t('Could not load history.', 'ታሪኩን መጫን አልተቻለም።'),
                        style: _s(14, color: Colors.white70),
                      ),
                    );
                  }
                  if (!snap.hasData) {
                    return Center(
                      child: CircularProgressIndicator(color: widget.accent),
                    );
                  }
                  final rows = snap.data!;
                  if (rows.isEmpty) {
                    return Center(
                      child: Text(
                        _t('No prayer records found for this filter.',
                            'በዚህ ጊዜ ውስጥ የተመዘገበ ጸሎት የለም'),
                        textAlign: TextAlign.center,
                        style: _s(14, color: Colors.white70),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: rows.length,
                    itemBuilder: (context, i) {
                      final e = rows[i];
                      final dt =
                      DateTime.tryParse('${e['completed_at']}')?.toLocal();
                      final when = dt == null
                          ? ''
                          : '${loc.formatTimeOfDay(TimeOfDay.fromDateTime(dt))}'
                          ' · ${loc.formatMediumDate(dt)}';
                      return ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(Icons.check_circle_outline,
                            color: widget.accent, size: 18),
                        title: Text(
                          e['prayer_name'] as String? ?? _t('Prayer', 'ጸሎት'),
                          style: _s(14, weight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          '${e['prayer_type']} • $when',
                          style: _s(12, color: Colors.white60),
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
          onPressed: _confirmReset,
          child: Text(_t('Reset today', 'የዛሬን አጽዳ'),
              style: _s(13, color: Colors.redAccent)),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(_t('Close', 'ዝጋ'),
              style: _s(14, color: widget.accent)),
        ),
      ],
    );
  }
}