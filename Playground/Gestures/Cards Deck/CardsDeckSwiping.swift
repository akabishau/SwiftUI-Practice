//
//  CardsDeckSwiping.swift
//  Playground
//
//  Created by Aleksey Kabishau on 11/30/23.
//

import SwiftUI


struct CardsDeckViewSwiping: View {
	@State private var dragOffset = CGSize.zero
	@State private var cardNumbers: [Int] = [1, 2, 3]
	
	var body: some View {
		ZStack {
			ForEach(cardNumbers, id: \.self) { number in
				Card(number: number)
					.offset(number == cardNumbers.last ? dragOffset : CGSize.zero)
					.gesture(
						DragGesture()
							.onChanged({ gesture in
								dragOffset = gesture.translation
							})
							.onEnded({ _ in
								withAnimation {
									moveTopCardToEnd()
								}
							})
					)
			}
		}
	}
	
	
	private func moveTopCardToEnd() {
		dragOffset = .zero
		if let lastCard = cardNumbers.last {
			cardNumbers.removeLast()
			cardNumbers.insert(lastCard, at: 0)
		}
	}
}

struct Card: View {
	let number: Int
	
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
	}
}



#Preview {
	CardsDeckViewSwiping()
}
