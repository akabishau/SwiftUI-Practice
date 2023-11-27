//
//  ContentView.swift
//  Playground
//
//  Created by Aleksey Kabishau on 11/22/23.
//

import SwiftUI

struct ContentView: View {
	
	var body: some View {
		NavigationView {
			List(DemoType.allCases, id: \.self, rowContent: { demo in
				NavigationLink(demo.rawValue, destination: viewForDemo(demo))
			})
			.navigationTitle("Playgrounds")
		}
	}
				 
	@ViewBuilder
	private func viewForDemo(_ demo: DemoType) -> some View {
		switch demo {
			case .transition: TwoScreenCustomTransitionView()
		}
	}
}

#Preview {
    ContentView()
}
