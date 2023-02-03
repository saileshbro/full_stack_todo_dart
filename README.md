# **🚀 Building a Fullstack App with dart_frog and Flutter in a Monorepo**

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]
[![Powered by Dart Frog][dart_frog_badge]][dart_frog_link]
[![Powered by Mason][mason_badge]][mason_link]
[![Maintained with Melos][melos_badge]][melos_link]

A full-stack to-do app written in [Flutter][flutter_link] and [dart_frog][dart_frog_link], using a mono repository and driven by [`melos`][melos_link].

> Read the full article on [**`saileshdahal.com.np`**][series_link]

# Packages

## [**`backend`**][backend_link]

The [backend][backend_link] is built with [dart_frog][dart_frog_link] and is responsible for the server-side functionality of the app. It includes components such as controllers, request handlers, middlewares, services, and repositories for todo and user management.

The [backend][backend_link] also implements [JWT][jwt_link] authentication to secure access to the application data. The data storage and retrieval is facilitated through a postgres database with the implementation of data sources and repositories from the data_source and repository packages.

The [backend][backend_link] is equipped with end-to-end tests and tests for individual components to ensure its reliability and performance.

## [**`frontend`**][frontend_link]

The [frontend][frontend_link] is written in [Flutter][flutter_link] and is responsible for the client-side functionality of the app. It includes all the necessary components for a smooth user experience, including UI elements, data management, network communication and more.

The [frontend][frontend_link] communicates with the [backend][backend_link] to retrieve and manipulate data through the usage of data sources and repositories from the [`data_source`][data_source_link] and [`repository`][repository_link] packages.

It implements [jwt][jwt_link] authentication and handles exceptions thrown by the [backend][backend_link] gracefully through the use of the [`exceptions`][exceptions_link] package.

## [**`models`**][models_link]

The models package contains the data objects used in the app. It uses the [`freezed`][freezed_link] library to define the data models, including to-do and user models, as well as data transfer objects (DTOs). The package also includes data validation logic in the DTOs, making use of the primary keys defined in the [`typedefs`][typedefs_link] package. This helps ensure the integrity of the data used throughout the application.

## [**`data_source`**][data_source_link]

The [`data_source`][data_source_link] package contains the abstract contracts for all the data sources used in the application. These contracts define the interface for accessing and manipulating data stored in the application's database. The [`data_source`][data_source_link] package makes use of the [`typedefs`][typedefs_link] and [`models`][models_link] packages to enforce data consistency and type safety. This package serves as a layer between the repository and the database, allowing the implementation details to be separated from the main application logic.

## [**`repository`**][repository_link]

The [`repository`][repository_link] package provides a central location for data storage and retrieval. It includes abstract contracts to be implemented in the [backend][backend_link] and [`frontend`][frontend_link], and makes use of the [`models`][models_link] and [`typedefs`][typedefs_link] packages.

This package uses [`either_dart`][either_dart_link] to return either a valid response or a failure. The [`repository`][repository_link] package is designed to provide a flexible and extensible data storage layer, allowing us to easily implement their own data sources and repositories while adhering to a consistent API. With its use of [`either_dart`][either_dart_link], it provides robust error handling and reporting capabilities, ensuring the stability and reliability of the app's data storage layer.

## [**`failures`**][failures_link]

The failures package contains the implementation of custom failures and error handling for the app. These failures are used by the [`repository`][repository_link] package to return specific error messages for different scenarios such as database errors, network errors, invalid input, and unauthorized access.

## [**`typedefs`**][typedefs_link]

The [`typedefs`][typedefs_link] package contains the various data types used in the app. It also includes the type mapper, which maps a given string to a specific type or returns a failure if the mapping is unsuccessful.

## [**`exceptions`**][exceptions_link]

The [`exceptions`][exceptions_link] package includes custom exceptions for the app that can be thrown in case of certain errors or failures. These exceptions contain descriptive error messages and provide information about the type of error that occurred. They are used to provide more structured error handling and improve the overall error handling process in the app.

# Getting Started

To run the app, clone the repository and follow the setup instructions for the [backend][backend_link] and [`frontend`][frontend_link]. Once setup is complete, run the app and enjoy a simple to-do app experience.

## Initial Setup

### Setup Melos

To set up [`Melos`][melos_link], run the following command to activate [`Melos`][melos_link]:

```bash
dart pub global activate melos
```

Once [`Melos`][melos_link] is activated, run the following command to bootstrap it:

```bash
melos bootstrap
```

This command will download and install all the required dependencies for [`Melos`][melos_link].

### Setup backend

[dart_frog][dart_frog_link] is the server-side framework used in the [backend][backend_link] of our app. To set up [dart_frog][dart_frog_link], run the following command:

```bash
dart pub global activate dart_frog_cli
```

This command will download and install the [dart_frog][dart_frog_link] CLI, which can be used to run [dart_frog][dart_frog_link] projects. Once [dart_frog][dart_frog_link] is installed, you can run the todo app's backend.

```bash
melos run backend:dev
```

### Setup frontend

To set up the frontend, you need to install the [Flutter][flutter_link] SDK on your machine. You can follow the instructions on [Flutter][flutter_link]'s official website to install [Flutter][flutter_link].

To run the [Flutter][flutter_link] app, use the following command in the [frontend][frontend_link] directory:

```bash
flutter run
```

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[mason_badge]: https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[dart_frog_badge]: https://img.shields.io/endpoint?url=https://tinyurl.com/dartfrog-badge
[melos_badge]: https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square

<!--  -->

[mason_link]: https://github.com/felangel/mason
[melos_link]: https://github.com/invertase/melos
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[dart_frog_link]: https://dartfrog.vgv.dev
[jwt_link]: https://jwt.io
[flutter_link]: https://flutter.dev
[freezed_link]: https://pub.dev/packages/freezed
[either_dart_link]: https://pub.dev/packages/either_dart

<!--  -->

[series_link]: https://saileshdahal.com.np/series/fullstack-dart

<!--  -->

[backend_link]: ./backend/
[frontend_link]: ./frontend/
[models_link]: ./models/
[data_source_link]: ./data_source/
[repository_link]: ./repository/
[failures_link]: ./failures/
[typedefs_link]: ./typedefs/
[exceptions_link]: ./exceptions/
