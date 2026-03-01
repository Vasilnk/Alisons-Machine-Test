# Alisons Machine Test

This is the machine test project for Flutter developer role. I've implemented the login and home screen UI based on the Figma design provided.

### Features
- Login screen with email and password validation, connected to the backend POST API.
- Home screen layout that matches the provided design exactly, including responsive overflow handling.
- Fetches categories, best sellers, and new arrivals dynamically from the home API endpoint.
- Local banners added manually as per instructions to avoid complex static API issues.
- Integrated a caching logic to pass the login ID and Token to the Home API dynamically.
- Handled network errors, loading states, and edge cases gracefully.

### Tech Stack
- **Flutter & Dart**: Core framework and language.
- **Provider**: Handled state management (AuthProvider and HomeProvider) to fetch and store data cleanly.
- **Dio**: For handling HTTP POST requests and parsing JSON.
- **Custom Fonts**: Used `Lufga` as the default font family for the app styling.

### How to run
1. Extract or clone the project files.
2. Start an emulator or connect a real device and run `flutter run`.

Notes: 
- Internet connection is required to load the product items from the server.
- The project has been refactored to separate the services and providers nicely making the code easier to read.
