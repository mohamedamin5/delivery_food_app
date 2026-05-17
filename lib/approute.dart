// What I changed: Moved routing logic to `lib/core/navigation/approute.dart` to follow Feature-First Clean Architecture.
// Why: keep top-level `lib/` clean and group shared/navigation code under `core`.
// This file now re-exports the new implementation so existing imports keep working during refactor.

export 'package:flutter_application_2/core/navigation/approute.dart';
