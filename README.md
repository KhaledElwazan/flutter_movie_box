# Flutter Movie Box

A Flutter project that displays a list of movies from the [The Movie Database (TMDb) API](https://www.themoviedb.org/documentation/api).


## Features
- Display a list of movies
- View movie details
- Add movies to favorites
- View favorite movies
- Caching requests
- App theme switcher

## Architecture and Design Patterns Used
- Clean Architecture
- BLoC (Business Logic Component) Pattern
- Repository Pattern
- Dependency Injection
- Singleton Pattern
- Factory Pattern

## Technologies
- dartz - Functional programming in Dart
- flutter_bloc - State management
- bloc - Business logic components
- http - Network requests
- shared_preferences - Caching requests
- equatable - Value equality
- get_it - Dependency injection
- internet_connection_checker - Check internet connection
- flutter_rating_bar - Rating stars
- intl - Internationalization
- flex_color_scheme - App theme switcher
- adaptive_theme - App mode switcher
- setting_ui - App settings

## Getting Started
1. Clone the repository
```bash
git clone
```
2. Install dependencies
```bash
flutter pub get
```
3. Create a `.env` file in the root directory and add your TMDb API key
```bash
API_KEY=YOUR_API_KEY
```
4. Run the app
```bash
flutter run
```

## Screenshots
<!-- app_drawer.png             home_screen.png    settings_screen.png
home_screen_dark_mode.png  movie_details.png  upcoming_movies.png
 -->
| Home Screen | Movie Details | Upcoming Movies |
|:-----------:|:-------------:|:---------------:|
| ![Home Screen](screenshots/home_screen.png) | ![Movie Details](screenshots/movie_details.png) | ![Upcoming Movies](screenshots/upcoming_movies.png) |

| App Drawer | Settings Screen | Home Screen (Dark Mode) |
|:----------:|:---------------:|:-----------------------:|
| ![App Drawer](screenshots/app_drawer.png) | ![Settings Screen](screenshots/settings_screen.png) | ![Home Screen (Dark Mode)](screenshots/home_screen_dark_mode.png) |


## TODO:
- [ ] Add a search bar to search for movies
- [ ] Switch from using SharedPreferences to Hive/floor for caching and storing movies
- [ ] Switch from using the http package to the dio package for network requests
- [ ] Localize the app in multiple languages
- [ ] Switching between multiple themes
- [ ] Responsive design for different screen sizes 