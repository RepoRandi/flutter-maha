# User Management App

A simple Flutter application for managing users, utilizing the BLoC pattern for state management. This app fetches a list of users from an API, allows the creation of new users, and displays user details.

## Features

- Fetch and display a list of users
- Create a new user
- Display user details

### Project Structure

lib
├── bloc
│   └── user
│       ├── user_bloc.dart
│       ├── user_event.dart
│       └── user_state.dart
├── data
│   ├── models
│   │   └── user_model.dart
│   └── repositories
│       └── user_repository.dart
├── ui
│   ├── pages
│   │   ├── create_user_page.dart
│   │   ├── home_page.dart
│   │   └── user_detail_page.dart
└── main.dart

## API Endpoints

- **GET** /api/users?page=2: Fetches a list of users.
- **POST** /api/users: Creates a new user.

## Getting Started

### Prerequisites

- Flutter SDK
- An editor (e.g., VSCode, Android Studio)

### Installation

1. Clone the repository:

```bash
git clone https://github.com/RepoRandi/flutter-maha
cd flutter-maha

2. Install dependencies:

```bash
flutter pub get

3. Run the app:

```bash
flutter run
