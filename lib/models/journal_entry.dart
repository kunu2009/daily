class JournalEntry {
  final String id;
  final DateTime date;
  final String title;
  final String content;
  final List<String> tags;
  final String mood;
  final int rating;
  final List<String> activities;

  JournalEntry({
    required this.id,
    required this.date,
    required this.title,
    required this.content,
    this.tags = const [],
    this.mood = 'neutral',
    this.rating = 5,
    this.activities = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'title': title,
      'content': content,
      'tags': tags,
      'mood': mood,
      'rating': rating,
      'activities': activities,
    };
  }

  factory JournalEntry.fromMap(Map<String, dynamic> map) {
    return JournalEntry(
      id: map['id'],
      date: DateTime.parse(map['date']),
      title: map['title'],
      content: map['content'],
      tags: List<String>.from(map['tags'] ?? []),
      mood: map['mood'] ?? 'neutral',
      rating: map['rating'] ?? 5,
      activities: List<String>.from(map['activities'] ?? []),
    );
  }
}
