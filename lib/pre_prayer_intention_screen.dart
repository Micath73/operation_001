import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:operation_001/db_helper.dart';
import 'package:operation_001/prayer_type.dart';

/// Fixed dark "glass overlay" palette for THIS screen specifically.
class _Overlay {
  static const bg = Color(0xFF121212);
  static const surface = Color(0xFF1E1E1E);
  static const card = Color(0xFF2B2B2B);
  static const gold = Color(0xFFD4B76A);
  static const textLight = Color(0xFFF5F5F3);
  static const textMuted = Color(0xFFA0A0A0);
  static const marianBlue = Color(0xFF2C5E8A);
}

class PrePrayerIntentionScreen extends StatefulWidget {
  /// Typed now instead of a free-text `String prayerCategory` — this was
  /// the last untyped hop in the chain (Dashboard → here → the prayer
  /// screen → PrayerCompletionScreen). Every call site now passes the
  /// enum directly, so there's no longer a String literal here that
  /// could drift from what `PrayerType` defines elsewhere.
  final PrayerType prayerType;
  final Widget targetPrayerPage;
  final bool isAmharic;

  const PrePrayerIntentionScreen({
    super.key,
    required this.prayerType,
    required this.targetPrayerPage,
    this.isAmharic = false,
  });

  @override
  State<PrePrayerIntentionScreen> createState() =>
      _PrePrayerIntentionScreenState();
}

