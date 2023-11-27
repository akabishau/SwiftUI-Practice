//
//  TransitionContentView.swift
//  Playground
//
//  Created by Aleksey Kabishau on 11/27/23.
//

import SwiftUI

struct TwoScreenCustomTransitionView: View {
	
	@State private var isSecondScreenShown = false
	
	var body: some View {
		VStack {
			if isSecondScreenShown {
				SecondScreen {
					withAnimation {
						isSecondScreenShown = false
					}
				}
			} else {
				FirstScreen {
					withAnimation {
						isSecondScreenShown = true
					}
				}
			}
		}
		.transition(.asymmetric(insertion: .opacity, removal: .opacity))
	}
}

#Preview {
	TwoScreenCustomTransitionView()
}
