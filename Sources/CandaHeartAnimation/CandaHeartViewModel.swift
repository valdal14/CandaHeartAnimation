//
//  File.swift
//  
//
//  Created by Valerio D'ALESSIO on 21/4/23.
//

import SwiftUI

// MARK: - Types
public class Heart: Identifiable {
	public let id = UUID()
	public var x: CGFloat = 0
	public var y: CGFloat = 0
	public var opacity: Double = 0
}

public enum HeartState: String {
	case stroke = "heart"
	case fill = "heart.fill"
}

@available(iOS 13.0, *)
public enum HeartColor {
	case red(Color)
	case black(Color)
	case blue(Color)
	case custom(Color)
	
	var colorValue: Color {
		switch self {
		case .red(let color):
			return color
		case .black(let color):
			return color
		case .blue(let color):
			return color
		case .custom(let color):
			return color
		}
	}
}

@available(iOS 13.0, *)
@MainActor
public final class CandaHeartViewModel: ObservableObject {
	
	// MARK: - Heart Button properties
	public var heartButtonSize: CGFloat = 25
	
	// MARK: - Animated Hearts properties
	public var heartAnimationDuration: Double = 0.5
	public var numberOfHeartToAnimate: Int = 4
	
	public var heartIconSize: CGFloat {
		return heartButtonSize / 2
	}
	
	// MARK: - Shared properties
	public let heartColor: HeartColor = .black(.black)
	
	// MARK: - Published properties
	public var heartState: HeartState = .stroke
	
	// MARK: - Published properties
	@Published private(set) var hearts: [Heart] = []
	
	
	// MARK: Init
	public init(heartButtonSize: CGFloat, heartAnimationDuration: Double, numberOfHeartToAnimate: Int, heartColor: HeartColor = .black(.black)) {
		self.heartButtonSize = heartButtonSize
		self.heartAnimationDuration = heartAnimationDuration
		self.numberOfHeartToAnimate = numberOfHeartToAnimate
	}
	
	// MARK: - Helpers
	public func generateHearts() {
		for _ in 0..<numberOfHeartToAnimate {
			let newHeart = Heart()
			newHeart.opacity = 0
			hearts.append(newHeart)
		}
	}
	
	public func addToWishlist(completionHandler: @escaping () async throws -> Bool) async throws -> HeartState {
		let result = try await completionHandler()
		try await changeInternalState(from: result)
		return heartState
	}

	private func changeInternalState(from result: Bool) async throws {
		if result {
			switch heartState {
			case .fill:
				heartState = .stroke
			case .stroke:
				heartState = .fill
			}
		}
	}
}
