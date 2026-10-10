# flutter-bloc

This repository contains a technical snippet demonstrating a typical BLoC implementation and its surrounding structure in a Flutter application. The example focuses on profile management and illustrates the separation of presentation, state management, data access, and network communication.

## Example structure

```text
lib/
├── blocs/profile/
│   ├── profile_bloc.dart
│   ├── profile_event.dart
│   └── profile_state.dart
├── errors/
│   └── generic_error.dart
├── models/
│   ├── groups/groups.dart
│   ├── impersonation/impersonation.dart
│   ├── profile/profile.dart
│   └── user/user.dart
├── pages/login/
│   └── login_page.dart
├── repositories/
│   ├── profile_repository.dart
│   └── repository.dart
└── services/network/
    ├── jto/
    ├── profile/profile_service.dart
    └── requests/impersonation/
```

## Flow and responsibilities

- **Events and states:** `ProfileEvent` defines the available operations (`get`, `getGroups`, `impersonation`, `reset`); `ProfileState` represents the initial, loading, success, error, and authorization states.
- **BLoC:** `ProfileBloc` receives events, delegates operations to the repository, and emits the corresponding states. Localized errors are preserved, while generic exceptions are converted to `GenericError`.
- **Repository:** `ProfileRepository` exposes a transport-independent contract. `ProfileRepositoryImpl` coordinates the network service and the mappers between DTOs and domain models.
- **Network service:** `ProfileService` declares HTTP calls using Retrofit and Dio to retrieve the profile and groups and submit an impersonation request.
- **Models and DTOs:** domain models represent the profile, groups, and impersonation; JTOs and request objects represent the data exchanged with the service.
- **UI:** `LoginPage` demonstrates integration with the BLoC through providers, listeners, and builders, reacting to states to update the screen and continue the authentication flow.

The snippet aims to show the overall organization of a BLoC, from event definitions through to presentation, rather than focusing only on the BLoC class itself.
