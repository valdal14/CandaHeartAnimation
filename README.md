# CandaHeartAnimation Swift Package

`CandaHeartAnimation` is a SwiftUI package that provides a customizable heart animation that can be triggered by a button press. The package generates heart icons that float up the screen and fade out over time, creating a pleasing visual effect.

## Installation

You can integrate `CandaHeartAnimation` into your Xcode project by using the Swift Package Manager:

1. Open your project in Xcode
2. Select "File" > "Swift Packages" > "Add Package Dependency"
3. Enter `https://github.com/valdal14/CandaHeartAnimation.git` as the package repository URL and click "Next"
4. Choose the version you want to install and click "Next"
5. Select the target where you want to use the package and click "Finish"

## Usage

Once you have installed CandaHeartAnimation, you can use the `CandaHeartAnimation` view in your SwiftUI code.

```swift
import CandaHeartAnimation

struct ContentView: View {
	
	@ObservedObject private var vm: CandaHeartViewModel
	
	init(vm: CandaHeartViewModel) {
		self.vm = vm
	}
	
	var body: some View {
		VStack {
			CandaHeartAnimation(vm: vm) {
				Task {
					do {
						let heartState = try await vm.addToWishlist {
							// simulate a network request
							return true
						}
						
						// simulate a delay
						DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
							// show animation only if the heart was stroke
							if heartState == .fill {
								vm.generateHearts()
							}
							/**
							 Animation completion handle inside the client using the
							 DispatchQueue.main.asyncAfter and by removing the hearts
							 */
							DispatchQueue.main.asyncAfter(deadline: .now() + vm.heartAnimationDuration + 0.1) {
								withAnimation {
									vm.hearts = []
								}
								// generate new hearts to repopulate the array
								vm.generateHearts()
							}
						}
					} catch {
						print("Error: \(error)")
					}
				}
			}
		}
		.padding()
	}
}
```

In this example, `CandaHeartAnimation` is wrapped inside a closure and a `Task` to handle adding to the wishlist. The `CandaHeartViewModel` is initialized and passed as a parameter to the `CandaHeartAnimation` view. The `CandaHeartAnimation` view is then displayed inside a `VStack` container. 

## Customization

`CandaHeartAnimation` provides several customization options that you can use to adjust the appearance and behavior of the animation:

- `heartButtonSize`: the size of the heart button that triggers the animation
- `heartAnimationDuration`: the duration of the heart animation
- `numberOfHeartToAnimate`: the number of hearts that will be animated in the view
- `Heart`: a class that defines the properties of each heart that is animated. You can modify this class to change the appearance and behavior of the hearts.

# Video Example
[![Watch the video](https://raw.githubusercontent.com/valdal14/Memorize/main/CandaAnimation.png)](https://youtu.be/DBBa_Bnsa4U)

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
