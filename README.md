# Location App

The Location App is a mobile application developed to provide functionalities related to obtaining device location information and displaying it on a map.

## Features

Real-time Location Retrieval: The app utilizes the device's location service to fetch the user's current location in real-time.
Map Visualization: Location information is displayed on an interactive map, allowing users to view their current position and explore the surroundings.
Support for Different Location Sources: The app is capable of obtaining device location through different sources, including GPS, mobile network, and Wi-Fi.
Core Components

The app is structured around the following core components:

1. Data Models
   PositionModel: Represents latitude and longitude coordinates of a position on the map.
   PositionResponseModel: Data model to represent the response of a location request, containing information such as country, region, and geographical coordinates.
2. Services
   GPSLocationService: Service responsible for providing location information using the device's GPS.
3. State Management
   InitStore: Stores the initial state of the application and manages operations related to application initialization, such as location permission checks and opening the next page based on location state.
4. User Interface
   InitPage: The initial page of the app, responsible for initiating location retrieval and displaying a progress indicator while awaiting a response.
   GoogleMapWidget: Widget for displaying a Google map based on the provided location information.
   ScopedListenerWidget: Widget that listens to the state of a given state store and displays error alerts if an error occurs.
5. Testing
   Unit Tests: Tests to ensure the correct behavior of the PositionResponseModel and MockFlutterConfig classes.
   Integration Test: Integration test to verify if the Google map is correctly displayed after the application is initialized.
   Widget Tests: Widget test to ensure the correct behavior of the ScopedListenerWidget widget regarding the display of error alerts.

## Technologies Used

[Flutter](https://flutter.dev) - Cross-platform app development framework.

[google_maps_flutter](https://pub.dev/packages/google_maps_flutter) - Package for integrating Google Maps into Flutter apps.

[flutter_config](https://pub.dev/packages/flutter_config) - Package for loading environment variables from .env files.

[go_router](https://pub.dev/packages/go_router) - Package for routing and navigation management in Flutter apps.

[get_it](https://pub.dev/packages/get_it) - Package for dependency injection in Flutter apps.

[dio](https://pub.dev/packages/dio) - Package for making HTTP requests in Dart and Flutter.

[either_dart](https://pub.dev/packages/either_dart) - Library for modeling success or error values in Dart.

[flutter_triple](https://pub.dev/packages/flutter_triple) - Library for state management in Flutter using the triple pattern.

[oktoast](https://pub.dev/packages/oktoast) - Package for showing toast messages in Flutter apps.

[geolocator](https://pub.dev/packages/geolocator) - Package for accessing the device's geolocation capabilities in Flutter.

[flutter_svg](https://pub.dev/packages/flutter_svg) - Package for rendering SVG images in Flutter apps.
