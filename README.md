# CandaHeartAnimation Swift Package

`CandaHeartAnimation` is a SwiftUI package that provides a customizable heart animation that can be triggered by a button press. The package generates heart icons that float up the screen and fade out over time, creating a pleasing visual effect.

## Installation

You can integrate `CandaHeartAnimation` into your Xcode project by using the Swift Package Manager:

1. Open your project in Xcode
2. Select "File" > "Swift Packages" > "Add Package Dependency"
3. Enter `https://github.com/candostdagdev/canda-heart-animation` as the package repository URL and click "Next"
4. Choose the version you want to install and click "Next"
5. Select the target where you want to use the package and click "Finish"

## Usage

To use `CandaHeartAnimation`, create an instance of the `CandaHeartViewModel` class with your desired animation parameters, and pass it to an instance of the `CandaHeartAnimation` view.

Here's an example:

```swift
import SwiftUI
import CandaHeartAnimation

struct ContentView: View {
    let heartViewModel = CandaHeartViewModel(heartButtonSize: 25,
                                              heartAnimationDuration: 0.8,
                                              numberOfHeartToAnimate: 4)
    var body: some View {
        CandaHeartAnimation(vm: heartViewModel)
    }
}
```

In this example, we've created an instance of `CandaHeartViewModel` with a heart button size of 25, an animation duration of 0.8 seconds, and a number of hearts to animate of 4. We then pass this instance to an instance of `CandaHeartAnimation` in the view body.

## Customization

`CandaHeartAnimation` provides several customization options that you can use to adjust the appearance and behavior of the animation:

- `heartButtonSize`: the size of the heart button that triggers the animation
- `heartAnimationDuration`: the duration of the heart animation
- `numberOfHeartToAnimate`: the number of hearts that will be animated in the view
- `Heart`: a class that defines the properties of each heart that is animated. You can modify this class to change the appearance and behavior of the hearts.

# Contribution

Contributions to `CandaHeartAnimation` are always welcome! If you find a bug or have a feature request, please open an issue on the [GitHub repository](https://github.com/valdal14/CandaHeartAnimation/issues).

If you'd like to contribute code to `CandaHeartAnimation`, please follow these steps:

1. Fork the [GitHub repository](https://github.com/valdal14/CandaHeartAnimation)
2. Clone your fork to your local machine
3. Create a new branch for your changes
4. Make your changes and commit them with clear commit messages
5. Push your changes to your fork
6. Open a pull request on the [GitHub repository](https://github.com/valdal14/CandaHeartAnimation)

Please ensure that your code adheres to the existing style and conventions used in `CandaHeartAnimation`, and that it includes appropriate tests.

## License

`CandaHeartAnimation` is released under the MIT license. See [LICENSE](https://github.com/valdal14/CandaHeartAnimation/blob/main/LICENSE) for details.
