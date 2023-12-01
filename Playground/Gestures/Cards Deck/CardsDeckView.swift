//
//  NewFile.swift
//  Playground
//
//  Created by Aleksey Kabishau on 11/30/23.
//

import SwiftUI

class PromptManager {
	func randomText() -> String {
		"Random sentence: \(Int.random(in: 1...100))"
	}
}

struct CardsDeckView: View {
	
	let promptManager = PromptManager()
	
	// Specific angles for a visually pleasing "random" stack of cards
	@State private var rotations: [Double] = [-5, -3, 0, 2, 5]
	
	@State private var offsets: [CGSize] = [
		CGSize(width: 0 + Double.random(in: -3...3), height: 0 + Double.random(in: -3...3)),
		
		CGSize(width: -3 + Double.random(in: -3...3), height: -3 + Double.random(in: -3...3)),
		
		CGSize(width: 3 + Double.random(in: -3...3), height: 3 + Double.random(in: -3...3)),
		CGSize(width: -5 + Double.random(in: -3...3), height: -5 + Double.random(in: -3...3)),
		CGSize(width: 5 + Double.random(in: -3...3), height: 5 + Double.random(in: -3...3))
	]
	
	@State private var sentences: [String] = []
	
	init() {
		_sentences = State(initialValue: (0..<5).map { _ in
			promptManager.randomText()
		})
	}
	
	
	var body: some View {
		ZStack {
			Image("background")
				.resizable()
				.scaledToFill()
				.ignoresSafeArea(.all)
			
			
			ForEach(Array(sentences.enumerated()), id: \.element) { index, sentence in
				CardView(sentence: sentence)
					.rotationEffect(.degrees(rotations[index]))
					.offset(offsets[index])
				// Higher zIndex for cards at the start of the array
					.zIndex(Double(sentences.count - index))
			}
		}
		
		.onTapGesture {
			withAnimation {
				
				let newSentence = promptManager.randomText()
				sentences.removeFirst()
				sentences.append(newSentence)
				
				let rotation = rotations.removeFirst()
				rotations.append(rotation)
				
				let offset = offsets.removeFirst()
				offsets.append(offset)
			}
		}
		.transition(.move(edge: .bottom))
	}
}



struct CardView: View {
	
	var sentence: String = "A lovely dragon is saving cup of bears from stupid accident"
	
	var body: some View {
		ZStack {
			Image("card")
				.resizable()
				.scaledToFit()
			//				.background(Color.secondary)
				.shadow(radius: 5)
			
			
			Text(sentence)
				.multilineTextAlignment(.center)
			//				.background(Color.secondary)
				.padding()
		}
		
		.frame(width: 300, height: 200)
	}
}


#Preview {
	CardsDeckView()
}

#Preview {
	CardView()
}
