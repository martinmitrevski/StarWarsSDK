# StarWarsSDK

## Goal

Use the SDK for interacting with the https://swapi.dev. Currently, the SDK supports several methods:
- loading eye colors of five different people
- loading five different planets
- loading all Star Wars films

The methods are returning Combine publishers. 

## Installation

You can add the SDK as a Swift package. Open your project, go to XCode -> File -> Swift Packages -> Add Package dependency. 

Insert the following url: https://github.com/martinmitrevski/StarWarsSDK.git and set the dependency to master (since the SDK is still in development).

CocoaPods installation is not possible at the moment.

## Supported versions

iOS 13 and above.

## Usage

To use the SDK, just import the StarWarsSDK and use the methods from the shared StarWars instance.

```
import StarWarsSDK

// Loading all films.
StarWars.shared.allFilms().sink { completion in
    print("completed loading films")
} receiveValue: { [weak self] films in
    self?.films = films
}
.store(in: &cancellables)

// Loading all planets.
StarWars.shared.planetInformationForFivePlanets().sink { completion in
    print("completed loading planets")
} receiveValue: { [weak self] planets in
    self?.planets = planets
}
.store(in: &cancellables)

// Loading eye color of the people.
StarWars.shared.eyeColorForFivePeople().sink { completion in
    print("completed loading people")
} receiveValue: { [weak self] people in
    self?.eyeColorInfo = people
}
.store(in: &cancellables)
```

## Future steps

- Support for async / await.
- Support for classic completion handlers.
- Exposing more methods from the API.
- CocoaPods installation.
- More tests.
- Setup CI.