class _PrePrayerIntentionScreenState extends State<PrePrayerIntentionScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  List<Map<String, dynamic>> _intentions = [];
  bool _isLoading = true;
  bool _isAddingNew = false;
  bool _isSubmitting = false;
  int? _expandedId;

  @override
  void initState() {
    super.initState();
    _fetchIntentions();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  Future<void> _fetchIntentions() async {
    final data = await DatabaseHelper.instance.getIntentions(
      // Always stored under the English label regardless of display
      // language, so toggling isAmharic doesn't split one prayer's
      // intentions across two different category buckets.
      category: widget.prayerType.labelEn,
    );
    if (!mounted) return;
    setState(() {
      _intentions = data;
      _isLoading = false;
    });
  }

  Future<void> _addIntention() async {
    final String title = _titleController.text.trim();
    final String details = _detailsController.text.trim();

    if (title.isEmpty || _isSubmitting) return;

    setState(() => _isSubmitting = true);

    final String fullPayload = details.isNotEmpty ? "$title\n$details" : title;

    await DatabaseHelper.instance.addIntention(
      category: widget.prayerType.labelEn,
      intention: fullPayload,
    );

    if (!mounted) return;

    _titleController.clear();
    _detailsController.clear();
    setState(() {
      _isAddingNew = false;
      _isSubmitting = false;
    });

    await _fetchIntentions();
  }

  Future<void> _toggleAnswered(int id, bool currentStatus) async {
    await DatabaseHelper.instance.toggleIntentionAnswered(id, !currentStatus);
    if (!mounted) return;
    await _fetchIntentions();
  }

  Future<void> _deleteIntention(int id) async {
    await DatabaseHelper.instance.deleteIntention(id);
    if (!mounted) return;
    if (_expandedId == id) _expandedId = null;
    await _fetchIntentions();
  }

  Future<bool?> _confirmDeleteDialog(int id) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: _Overlay.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.white.withValues(alpha: 0.15)),
        ),
        title: Text(
          widget.isAmharic ? 'የጸሎት ጥያቄውን ይሰርዙ?' : 'Delete Intention?',
          style: const TextStyle(
            color: _Overlay.textLight,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          widget.isAmharic
              ? 'ይህንን የጸሎት ሃሳብ እርግጠኛ ሆነው ማጥፋት ይፈልጋሉ?'
              : 'Are you sure you want to delete this prayer intention?',
          style: const TextStyle(color: _Overlay.textMuted),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              widget.isAmharic ? 'ተመለስ' : 'Cancel',
              style: const TextStyle(color: _Overlay.textMuted),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              widget.isAmharic ? 'አጥፋ' : 'Delete',
              style: const TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _proceedToPrayer() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) =>
        widget.targetPrayerPage,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  String _formatDate(String? rawDate) {
    final dt = rawDate != null
        ? DateTime.tryParse(rawDate) ?? DateTime.now()
        : DateTime.now();
    final daysEn = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final daysAm = ['ሰኞ', 'ማክሰኞ', 'ረቡዕ', 'ሐሙስ', 'አርብ', 'ቅዳሜ', 'እሁድ'];

    final dayName = widget.isAmharic
        ? daysAm[dt.weekday - 1]
        : daysEn[dt.weekday - 1];
    return "$dayName, ${dt.day}/${dt.month}/${dt.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Blurred background route
          Positioned.fill(
            child: IgnorePointer(
              ignoring: true,
              child: widget.targetPrayerPage,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
              child: Container(
                color: Colors.black.withValues(alpha: 0.72),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // Fixed Contrast Header
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 14.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.isAmharic
                                  ? 'የጸሎት ዓላማዎች'
                                  : 'PRAYER INTENTIONS',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: _Overlay.gold,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                letterSpacing: 1.1,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              widget.prayerType.label(widget.isAmharic),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: _Overlay.textMuted,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Skip Button
                      InkWell(
                        onTap: _proceedToPrayer,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: _Overlay.gold.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: _Overlay.gold.withValues(alpha: 0.5),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                widget.isAmharic ? 'ይለፉ' : 'Skip',
                                style: const TextStyle(
                                  color: _Overlay.gold,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 11,
                                color: _Overlay.gold,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.white.withValues(alpha: 0.12), height: 1),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildIntentionInputCard(context),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.isAmharic
                                  ? 'የተመዘገቡ የጸሎት ጥያቄዎች'
                                  : 'Petitions & Intentions',
                              style: const TextStyle(
                                color: _Overlay.textLight,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              _formatDate(null),
                              style: const TextStyle(
                                color: _Overlay.gold,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _isLoading
                            ? const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: CircularProgressIndicator(
                              color: _Overlay.gold,
                            ),
                          ),
                        )
                            : _intentions.isEmpty
                            ? _buildEmptyState(context)
                            : ListView.builder(
                          shrinkWrap: true,
                          physics:
                          const NeverScrollableScrollPhysics(),
                          itemCount: _intentions.length,
                          itemBuilder: (context, index) {
                            return _buildIntentionTile(
                              context,
                              _intentions[index],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                // Seamless Glass Bottom Bar
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: _Overlay.surface.withValues(alpha: 0.85),
                    border: Border(
                      top: BorderSide(
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _Overlay.marianBlue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 4,
                      ),
                      onPressed: _proceedToPrayer,
                      child: Text(
                        widget.isAmharic ? 'ጸሎቱን ጀምር' : 'BEGIN PRAYER NOW',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntentionInputCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _Overlay.card,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: _Overlay.gold.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.isAmharic ? 'አዲስ የጸሎት ሃሳብ አክል' : 'Add Prayer Intention',
                style: const TextStyle(
                  color: _Overlay.gold,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                icon: Icon(
                  _isAddingNew
                      ? Icons.keyboard_arrow_up
                      : Icons.add_circle_outline,
                  color: _Overlay.gold,
                ),
                onPressed: () => setState(() => _isAddingNew = !_isAddingNew),
              ),
            ],
          ),
          if (!_isAddingNew)
            GestureDetector(
              onTap: () => setState(() => _isAddingNew = true),
              child: Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: Text(
                  widget.isAmharic
                      ? 'በዚህ ጸሎት ምን መጠየቅ ይፈልጋሉ? ለማከል እዚህ ይጫኑ...'
                      : 'Tap here to speak your mind & add a petition...',
                  style: const TextStyle(
                    color: _Overlay.textMuted,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          if (_isAddingNew) ...[
            const SizedBox(height: 10),
            TextField(
              controller: _titleController,
              style: const TextStyle(color: _Overlay.textLight, fontSize: 14),
              decoration: InputDecoration(
                hintText: widget.isAmharic
                    ? 'ርዕስ (ለምሳሌ፦ ስለ ቤተሰብ ሰላም)'
                    : 'Title (e.g. For Family Health)',
                hintStyle: const TextStyle(
                  color: _Overlay.textMuted,
                  fontSize: 13,
                ),
                filled: true,
                fillColor: Colors.black.withValues(alpha: 0.3),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: _Overlay.gold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _detailsController,
              maxLines: 3,
              style: const TextStyle(color: _Overlay.textLight, fontSize: 13),
              decoration: InputDecoration(
                hintText: widget.isAmharic
                    ? 'ዝርዝር መግለጫ ወይም የልብዎን ሀሳብ ይጻፉ (አማራጭ)...'
                    : 'Write out your detailed prayer intention or thoughts (optional)...',
                hintStyle: const TextStyle(
                  color: _Overlay.textMuted,
                  fontSize: 12,
                ),
                filled: true,
                fillColor: Colors.black.withValues(alpha: 0.3),
                contentPadding: const EdgeInsets.all(14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: _Overlay.gold),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _Overlay.gold,
                  foregroundColor: _Overlay.bg,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _isSubmitting ? null : _addIntention,
                icon: _isSubmitting
                    ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: _Overlay.bg,
                  ),
                )
                    : const Icon(Icons.check_rounded, size: 18),
                label: Text(
                  widget.isAmharic ? 'መዝግብ' : 'Save Petition',
                  style: const TextStyle(
                    color: _Overlay.bg,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildIntentionTile(BuildContext context, Map<String, dynamic> item) {
    final isAnswered = item['is_answered'] == 1;
    final int id = item['id'];

    final String rawText = item['intention'] ?? '';
    final isExpanded = _expandedId == id;

    final lines = rawText.split('\n');
    final title = lines.isNotEmpty ? lines.first : rawText;
    final details = lines.length > 1 ? lines.sublist(1).join('\n') : null;
    final String dateString = _formatDate(item['created_at']);

    const answeredGreen = Color(0xFF4CAF50);

    return Dismissible(
      key: ValueKey('intention_$id'),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        return await _confirmDeleteDialog(id);
      },
      onDismissed: (_) => _deleteIntention(id),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.redAccent.withValues(alpha: 0.85),
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Icon(Icons.delete_outline, color: Colors.white, size: 24),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: isAnswered
              ? answeredGreen.withValues(alpha: 0.15)
              : _Overlay.card,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isAnswered
                ? answeredGreen.withValues(alpha: 0.6)
                : Colors.white.withValues(alpha: 0.08),
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () {
            setState(() {
              _expandedId = isExpanded ? null : id;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: isAnswered,
                      activeColor: answeredGreen,
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      onChanged: (val) {
                        _toggleAnswered(id, isAnswered);
                      },
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              color: isAnswered
                                  ? _Overlay.textMuted
                                  : _Overlay.textLight,
                              decoration: isAnswered
                                  ? TextDecoration.lineThrough
                                  : null,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            dateString,
                            style: const TextStyle(
                              color: _Overlay.textMuted,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isAnswered)
                      Container(
                        margin: const EdgeInsets.only(right: 6),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: answeredGreen.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          widget.isAmharic ? 'ተመልሷል ✨' : 'Answered ✨',
                          style: const TextStyle(
                            color: answeredGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        color: _Overlay.textMuted,
                        size: 20,
                      ),
                      onPressed: () async {
                        final confirmed = await _confirmDeleteDialog(id);
                        if (confirmed == true) {
                          _deleteIntention(id);
                        }
                      },
                    ),
                    if (details != null)
                      Icon(
                        isExpanded ? Icons.expand_less : Icons.expand_more,
                        color: _Overlay.textMuted,
                      ),
                  ],
                ),
                if (isExpanded && details != null) ...[
                  Divider(
                    color: Colors.white.withValues(alpha: 0.1),
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 48,
                      right: 12,
                      bottom: 6,
                    ),
                    child: Text(
                      details,
                      style: const TextStyle(
                        color: _Overlay.textMuted,
                        height: 1.4,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Icon(
              Icons.volunteer_activism_outlined,
              size: 44,
              color: _Overlay.textMuted,
            ),
            SizedBox(height: 12),
            Text(
              'No prayer intentions saved for this session.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _Overlay.textMuted,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}