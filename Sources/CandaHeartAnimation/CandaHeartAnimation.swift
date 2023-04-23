import SwiftUI

@available(iOS 13.0, *)
public struct CandaHeartAnimation: View {
	
	// MARK: - Properties
	@ObservedObject var vm: CandaHeartViewModel
	private let onTap: () -> Void
	
	// MARK: - Init
	public init(vm: CandaHeartViewModel, onTap: @escaping () -> Void) {
		self.vm = vm
		self.onTap = onTap
	}
	
	// MARK: - View
	public var body: some View {
		VStack {
			ZStack {
				ForEach(vm.hearts) { heart in
					Image(systemName: "heart.fill")
						.font(.system(size: vm.heartButtonSize))
						.foregroundColor(vm.heartColor.colorValue)
						.opacity(heart.opacity)
						.offset(x: heart.x, y: heart.y)
						.animation(
							Animation.linear(duration: vm.heartAnimationDuration)
								.delay(Double.random(in: 0...0.4))
						)
						.onAppear {
							withAnimation {
								heart.x = CGFloat.random(in: -20...20)
								heart.y = CGFloat.random(in: -150 ... -100)
								heart.opacity = 1
							}
						}
				}
				
				ZStack {
					Circle()
						.fill(Color.white.opacity(0.4))
						.frame(width: vm.heartButtonSize + 15, height: vm.heartButtonSize + 15)
					Button(action: onClick) {
						Image(systemName: vm.heartState.rawValue)
							.font(.system(size: vm.heartButtonSize))
							.foregroundColor(vm.heartColor.colorValue)
					}
				}
			}
		}
		.onAppear {
			// populate the hearts
			vm.generateHearts()
		}
	}

	
	//MARK: - Helper function
	private func onClick() {
		onTap()
	}
}

// MARK: Preview
public struct CandaHeartAnimation_Previews: PreviewProvider {
	@available(iOS 13.0.0, *)
	public static var previews: some View {
		CandaHeartAnimation(vm: .init(heartButtonSize: 25,
									  heartAnimationDuration: 0.8,
									  numberOfHeartToAnimate: 4), onTap: { })
	}
}
