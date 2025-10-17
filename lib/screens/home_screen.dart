import 'package:flutter/material.dart';
import '../models/journal_entry.dart';
import 'add_entry_screen.dart';
import 'entry_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<JournalEntry> entries = [];

  @override
  void initState() {
    super.initState();
    _loadSampleData();
  }

  void _loadSampleData() {
    entries = [
      JournalEntry(
        id: '1',
        date: DateTime.now(),
        title: 'Great Day!',
        content:
            'Had an amazing day. Completed my project and spent time with friends.',
        tags: ['productive', 'social'],
        mood: 'happy',
        rating: 9,
        activities: ['Work', 'Coffee', 'Reading'],
      ),
      JournalEntry(
        id: '2',
        date: DateTime.now().subtract(const Duration(days: 1)),
        title: 'Regular Day',
        content: 'Just a normal day. Did some work and exercised.',
        tags: ['exercise', 'work'],
        mood: 'neutral',
        rating: 6,
        activities: ['Workout', 'Work', 'Cooking'],
      ),
    ];
  }

  void _addEntry() async {
    final result = await Navigator.push<JournalEntry>(
      context,
      MaterialPageRoute(builder: (context) => const AddEntryScreen()),
    );

    if (result != null) {
      setState(() {
        entries.insert(0, result);
      });
    }
  }

  void _viewEntry(JournalEntry entry) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EntryDetailScreen(entry: entry)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('7K Daily Journal'), elevation: 0),
      body: entries.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.book_outlined, size: 80, color: Colors.grey),
                  const SizedBox(height: 20),
                  const Text(
                    'No entries yet',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Start by creating your first journal entry',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final entry = entries[index];
                return _buildEntryCard(entry);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addEntry,
        tooltip: 'Add New Entry',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildEntryCard(JournalEntry entry) {
    return GestureDetector(
      onTap: () => _viewEntry(entry),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      entry.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  _getMoodEmoji(entry.mood),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                _formatDate(entry.date),
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              const SizedBox(height: 8),
              Text(
                entry.content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey[700]),
              ),
              const SizedBox(height: 8),
              if (entry.tags.isNotEmpty)
                Wrap(
                  spacing: 4,
                  children: entry.tags
                      .map(
                        (tag) => Chip(
                          label: Text(tag),
                          labelStyle: const TextStyle(fontSize: 12),
                          visualDensity: VisualDensity.compact,
                        ),
                      )
                      .toList(),
                ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rating: ${entry.rating}/10',
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Activities: ${entry.activities.length}',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getMoodEmoji(String mood) {
    switch (mood) {
      case 'happy':
        return const Text('😊', style: TextStyle(fontSize: 24));
      case 'sad':
        return const Text('😢', style: TextStyle(fontSize: 24));
      case 'angry':
        return const Text('😠', style: TextStyle(fontSize: 24));
      case 'excited':
        return const Text('🤩', style: TextStyle(fontSize: 24));
      case 'tired':
        return const Text('😴', style: TextStyle(fontSize: 24));
      default:
        return const Text('😐', style: TextStyle(fontSize: 24));
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
