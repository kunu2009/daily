import 'package:flutter/material.dart';
import '../models/journal_entry.dart';

class EntryDetailScreen extends StatelessWidget {
  final JournalEntry entry;

  const EntryDetailScreen({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Entry Details'), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with title and mood
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    entry.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _getMoodEmoji(entry.mood),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              _formatDate(entry.date),
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),

            // Stats Section
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatItem(
                        'Mood',
                        _getMoodLabel(entry.mood),
                        Colors.blue,
                      ),
                      _buildStatItem(
                        'Rating',
                        '${entry.rating}/10',
                        Colors.green,
                      ),
                      _buildStatItem(
                        'Activities',
                        '${entry.activities.length}',
                        Colors.orange,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Content
            const Text(
              'Journal Entry',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                entry.content,
                style: const TextStyle(fontSize: 14, height: 1.6),
              ),
            ),
            const SizedBox(height: 24),

            // Activities
            if (entry.activities.isNotEmpty) ...[
              const Text(
                'Activities',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: entry.activities
                    .map(
                      (activity) => Chip(
                        label: Text(activity),
                        backgroundColor: Colors.blue.withValues(alpha: 0.2),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 24),
            ],

            // Tags
            if (entry.tags.isNotEmpty) ...[
              const Text(
                'Tags',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: entry.tags
                    .map(
                      (tag) => Chip(
                        label: Text(tag),
                        backgroundColor: Colors.green.withValues(alpha: 0.2),
                      ),
                    )
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _getMoodEmoji(String mood) {
    switch (mood) {
      case 'happy':
        return const Text('😊', style: TextStyle(fontSize: 40));
      case 'sad':
        return const Text('😢', style: TextStyle(fontSize: 40));
      case 'angry':
        return const Text('😠', style: TextStyle(fontSize: 40));
      case 'excited':
        return const Text('🤩', style: TextStyle(fontSize: 40));
      case 'tired':
        return const Text('😴', style: TextStyle(fontSize: 40));
      default:
        return const Text('😐', style: TextStyle(fontSize: 40));
    }
  }

  String _getMoodLabel(String mood) {
    return mood[0].toUpperCase() + mood.substring(1);
  }

  String _formatDate(DateTime date) {
    final day = date.day;
    final month = _getMonthName(date.month);
    final year = date.year;
    return '$day $month $year';
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }
}
