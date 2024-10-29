
# MyLittleRadio

  

MyLittleRadio is an iOS application developed in the context of a technical test for Radio France. It uses SwiftUI, Clean Architecture principles and TCA (The Composable Architecture).

  

## Features

  

-  **Stations List**:  A list of stations based on a json fetched from mocked API .

-  **Station details**: Selecting a station leads to a details page where you can play station live stream.

-  **Streaming**: live streaming the selected station in details view.

  

## Clean Architecture

  

The project has been done following a clean, modular architecture built on top of TCA and **Clean Architecture principles**:

  

### Modules

  

-  **Data Module**: Responsible for API interactions; the Station model is directly mapped from server responses.

-  **Domain Module**: Encapsulates business logic, includes Station entities mapped from the model of the Data module.

-  **Feature Modules** [Presentation]: Each feature module would have a composition of TCA components (Store, state, action) and View, which map Domain entities to UI-friendly view states.

 

<img  src="Images/CleanLittleRadio.drawio.png"  >

  

## Data Flow and Model Mapping

  

Data flows through the app in clear separations of layers, respecting Clean Architecture rules. Data is fetched raw from API and parsed into a `Station` model, and mapped to a  StationEntity :

  

2.  **Domain Layer**: It maps the `Station` model from the data layer to a `StationEntity` in the domain layer.

3.  **Presentation Layer**: The `StationEntity` is transformed into view-specific states, which represent the UI requirements. This should make it a little clearer how the decoupling of UI Components from Business and Data Logic works.

  

<img  src="Images/LittleDataFlow.drawio.png"  >

  

## Dependency Inversion

  

The project uses **dependency inversion** by re-implementing the initialization of `DependencyKey`. This approach allows the Domain layer to access the Data layer's functionality indirectly, respecting Clean Architecture principles by removing direct dependencies to domain.

  
  

### Player Library

  

* Wraps AVPlayer framework, which is in charge of playing audio.

  

## Design System

  

The **Design System** according to Atomic design principle, to have reusable UI components:

  

-  **UI Components**: Reusable SwiftUI components, animations, text images ...

  

-  **Custom Constants**: Reusabe and consistant elements-spacing, borders, and radius...

  

-  **Asset Management**: Generated assets using Xcode's automatic asset catalog. however in order to make generated images public, we wrap asserts catalog images in an enum.

  

<img  src="Images/designsystem.png"  width="400"  >

  

## TCA Integration

  

- The app is designed according TCA and presentation logic is well-separated into Reducers and Views.

> **Note**
> The main module does not include any UI logic or navigation, it calls only the starting module, and this last is autonomous and can by it's own, present other pages from other modules. this ensures to avoid exposing internal modules components into the main module.


## Testing

  

-  **Unit Testing**: New **Swift testing framework** used along with the TCA testing tools.

-  **Test Plan**: Included test plan that combines the tests inside all modules. This makes testing easy.

  

## UI and UX Enhancements

  

-  **ListTile Rendering**: Using of `List` instead of `LazyVStack` of stations list to efficiently use memory.

  

## Development Tools

  

-  **SwiftFormat**: I runned SwiftFormat over the project with custom configuration file, that you can find in the root directory

-  **SwiftLint**: I used Swiftlint autocorrect to fix SwiftLint warnings automaticaly, without explicitly using swiftlint library as a dependency in our project.

-  **Periphery**: Helps in the detection of the unused code.