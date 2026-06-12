# AgriGrow - Agricultural Mobile App

A modern Flutter mobile application designed for farmers to manage their crops, monitor weather conditions, track soil data, and access market information.

## Features

- **Weather Monitoring**: Real-time weather updates for multiple locations
- **Live Data Tracking**: Monitor soil moisture, temperature, humidity, and soil pH
- **Intercrop Suggestions**: Get recommendations for crop combinations based on current conditions
- **Quick Actions**: Easy access to essential features like LMS, Disease Detection, Market Prices, and more
- **Crop Health Analytics**: Visual representation of crop health status
- **Market Information**: Access current market prices for agricultural products
- **Livestock Management**: Track and manage livestock information
- **News & Updates**: Stay informed with latest agricultural news and updates

## Project Structure

```
lib/
├── main.dart           # Application entry point
├── screens/
│   └── home_screen.dart    # Home page UI
└── widgets/
    ├── weather_card.dart       # Weather information card
    ├── live_data_card.dart     # Live sensor data card
    ├── intercrop_card.dart     # Crop health suggestion card
    └── quick_action_button.dart # Quick action buttons
```

## Requirements

- Flutter SDK >= 2.19.0
- Dart >= 2.19.0

## Installation

1. Clone the repository
2. Navigate to the project directory
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the app

## Dependencies

- `intl`: For internationalization and date formatting
- `cupertino_icons`: iOS-style icons

## UI Features

- Material Design 3 with custom color scheme
- Responsive grid layout for quick actions
- Custom weather cards with detailed forecasts
- Interactive sensor data visualization
- Bottom navigation bar for app navigation
- Real-time data monitoring dashboard

## Building

### Debug Build
```bash
flutter run
```

### Release Build
```bash
flutter build apk      # For Android
flutter build ios      # For iOS
flutter build web      # For Web
```

## Future Enhancements

- Real API integration for weather and sensor data
- User authentication system
- Offline mode support
- Push notifications
- Crop calendar integration
- Advanced analytics and reporting
- Multi-language support

## License

This project is licensed under the MIT License.

## Support

For issues and feature requests, please contact the development team.
