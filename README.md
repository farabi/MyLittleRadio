# MyLittleRadio

MyLittleRadio is an iOS application developed in the context of a technical test for Radio France. It uses SwiftUI, Clean Architecture principles and TCA (The Composable Architecture).

## Features

- **Station details**: A selected station will show Station details by the user on the list.
- **Streaming**: live streaming is integrated in the station detail view.

## Clean Architecture

The project has been done following a clean, modular architecture built on top of TCA and Clean Architecture principles:

### Modules

- Data Module: Responsible for API interactions; the Station model is directly mapped from server responses.
- Domain Module: Encapsulates business logic; includes Station entities mapped from the model of the Data module. It follows dependency inversion with the re-implementation of initialization of `DependencyKey`.
- Feature Modules [Presentation]: Each feature module would have a composition of TCA components (Store, state, action) and View, which map Domain entities to UI-friendly view states.

<img src="Images/CleanLittleRadio.drawio.png" >

## Data Flow and Model Mapping

Data flows through the app in clear separations in layering, abiding by Clean Architecture rules. Data is fetched raw from API and parsed into a `Station` model, specific to the data layer:.

2. **Domain Layer**: It maps the `Station` model from the data layer to a `StationEntity` in the domain layer. It encapsulates the business logics within itself and lets the core logics have the flexibility that do not depend on any of the changes in the external data format.
3. **Presentation Layer**: The `StationEntity` is transformed into view-specific states, which represent the UI requirements. This should make it a little clearer how the decoupling of UI Components from Business and Data Logic works for clean, testable, and maintainable code.

<img src="Images/LittleDataFlow.drawio.png" >

### Player Library

* Wraps around the underpinning AVPlayer framework, which is in charge of playing audio.

## Design System

The **Design System** module is designed with reusability in mind to make sure the UI is consistent and includes:

- **UI Components**: Reusable SwiftUI components, animations, and styling elements-spacing, borders, and radius.

- **Custom Constants**: So far, the design system has utilized manually defined constants, especially when there is a need for public access across modules.

- **Asset Management**: General assets use Xcode's automatic asset catalog generation. This efficiently maintains standard assets while keeping the necessary design constants public with its manual configurations.

<img src="Images/designsystem.png" width="400" >

## TCA Integration

- The app is designed per the norms of TCA and presentation logic is well-separated into Reducers and Views.
- Main module starts only the initial module, which handles the application flow itself with least logic inside the main application module.

## Testing

- **Unit Testing**: New **Swift testing framework** used along with the TCA testing tools.

- **Test Plan**: Included test plan that combines the tests inside all modules. This makes testing easy.

## UI and UX Enhancements

ListTile Rendering: Using of `List` instead of `LazyVStack` to efficiently use memory.
Modular Components: Created Custom UI components with design tokens for a consistent look and feel.

## Development Tools

SwiftFormat: Added but with custom configuration so the code consistency is maintained.
SwiftLint: It allows autocorrect to maintain quality in code.
Periphery: It helps in the detection of the unused code.
