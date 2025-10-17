# 7K Daily - Flutter Journal App - Development Guide

## Project Overview

**7K Daily** is a Flutter-based daily journal and activity tracker application that helps users record and track their daily activities, emotions, and reflections.

## Technology Stack

- **Framework**: Flutter 3.9.2+
- **Language**: Dart
- **UI Framework**: Material Design 3
- **State Management**: StatefulWidget
- **Dependencies**:
  - `uuid: ^4.0.0` - For generating unique entry IDs
  - `cupertino_icons: ^1.0.8` - iOS-style icons

## Project Structure

```
seven_k_daily/
├── lib/
│   ├── main.dart                           # App entry point and root widget
│   ├── models/
│   │   └── journal_entry.dart             # JournalEntry data model
│   └── screens/
│       ├── home_screen.dart               # Main entry list screen
│       ├── add_entry_screen.dart          # New entry creation screen
│       └── entry_detail_screen.dart       # Entry detail view screen
├── test/
│   └── widget_test.dart                   # Basic widget tests
├── pubspec.yaml                           # Project dependencies and config
├── README.md                              # User documentation
└── analysis_options.yaml                  # Dart analysis settings
```

## Key Features

### Core Functionality
- **Journal Entry Management**: Create, view, and browse journal entries
- **Mood Tracking**: Track emotional states with visual emoji indicators
- **Daily Rating**: Rate each day on a 1-10 scale
- **Activity Logging**: Track activities performed during the day
- **Tag System**: Add custom tags for organizing entries
- **Date Tracking**: Automatic date stamping for entries

### Data Model (journal_entry.dart)
```dart
class JournalEntry {
  final String id;           // Unique identifier
  final DateTime date;       // Entry date/time
  final String title;        // Entry title
  final String content;      // Journal content
  final List<String> tags;   // Custom tags
  final String mood;         // Mood state
  final int rating;          // Day rating (1-10)
  final List<String> activities;  // Activities performed
}
```

## Development Setup

### Prerequisites
- Flutter SDK 3.9.2 or higher
- Dart SDK (included with Flutter)
- Android Studio / Xcode (for emulator)

### Getting Started
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

4. Run tests:
   ```bash
   flutter test
   ```

## Screen Descriptions

### HomeScreen (lib/screens/home_screen.dart)
- **Purpose**: Display all journal entries
- **Key Features**:
  - Entry card list view (newest first)
  - Quick preview of entries
  - Mood emoji display
  - Activity count indicator
  - Floating action button to add new entry
  - Empty state message when no entries exist

### AddEntryScreen (lib/screens/add_entry_screen.dart)
- **Purpose**: Create new journal entries
- **Key Components**:
  - Title input field
  - Mood selection (6 options with emoji)
  - Day rating slider (1-10)
  - Activity selection (8 pre-defined options)
  - Journal content text area
  - Custom tag input
  - Save button

### EntryDetailScreen (lib/screens/entry_detail_screen.dart)
- **Purpose**: Display full entry details
- **Key Features**:
  - Full journal content display
  - Statistics overview (mood, rating, activity count)
  - Activities list
  - Tags display
  - Formatted date display

## Common Development Tasks

### Adding a New Screen
1. Create a new file in `lib/screens/`
2. Define a StatefulWidget or StatelessWidget
3. Import in `main.dart` if needed for navigation
4. Use Navigator for screen transitions

### Modifying the Data Model
1. Edit `lib/models/journal_entry.dart`
2. Update the `toMap()` and `fromMap()` methods
3. Update affected screens that use the model

### Adding New Features
1. Plan the feature and identify affected screens
2. Update the model if data changes are needed
3. Update relevant screens
4. Test with `flutter test` or manual testing
5. Format code with `flutter format .`

## Debugging

### Common Issues
- **Dependencies not found**: Run `flutter pub get`
- **Build errors**: Clean build with `flutter clean` then `flutter pub get`
- **Hot reload not working**: Use hot restart or full rebuild
- **Emulator issues**: Restart emulator or use physical device

### Debugging Tools
- Flutter DevTools: `flutter pub global run devtools`
- Android Studio debugger for native code
- VS Code debugging extensions

## Code Standards

### Formatting
All code must be formatted with:
```bash
flutter format .
```

### Analysis
Check for issues with:
```bash
flutter analyze
```

### Naming Conventions
- Classes: PascalCase (`JournalEntry`, `HomeScreen`)
- Functions/Variables: camelCase (`getEntryById`, `selectedMood`)
- Constants: camelCase or UPPER_SNAKE_CASE
- Private members: Prefix with underscore (`_selectedTags`)
- Files: snake_case (`journal_entry.dart`, `home_screen.dart`)

## Testing Strategy

### Unit Tests
- Test data models independently
- Test business logic functions
- Validate edge cases

### Widget Tests
- Test individual widgets
- Verify UI interactions
- Check state changes

### Integration Tests
- Test complete user flows
- Test navigation between screens
- Verify data persistence (when implemented)

## Future Enhancements

### High Priority
- [ ] Local data persistence (SQLite)
- [ ] Entry editing and deletion
- [ ] Search functionality
- [ ] Entry filtering by tags/mood

### Medium Priority
- [ ] Cloud sync (Firebase)
- [ ] Statistics dashboard
- [ ] Mood/activity charts
- [ ] Export entries (PDF/CSV)

### Nice to Have
- [ ] Dark theme support
- [ ] Push notifications/reminders
- [ ] Photo attachments
- [ ] Voice-to-text
- [ ] Shared entries
- [ ] Backup and restore

## Performance Considerations

### Current Approach
- In-memory data storage (sample data)
- Immediate UI updates with setState

### Future Optimizations
- Pagination for large entry lists
- Lazy loading for images
- Database queries optimization
- Caching strategies

## Deployment

### Android
```bash
flutter build apk
flutter build appbundle  # For Play Store
```

### iOS
```bash
flutter build ios
```

### Web
```bash
flutter build web
```

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Material Design 3](https://m3.material.io/)
- [Pub.dev](https://pub.dev) - Dart/Flutter packages

## Support & Contribution

For questions or improvements, refer to the main README.md file or contact the development team.

---

Last Updated: October 2025
Version: 1.0.0
