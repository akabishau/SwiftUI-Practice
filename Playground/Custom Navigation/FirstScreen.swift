//
//  FirstScreen.swift
//  Playground
//
//  Created by Aleksey Kabishau on 11/22/23.
//

import SwiftUI

struct FirstScreen: View {
	
	var onButtonTap: () -> Void
	
	var body: some View {
		Text("First Screen")
		Button("Go to Second Screen") {
			onButtonTap()
		}
	}
}


#Preview {
	FirstScreen(onButtonTap: {
		print("Button tapped in preview")
	})
}
