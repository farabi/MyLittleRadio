
# MyLittleRadio

MyLittleRadio is an iOS app developed as a technical test project for Radio France. It uses SwiftUI, Clean Architecture principles, and TCA (The Composable Architecture) to provide a modular and efficient streaming experience for radio stations.

## Features

- **Station details**: Users can select a station from the list to Station details.
- **Streaming**: Integrates live streaming in the station detail view.

## Design System

The **Design System** module is crafted to ensure a cohesive and reusable UI, containing:

- **UI Components**: Reusable SwiftUI components, animations, and styling elements (spacing, borders, and radius).
- **Custom Constants**: To ensure key constants are publicly accessible, manually defined constants are used within the design system, especially where public access is required across modules.
- **Asset Management**: General assets leverage Xcode’s automatic asset catalog generation. This approach efficiently manages standard assets while keeping necessary design constants public through manual configurations.

<img src="Images/designsystem.png" >

## Clean Architecture

The project follows a clean, modular architecture built around TCA and Clean Architecture principles:

### Modules

- **Data Module**: Manages API interactions and contains the Station model, mapped directly from server responses.
- **Domain Module**: Encapsulates business logic independently, containing Station entities mapped from the Data module’s model. Dependency inversion is applied by overriding `DependencyKey` initialization.
- **Feature Modules (Presentation)**: Each feature module has TCA components (Store, state, and action) and View, mapping Domain entities to UI-friendly view states.

<img src="Images/CleanLittleRadio.drawio.png" >

## Data Flow and Model Mapping

Data flows through the app in distinct layers following Clean Architecture principles:

1. **Data Layer**: The raw data is fetched from the API and parsed into a `Station` model specific to the data layer.
2. **Domain Layer**: The data layer’s `Station` model is mapped to a `StationEntity` in the domain layer. This entity is used to encapsulate business logic independently and to maintain flexibility within the core logic, avoiding dependencies on external data formats.
3. **Presentation Layer**: The `StationEntity` is then transformed into view-specific states that represent the UI needs. This approach ensures that UI components are decoupled from business and data logic, resulting in clean, testable, and maintainable code.

<img src="Images/LittleDataFlow.drawio.png" >

### Player Library

- Wraps the underlying AVPlayer framework to manage audio playback.


### TCA Integration

- The app follows TCA conventions, organizing the presentation logic into reducers and views. 
- The main module initiates only the starting module, which autonomously handles subsequent flows, minimizing logic within the main app module.

## Testing

- **Unit Testing**: Used the new **Swift testing framework** alongside TCA testing tools.
- **Test Plan**: Includes a test plan that consolidates tests across all modules, enabling streamlined testing.

## UI and UX Enhancements

- **Efficient List Rendering**: Utilizes `List` instead of `LazyVStack` for improved memory efficiency.
- **Modular Components**: Custom UI components and design tokens provide a consistent look and feel.

## Development Tools

- **SwiftFormat**: Used with a custom configuration to enforce code consistency.
- **SwiftLint**: Applied with autocorrect to maintain code quality.
- **Periphery**: Utilized to detect unused code for a cleaner codebase.
