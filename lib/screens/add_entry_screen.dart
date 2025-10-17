import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/journal_entry.dart';

const uuid = Uuid();

class AddEntryScreen extends StatefulWidget {
  const AddEntryScreen({super.key});

  @override
  State<AddEntryScreen> createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  String _selectedMood = 'neutral';
  int _rating = 5;
  List<String> _selectedTags = [];
  List<String> _selectedActivities = [];

  final moodOptions = ['happy', 'sad', 'angry', 'excited', 'tired', 'neutral'];
  final activityOptions = [
    'Work',
    'Exercise',
    'Reading',
    'Cooking',
    'Social',
    'Gaming',
    'Sleep',
    'Learning',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _saveEntry() {
    if (_titleController.text.isEmpty || _contentController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    final entry = JournalEntry(
      id: uuid.v4(),
      date: DateTime.now(),
      title: _titleController.text,
      content: _contentController.text,
      mood: _selectedMood,
      rating: _rating,
      tags: _selectedTags,
      activities: _selectedActivities,
    );

    Navigator.pop(context, entry);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Entry'),
        actions: [
          IconButton(icon: const Icon(Icons.check), onPressed: _saveEntry),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Text('Title', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Enter entry title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Mood Selection
            const Text(
              'How are you feeling?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: moodOptions
                  .map(
                    (mood) => FilterChip(
                      label: Text(_getMoodLabel(mood)),
                      selected: _selectedMood == mood,
                      onSelected: (selected) {
                        setState(() => _selectedMood = mood);
                      },
                      avatar: Text(_getMoodEmoji(mood)),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),

            // Rating
            const Text(
              'Day Rating',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Slider(
              value: _rating.toDouble(),
              min: 1,
              max: 10,
              divisions: 9,
              label: '$_rating/10',
              onChanged: (value) {
                setState(() => _rating = value.toInt());
              },
            ),
            const SizedBox(height: 20),

            // Activities
            const Text(
              'Activities',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: activityOptions
                  .map(
                    (activity) => FilterChip(
                      label: Text(activity),
                      selected: _selectedActivities.contains(activity),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _selectedActivities.add(activity);
                          } else {
                            _selectedActivities.remove(activity);
                          }
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),

            // Content
            const Text(
              'Journal Entry',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                hintText: 'Write your thoughts and feelings...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              maxLines: 8,
              textAlignVertical: TextAlignVertical.top,
            ),
            const SizedBox(height: 20),

            // Tags
            const Text(
              'Tags (add custom)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                ..._selectedTags.map(
                  (tag) => Chip(
                    label: Text(tag),
                    onDeleted: () {
                      setState(() => _selectedTags.remove(tag));
                    },
                  ),
                ),
                ActionChip(
                  label: const Text('+ Add tag'),
                  onPressed: _showAddTagDialog,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showAddTagDialog() {
    final tagController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Tag'),
        content: TextField(
          controller: tagController,
          decoration: const InputDecoration(hintText: 'Enter tag name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (tagController.text.isNotEmpty) {
                setState(() {
                  _selectedTags.add(tagController.text);
                });
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  String _getMoodEmoji(String mood) {
    switch (mood) {
      case 'happy':
        return '😊';
      case 'sad':
        return '😢';
      case 'angry':
        return '😠';
      case 'excited':
        return '🤩';
      case 'tired':
        return '😴';
      default:
        return '😐';
    }
  }

  String _getMoodLabel(String mood) {
    return mood[0].toUpperCase() + mood.substring(1);
  }
}
