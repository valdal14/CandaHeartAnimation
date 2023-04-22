import SwiftUI

@available(iOS 13.0, *)
public struct CandaHeartAnimation: View {
	
	// MARK: - Properties
	@ObservedObject var vm: CandaHeartViewModel
	@State private var hearts: [Heart] = []
	
	// MARK: - Init
	public init(vm: CandaHeartViewModel) {
		self.vm = vm
	}
	
	// MARK: - View
	public var body: some View {
		VStack {
			ZStack {
				ForEach(hearts) { heart in
					Image(systemName: "heart.fill")
						.font(.system(size: vm.heartIconSize))
						.foregroundColor(.red)
						.opacity(heart.opacity)
						.offset(x: heart.x, y: heart.y)
						.animation(
							Animation.linear(duration: vm.heartAnimationDuration)
								.delay(Double.random(in: 0...0.5))
						)
						.onAppear {
							withAnimation {
								heart.x = CGFloat.random(in: -50...50)
								heart.y = -100
								heart.opacity = 0
							}
						}
				}
				
				Button(action: {
					if vm.heartState == .stroke {
						for _ in 0..<vm.numberOfHeartToAnimate {
							let newHeart = Heart()
							newHeart.opacity = 1
							hearts.append(newHeart)
						}
					}
					// Add haptic feedback
					let generator = UIImpactFeedbackGenerator(style: .medium)
					generator.prepare()
					generator.impactOccurred()
					
				}) {
					Image(systemName: vm.heartState.rawValue)
						.font(.system(size: vm.heartButtonSize))
						.foregroundColor(.red)
				}
			}
		}
		.onAppear {
			// populate the hearts
			for _ in 0..<vm.numberOfHeartToAnimate {
				let newHeart = Heart()
				newHeart.opacity = 1
				hearts.append(newHeart)
			}
		}
	}
}

// MARK: - Type
public class Heart: Identifiable {
	public let id = UUID()
	public var x: CGFloat = 0
	public var y: CGFloat = 0
	public var opacity: Double = 0
}

// MARK: Preview
public struct CandaHeartAnimation_Previews: PreviewProvider {
	@available(iOS 13.0.0, *)
	public static var previews: some View {
		CandaHeartAnimation(vm: .init(heartButtonSize: 30,
							  heartAnimationDuration: 0.8,
							  numberOfHeartToAnimate: 4))
	}
}
