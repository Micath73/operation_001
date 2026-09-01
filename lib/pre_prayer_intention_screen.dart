import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:operation_001/db_helper.dart';

class PrePrayerIntentionScreen extends StatefulWidget {
  final String prayerCategory;
  final Widget targetPrayerPage;
  final bool isAmharic;

  const PrePrayerIntentionScreen({
    super.key,
    required this.prayerCategory,
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
      category: widget.prayerCategory,
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
      category: widget.prayerCategory,
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
        backgroundColor: const Color(0xFF160D29).withValues(alpha: 0.95),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
        ),
        title: Text(
          widget.isAmharic ? 'የጸሎት ጥያቄውን ይሰርዙ?' : 'Delete Intention?',
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Georgia',
            fontSize: 18,
          ),
        ),
        content: Text(
          widget.isAmharic
              ? 'ይህንን የጸሎት ሃሳብ እርግጠኛ ሆነው ማጥፋት ይፈልጋሉ?'
              : 'Are you sure you want to delete this prayer intention?',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: 14,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              widget.isAmharic ? 'ተመለስ' : 'Cancel',
              style: TextStyle(color: Colors.white.withValues(alpha: 0.6)),
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
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: IgnorePointer(
              ignoring: true,
              child: widget.targetPrayerPage,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
              child: Container(color: Colors.black.withValues(alpha: 0.58)),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // Header section optimized to eliminate overflow risk
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
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
                                fontFamily: 'Georgia',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFE8B84B),
                                letterSpacing: 1.0,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              widget.prayerCategory,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.7),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Compact Skip Button preventing overflows
                      InkWell(
                        onTap: _proceedToPrayer,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8B84B).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFFE8B84B).withValues(alpha: 0.4),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                widget.isAmharic ? 'ይለፉ' : 'Skip',
                                style: const TextStyle(
                                  color: Color(0xFFE8B84B),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 11,
                                color: Color(0xFFE8B84B),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.white12, height: 1),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildIntentionInputCard(),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.isAmharic
                                  ? 'የተመዘገቡ የጸሎት ጥያቄዎች'
                                  : 'Petitions & Intentions',
                              style: const TextStyle(
                                fontFamily: 'Georgia',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              _formatDate(null),
                              style: TextStyle(
                                color: const Color(0xFFE8B84B)
                                    .withValues(alpha: 0.9),
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
                              color: Color(0xFFE8B84B),
                            ),
                          ),
                        )
                            : _intentions.isEmpty
                            ? _buildEmptyState()
                            : ListView.builder(
                          shrinkWrap: true,
                          physics:
                          const NeverScrollableScrollPhysics(),
                          itemCount: _intentions.length,
                          itemBuilder: (context, index) {
                            return _buildIntentionTile(
                              _intentions[index],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.4),
                    border: const Border(
                      top: BorderSide(color: Colors.white12),
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE8B84B),
                        foregroundColor: const Color(0xFF120A21),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 4,
                      ),
                      onPressed: _proceedToPrayer,
                      child: Text(
                        widget.isAmharic ? 'ጸሎቱን ጀምር' : 'BEGIN PRAYER NOW',
                        style: const TextStyle(
                          fontFamily: 'Georgia',
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

  Widget _buildIntentionInputCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
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
                  color: Color(0xFFE8B84B),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              IconButton(
                icon: Icon(
                  _isAddingNew
                      ? Icons.keyboard_arrow_up
                      : Icons.add_circle_outline,
                  color: const Color(0xFFE8B84B),
                ),
                onPressed: () => setState(() => _isAddingNew = !_isAddingNew),
              ),
            ],
          ),
          if (!_isAddingNew)
            GestureDetector(
              onTap: () => setState(() => _isAddingNew = true),
              child: Text(
                widget.isAmharic
                    ? 'በዚህ ጸሎት ምን መጠየቅ ይፈልጋሉ? ለማከል እዚህ ይጫኑ...'
                    : 'Tap here to speak your mind & add a petition...',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.5),
                  fontSize: 13,
                ),
              ),
            ),
          if (_isAddingNew) ...[
            const SizedBox(height: 10),
            TextField(
              controller: _titleController,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              decoration: InputDecoration(
                hintText: widget.isAmharic
                    ? 'ርዕስ (ለምሳሌ፦ ስለ ቤተሰብ ሰላም)'
                    : 'Title (e.g. For Family Health)',
                hintStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.4),
                  fontSize: 13,
                ),
                filled: true,
                fillColor: Colors.black.withValues(alpha: 0.4),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _detailsController,
              maxLines: 3,
              style: const TextStyle(color: Colors.white, fontSize: 13),
              decoration: InputDecoration(
                hintText: widget.isAmharic
                    ? 'ዝርዝር መግለጫ ወይም የልብዎን ሀሳብ ይጻፉ (አማራጭ)...'
                    : 'Write out your detailed prayer intention or thoughts (optional)...',
                hintStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.4),
                  fontSize: 12,
                ),
                filled: true,
                fillColor: Colors.black.withValues(alpha: 0.4),
                contentPadding: const EdgeInsets.all(14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE8B84B),
                  foregroundColor: const Color(0xFF120A21),
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
                    color: Color(0xFF120A21),
                  ),
                )
                    : const Icon(Icons.check_rounded, size: 18),
                label: Text(widget.isAmharic ? 'መዝግብ' : 'Save Petition'),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildIntentionTile(Map<String, dynamic> item) {
    final isAnswered = item['is_answered'] == 1;
    final int id = item['id'];

    final String rawText = item['intention'] ?? '';
    final isExpanded = _expandedId == id;

    final lines = rawText.split('\n');
    final title = lines.isNotEmpty ? lines.first : rawText;
    final details = lines.length > 1 ? lines.sublist(1).join('\n') : null;
    final String dateString = _formatDate(item['created_at']);

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
          color: Colors.redAccent.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Icon(Icons.delete_outline, color: Colors.white, size: 24),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: isAnswered
              ? const Color(0xFF1E3A2B).withValues(alpha: 0.55)
              : Colors.black.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isAnswered
                ? const Color(0xFF4CAF50).withValues(alpha: 0.5)
                : Colors.white.withValues(alpha: 0.12),
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
                      activeColor: const Color(0xFF4CAF50),
                      checkColor: Colors.black,
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
                              color: isAnswered ? Colors.white60 : Colors.white,
                              decoration: isAnswered
                                  ? TextDecoration.lineThrough
                                  : null,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            dateString,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.5),
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
                          color: const Color(0xFF4CAF50).withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          widget.isAmharic ? 'ተመልሷል ✨' : 'Answered ✨',
                          style: const TextStyle(
                            color: Color(0xFF4CAF50),
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    IconButton(
                      icon: Icon(
                        Icons.delete_outline,
                        color: Colors.white.withValues(alpha: 0.4),
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
                        color: Colors.white54,
                      ),
                  ],
                ),
                if (isExpanded && details != null) ...[
                  const Divider(color: Colors.white12, height: 16),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 48,
                      right: 12,
                      bottom: 6,
                    ),
                    child: Text(
                      details,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 13,
                        height: 1.4,
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

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Icon(
              Icons.volunteer_activism_outlined,
              size: 40,
              color: Colors.white.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 12),
            Text(
              widget.isAmharic
                  ? 'ምንም የተመዘገበ የጸሎት ዓላማ የለም።'
                  : 'No prayer intentions saved for this session.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.6),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}