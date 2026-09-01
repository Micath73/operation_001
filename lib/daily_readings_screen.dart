import 'package:flutter/material.dart';
import 'daily_reading_model.dart';
import 'readings_service.dart';

class DailyReadingsScreen extends StatefulWidget {
  const DailyReadingsScreen({super.key});

  @override
  State<DailyReadingsScreen> createState() => _DailyReadingsScreenState();
}

class _DailyReadingsScreenState extends State<DailyReadingsScreen> {
  final ReadingsService _readingsService = ReadingsService();
  DateTime _selectedDate = DateTime.now();
  late Future<DailyReading?> _readingFuture;
  late ScrollController _scrollController;

  final double _itemWidth = 68.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _loadReading();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToDateIndex(7);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToDateIndex(int index) {
    if (!_scrollController.hasClients) return;
    final screenWidth = MediaQuery.of(context).size.width;
    final targetOffset = (index * _itemWidth) - (screenWidth / 2) + (_itemWidth / 2);

    _scrollController.animateTo(
      targetOffset.clamp(0.0, _scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _loadReading() {
    setState(() {
      _readingFuture = _readingsService.getReadingForDate(_selectedDate);
    });
  }

  Future<void> _selectDateFromCalendar() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      _loadReading();
    }
  }

  Color _getLiturgicalColor(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'purple':
      case 'violet':
        return Colors.deepPurple;
      case 'red':
        return Colors.red.shade800;
      case 'white':
      case 'gold':
        return Colors.amber.shade800;
      case 'rose':
      case 'pink':
        return Colors.pink.shade400;
      case 'green':
      default:
        return const Color(0xFF1B5E20);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text("Daily Mass Readings"),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month_rounded),
            tooltip: 'Pick Date',
            onPressed: _selectDateFromCalendar,
          ),
        ],
      ),
      body: Column(
        children: [
          _buildDatePickerStrip(colorScheme),
          Expanded(
            child: FutureBuilder<DailyReading?>(
              future: _readingFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(color: colorScheme.primary),
                  );
                }

                if (snapshot.hasError || snapshot.data == null) {
                  return _buildOfflineErrorWidget(theme);
                }

                final reading = snapshot.data!;
                final accentColor = _getLiturgicalColor(reading.liturgicalColor);

                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLiturgicalHeader(reading, accentColor, theme),
                      const SizedBox(height: 16),
                      _buildReadingCard(
                        title: reading.firstReadingTitle,
                        text: reading.firstReadingText,
                        accentColor: accentColor,
                        theme: theme,
                      ),
                      _buildPsalmCard(reading, accentColor, theme),
                      if (reading.secondReadingTitle != null &&
                          reading.secondReadingText != null) ...[
                        _buildReadingCard(
                          title: reading.secondReadingTitle!,
                          text: reading.secondReadingText!,
                          accentColor: accentColor,
                          theme: theme,
                        ),
                      ],
                      _buildGospelCard(reading, accentColor, theme),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDatePickerStrip(ColorScheme colorScheme) {
    return Container(
      height: 75,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 15,
        itemBuilder: (context, index) {
          final date = DateTime.now().add(Duration(days: index - 7));
          final isSelected = date.day == _selectedDate.day &&
              date.month == _selectedDate.month &&
              date.year == _selectedDate.year;

          return SizedBox(
            width: _itemWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    setState(() => _selectedDate = date);
                    _scrollToDateIndex(index);
                    _loadReading();
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.surfaceContainerHighest.withAlpha(76),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? colorScheme.primary
                            : colorScheme.outline.withAlpha(51),
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _getDayAbbreviation(date.weekday),
                          style: TextStyle(
                            color: isSelected
                                ? colorScheme.onPrimary
                                : colorScheme.onSurfaceVariant,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "${date.day}",
                          style: TextStyle(
                            color: isSelected
                                ? colorScheme.onPrimary
                                : colorScheme.onSurface,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLiturgicalHeader(DailyReading reading, Color accentColor, ThemeData theme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: accentColor.withAlpha(31),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accentColor.withAlpha(102)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(backgroundColor: accentColor, radius: 5),
              const SizedBox(width: 8),
              Text(
                reading.liturgicalColor.toUpperCase(),
                style: TextStyle(
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            reading.liturgicalTitle,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReadingCard({
    required String title,
    required String text,
    required Color accentColor,
    required ThemeData theme,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withAlpha(128),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outline.withAlpha(51),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: accentColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(height: 20),
          Text(
            text,
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPsalmCard(DailyReading reading, Color accentColor, ThemeData theme) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withAlpha(128),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outline.withAlpha(51)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Responsorial Psalm",
            style: TextStyle(
              color: accentColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            reading.psalmResponse,
            style: TextStyle(
              color: theme.colorScheme.secondary,
              fontSize: 15,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Divider(height: 20),
          Text(
            reading.psalmText,
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGospelCard(DailyReading reading, Color accentColor, ThemeData theme) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withAlpha(128),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.secondary,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (reading.gospelAcclamation != null && reading.gospelAcclamation!.isNotEmpty) ...[
            Text(
              "Gospel Acclamation",
              style: TextStyle(
                color: theme.colorScheme.secondary,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              reading.gospelAcclamation!,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontStyle: FontStyle.italic,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const Divider(height: 20),
          ],
          Text(
            reading.gospelTitle,
            style: TextStyle(
              color: theme.colorScheme.secondary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(height: 20),
          Text(
            reading.gospelText,
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfflineErrorWidget(ThemeData theme) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off_rounded, size: 60, color: theme.colorScheme.outline),
            const SizedBox(height: 16),
            Text(
              "No Readings Available Offline",
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Connect to the internet to download readings for this date.",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _loadReading,
              icon: const Icon(Icons.refresh),
              label: const Text("Retry"),
            ),
          ],
        ),
      ),
    );
  }

  String _getDayAbbreviation(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }
}