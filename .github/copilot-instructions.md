<!-- Copilot Instructions for AgriGrow Flutter App -->

## Project Overview

This is a Flutter mobile application called **AgriGrow** - an agricultural app for farmers designed to provide real-time weather monitoring, crop health tracking, sensor data visualization, and quick access to agricultural resources.

## Key Features Implemented

✅ **Home Page UI** - Matches the design specifications exactly with:
  - Header section with user greeting
  - Weather cards for multiple locations
  - Live sensor data dashboard (soil moisture, temperature, humidity, pH)
  - Intercrop suggestions with crop health status
  - Quick action buttons grid (9 actions)
  - Bottom navigation bar (6 navigation items)

✅ **Design System**
  - Material Design 3 with custom green color scheme (#22C55E)
  - Responsive grid layouts
  - Consistent spacing and typography
  - Custom widgets for reusability

## Development Setup

- **Framework**: Flutter (Dart)
- **Min SDK**: 2.19.0
- **Target Platforms**: Android, iOS, Web
- **Key Dependencies**: intl, cupertino_icons

## File Structure

```
lib/
├── main.dart                    # App entry point
├── screens/
│   └── home_screen.dart        # Main home page
└── widgets/
    ├── weather_card.dart       # Weather display component
    ├── live_data_card.dart     # Sensor data card component
    ├── intercrop_card.dart     # Crop health component
    └── quick_action_button.dart # Action button component
```

## Running the App

1. Get dependencies: `flutter pub get`
2. Run the app: `flutter run`
3. For web: `flutter run -d chrome`
4. For iOS: `flutter run -d ios`
5. For Android: `flutter run -d android`

## Future Enhancement Areas

- API integration for real weather and sensor data
- User authentication
- Local storage/offline support
- Push notifications
- Image upload for disease detection
- Map integration for field locations
- Dark mode support
