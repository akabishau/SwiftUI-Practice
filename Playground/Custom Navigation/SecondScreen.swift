//
//  SecondScreen.swift
//  Playground
//
//  Created by Aleksey Kabishau on 11/22/23.
//

import SwiftUI

struct SecondScreen: View {
	
	var onBackButtonTap: () -> Void
	
	var body: some View {
		Text("Second Screen")
		Button("Back to First Screen") {
			onBackButtonTap()
		}
	}
}

#Preview {
	SecondScreen {
		print("Button tapped in preview")
	}
}
