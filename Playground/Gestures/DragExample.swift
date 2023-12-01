//
//  Drag.swift
//  Playground
//
//  Created by Aleksey Kabishau on 11/30/23.
//

import SwiftUI

struct CardDrag: View {
	let number: Int
	@State private var dragOffset = CGSize.zero  // This will track the drag state
	
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 10)
				.fill(Color.white)
				.frame(width: 300, height: 200)
				.shadow(radius: 5)
			
			Text(String(number))
				.font(.largeTitle)
				.foregroundColor(.black)
		}
		.offset(dragOffset)  // Apply the drag offset to the card
		.gesture(
			DragGesture()
				.onChanged { gesture in
					dragOffset = gesture.translation
				}
				.onEnded { _ in
					dragOffset = .zero  // Reset the offset when the drag ends
				}
		)
	}
}

#Preview {
	CardDrag(number: 1)
}
