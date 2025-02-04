# book_app

This is a simple Flutter project that displays a list of books. The app fetches book data from a local or remote source and presents it in a user-friendly list view.

- 🎨 [Architecture Design](#architecture-design)
lib/
│── main.dart         # Entry point of the app
│── core/
│   ├── networking/
│   │   ├── api_service
│   │   ├── api_handler_error
│   ├── utils/
│   │   ├── constants
│── features/
│   ├── ui/
│   │   ├── screens
│   │   ├── widgest
│   ├── data/
│   │   ├── models    
│   │   ├── repo
│   ├── logic/
│   │   ├── cubit

## Features

Every feature mainly contains of 3 basic layers `data` , `logic` and `ui`

### Splash screen before loading the main app.
### Onboarding screen for first-time users.
### Home screen displaying a list of books with titles, authors, and covers.
### Search functionality to filter books.
### Book details screen with extended information.
### Add books to a favorites list.

## Tools

### ***flutter_bloc***: For state management using Cubit.
### **dio***: For handling network requests.
### hive: hive: A lightweight and fast database.
### shared_preferences: For simple local storage
### 

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
