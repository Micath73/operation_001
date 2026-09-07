import 'package:flutter/material.dart';
import 'package:operation_001/db_helper.dart';

class NovenaProgressCard extends StatefulWidget {
  final String novenaTitle;
  final String imagePath;
  final Future<void> Function()? onTap;
  final Future<void> Function(int targetDay)? onPrayPressed;
  final VoidCallback? onCleared;

  const NovenaProgressCard({
    super.key,
    required this.novenaTitle,
    required this.imagePath,
    this.onTap,
    this.onPrayPressed,
    this.onCleared,
  });

  @override
  State<NovenaProgressCard> createState() => NovenaProgressCardState();
}

class NovenaProgressCardState extends State<NovenaProgressCard> {
  int completedCount = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    refreshProgress();
  }

  Future<void> refreshProgress() async {
    final count = await DatabaseHelper.instance
        .getNovenaCompletedCount(widget.novenaTitle);
    if (mounted) {
      setState(() {
        completedCount = count.clamp(0, 9);
        isLoading = false;
      });
    }
  }

  Future<void> _handleCardTap() async {
    if (widget.onTap != null) {
      await widget.onTap!();
    }
    if (mounted) {
      await refreshProgress();
      widget.onCleared?.call();
    }
  }

  Future<void> _handleActionPressed(bool isCompleted, int currentDay) async {
    if (isCompleted) {
      await DatabaseHelper.instance.resetNovenaProgress(widget.novenaTitle);
      if (!mounted) return;
      await refreshProgress();
      widget.onCleared?.call();

      if (widget.onPrayPressed != null) {
        await widget.onPrayPressed!(1);
      } else if (widget.onTap != null) {
        await widget.onTap!();
      }
    } else {
      if (widget.onPrayPressed != null) {
        await widget.onPrayPressed!(currentDay);
      } else if (widget.onTap != null) {
        await widget.onTap!();
      }
    }

    if (mounted) {
      await refreshProgress();
      widget.onCleared?.call();
    }
  }

  Future<void> _showClearProgressDialog() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Clear Progress?'),
        content: Text(
          'Are you sure you want to remove all progress for "${widget.novenaTitle}"?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
            ),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Clear', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await DatabaseHelper.instance.resetNovenaProgress(widget.novenaTitle);
      if (mounted) {
        await refreshProgress();
        widget.onCleared?.call();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final deepGold = isDark ? const Color(0xFFE5C158) : const Color(0xFFC9A959);
    final marianBlue =
    isDark ? const Color(0xFF6B9AC4) : const Color(0xFF1E3A5F);
    final cardBg = isDark ? const Color(0xFF1E1C1A) : const Color(0xFFFAF8F5);

    final bool isCompleted = completedCount >= 9;
    final int currentDay = (completedCount + 1).clamp(1, 9);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: deepGold.withValues(alpha: 0.35), width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: _handleCardTap,
        child: Container(
          color: cardBg,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 48,
                      height: 48,
                      child: Image.asset(
                        widget.imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: deepGold.withValues(alpha: 0.15),
                          child: Icon(Icons.church_rounded,
                              color: deepGold, size: 24),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.novenaTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Georgia',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color:
                            isDark ? Colors.white : const Color(0xFF2C2C2C),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: isCompleted
                                ? Colors.green.withValues(alpha: 0.12)
                                : marianBlue.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                isCompleted
                                    ? Icons.check_circle_rounded
                                    : Icons.auto_awesome,
                                size: 12,
                                color: isCompleted ? Colors.green : marianBlue,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                isCompleted
                                    ? 'Completed ✓'
                                    : 'Day $currentDay of 9',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color:
                                  isCompleted ? Colors.green : marianBlue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (completedCount > 0)
                    PopupMenuButton<String>(
                      icon: Icon(
                        Icons.more_vert_rounded,
                        size: 18,
                        color: deepGold.withValues(alpha: 0.8),
                      ),
                      onSelected: (value) {
                        if (value == 'clear') {
                          _showClearProgressDialog();
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'clear',
                          child: Row(
                            children: [
                              Icon(Icons.delete_outline_rounded,
                                  color: Colors.redAccent, size: 18),
                              SizedBox(width: 8),
                              Text('Clear Progress',
                                  style: TextStyle(color: Colors.redAccent)),
                            ],
                          ),
                        ),
                      ],
                    )
                  else
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 14,
                      color: deepGold.withValues(alpha: 0.8),
                    ),
                ],
              ),

              const SizedBox(height: 10),

              // Progress Bar
              if (isLoading)
                const SizedBox(
                  height: 6,
                  child: LinearProgressIndicator(minHeight: 4),
                )
              else
                Row(
                  children: List.generate(9, (index) {
                    final bool isFilled = index < completedCount;
                    final bool isCurrent =
                        index == completedCount && !isCompleted;

                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 1.5),
                        height: 5,
                        decoration: BoxDecoration(
                          color: isFilled
                              ? deepGold
                              : isCurrent
                              ? deepGold.withValues(alpha: 0.5)
                              : deepGold.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    );
                  }),
                ),

              const SizedBox(height: 10),

              // Bottom Action Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$completedCount of 9 Days Completed',
                    style: TextStyle(
                      fontSize: 11,
                      color: isDark ? Colors.white60 : Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: ElevatedButton.icon(
                      onPressed: () =>
                          _handleActionPressed(isCompleted, currentDay),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isCompleted
                            ? (isDark
                            ? Colors.grey.shade700
                            : Colors.grey.shade400)
                            : deepGold,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: Icon(
                        isCompleted
                            ? Icons.replay_rounded
                            : Icons.play_arrow_rounded,
                        size: 14,
                      ),
                      label: Text(
                        isCompleted ? 'Restart' : 'Pray Day $currentDay',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}