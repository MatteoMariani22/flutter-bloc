# flutter-bloc

Questo repository raccoglie uno snippet tecnico che mostra un'implementazione tipo di un BLoC e la struttura che lo circonda in un'applicazione Flutter. L'esempio è incentrato sulla gestione del profilo e illustra la separazione tra presentazione, logica di stato, accesso ai dati e comunicazione di rete.

## Struttura dell'esempio

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

## Flusso e responsabilità

- **Eventi e stati:** `ProfileEvent` definisce le operazioni disponibili (`get`, `getGroups`, `impersonation`, `reset`); `ProfileState` rappresenta gli stati iniziali, di caricamento, di successo, di errore e di autorizzazione.
- **BLoC:** `ProfileBloc` riceve gli eventi, delega le operazioni al repository e pubblica gli stati corrispondenti. Gli errori localizzati vengono mantenuti, mentre le eccezioni generiche sono convertite in `GenericError`.
- **Repository:** `ProfileRepository` espone un contratto indipendente dal trasporto. `ProfileRepositoryImpl` coordina il servizio di rete e i mapper tra DTO e modelli di dominio.
- **Servizio di rete:** `ProfileService` dichiara le chiamate HTTP con Retrofit e Dio per recuperare profilo e gruppi e inviare una richiesta di impersonificazione.
- **Modelli e DTO:** i modelli di dominio rappresentano profilo, gruppi e impersonificazione; i JTO e le request rappresentano i dati scambiati con il servizio.
- **Interfaccia:** `LoginPage` mostra un esempio di integrazione con il BLoC tramite provider, listener e builder, reagendo agli stati per aggiornare la schermata e proseguire il flusso di autenticazione.

Lo scopo dello snippet è rendere visibile l'organizzazione complessiva di un BLoC, dalla definizione degli eventi fino alla presentazione, e non limitarsi alla sola classe del BLoC.
