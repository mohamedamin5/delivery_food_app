# Delivery App (Feature-First Clean Architecture)

A Flutter delivery application with a Feature-First, Clean Architecture layout suitable for publishing as a portfolio project.

Short description
- A mobile app for ordering food with multi-role support (Customer, Chef/Seller), live order tracking, and real-time notifications.

Key features
- Instant order tracking (courier/driver location updates)
- Multi-role flows: Customer, Chef (Seller), Delivery
- Authentication with secure storage
- Payment flow and saved cards
- Order history and status updates
- Modular feature-first architecture ready for scaling

Tech stack
- Flutter (Dart)
- BLoC for state management
- FastAPI backend (assumed) with SQLAlchemy + PostgreSQL
- Dio for networking, secure local storage

New project structure (Feature-First)

lib/
  core/
    navigation/
      approute.dart            # central routing re-export (moved)
      screens.dart            # central screen re-exports (moved)
    bloc/
      blocs_imports.dart      # common BLoC exports (moved)
    data/                     # shared data sources, API consumers
    ui_essentials.dart
    widget/                   # shared widgets
    localization/
    themes/
    id/                       # service locator
  features/
    auth/
      data/
        auth_repository.dart
        data_sources/
      domain/
        entities/
        usecases/
        repositories/
      presentation/
        bloc/
        screens/
    customer_order/
      data/
      domain/
      presentation/
    chef_dashboard/
      ...
    tracking/
      presentation/
    notification/
      presentation/
    home/
      presentation/
      logic/
    payment/
    cart/
    profile/
    orders/
    splashscreens/

Notes
- I moved routing and centralized exports into `lib/core/navigation` and aggregated common bloc exports under `lib/core/bloc`.
- Original top-level files (`lib/approute.dart`, `lib/screens.dart`, `lib/blocs_imports.dart`) were kept as small re-export stubs with header comments explaining why.

Next steps
- I can continue: fully split feature folders into Data/Domain/Presentation layers, add repository interfaces, and move models and data sources into feature folders.
- Run `flutter analyze` and `flutter test` to validate imports and fix any compile issues.

