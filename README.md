# 7K Daily - Journal & Activity Tracker

A beautiful Flutter app designed to help you track your daily life, emotions, and activities. 7K Daily is your personal journal that helps you understand your patterns and reflect on your day.

## Features

### 📔 Daily Journaling
- Create and manage journal entries
- Write detailed thoughts and reflections
- Date tracking for all entries
- Browse past entries with ease

### 😊 Mood Tracking
- Track your emotional state with emojis
- Six mood options: Happy, Sad, Angry, Excited, Tired, Neutral
- Visual mood indicators on each entry card

### ⭐ Daily Rating
- Rate your day from 1-10
- Slider-based interface for easy rating
- Quick overview of your day quality

### 🎯 Activity Tracking
- Log activities throughout your day
- Pre-defined activities: Work, Exercise, Reading, Cooking, Social, Gaming, Sleep, Learning
- Track multiple activities per day
- Activity count overview

### 🏷️ Tags & Categories
- Add custom tags to organize entries
- Create custom tags on-the-fly
- Filter and search entries by tags
- Visual tag display on entry cards

### 📊 Entry Details
- Detailed view of each journal entry
- Statistics overview (mood, rating, activities)
- Full content display with formatting
- All metadata in one place

## Installation

### Prerequisites
- Flutter SDK (version 3.9.2 or higher)
- Dart SDK
- Android Studio or Xcode (for emulator)

### Setup
1. Navigate to the project directory:
   ```bash
   cd seven_k_daily
   ```
2. Get dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/
│   └── journal_entry.dart   # Data model for journal entries
└── screens/
    ├── home_screen.dart           # Main screen with entry list
    ├── add_entry_screen.dart      # Screen to create new entries
    └── entry_detail_screen.dart   # Screen to view entry details
```

## Dependencies

- `flutter`: Core Flutter framework
- `uuid`: For generating unique IDs for entries
- `cupertino_icons`: iOS-style icons

## How to Use

### Create a New Entry
1. Tap the floating action button (+ button)
2. Fill in the entry title
3. Select your current mood
4. Rate your day on the slider
5. Select activities you did today
6. Write your journal entry
7. Add custom tags if desired
8. Tap the check icon to save

### View an Entry
1. Tap on any entry card in the list
2. View the full details including:
   - Complete journal text
   - Mood and rating
   - All activities logged
   - Custom tags

### Browse Entries
- Entries are displayed in reverse chronological order (newest first)
- Entry cards show a preview with title, date, mood, and content snippet
- Visual indicators for mood, rating, and activity count

## Future Features

- [ ] Local data persistence (SQLite)
- [ ] Cloud sync with Firebase
- [ ] Entry editing and deletion
- [ ] Advanced statistics and analytics
- [ ] Charts and graphs for mood trends
- [ ] Search functionality
- [ ] Export entries as PDF
- [ ] Dark theme support
- [ ] Notifications and reminders
- [ ] Photo attachments
- [ ] Voice-to-text entries

## Getting Started with Flutter

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

---

**Stay mindful. Track your growth. Celebrate your journey with 7K Daily! 🌟**
