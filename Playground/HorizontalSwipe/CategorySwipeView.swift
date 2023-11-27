//
//  HorizontalSwipeView.swift
//  Playground
//
//  Created by Aleksey Kabishau on 11/27/23.
//

import SwiftUI

enum Category: String, CaseIterable, Identifiable {
	case horror = "Horror"
	case magic = "Magic"
	case urban = "Urban"
	case random = "Random"
	
	var id: Self { self }
	
	var index: Int {
		switch self {
			case .horror:
				return 0
			case .magic:
				return 1
			case .urban:
				return 2
			case .random:
				return 3
		}
	}
}


struct CategoryView: View {
	
	let category: Category
	
	var body: some View {
		VStack {
			Text(category.rawValue)
			Text(String(category.index))
		}
	}
}


struct CustomPageControl: View {
	
	let numberOfPages: Int
	
	@Binding var currentPage: Int
	
	var body: some View {
		HStack {
			ForEach(0..<numberOfPages, id: \.self) { index in
				Rectangle()
					.fill(currentPage == index ? Color.primary : Color.secondary)
					.frame(width: 16, height: 16)
			}
		}
		.padding(.vertical)
	}
}




struct CategorySwipeView: View {
	
	@State private var selectedCategoryIndex = 1
	
	var body: some View {
		TabView(selection: $selectedCategoryIndex) {
			ForEach(Category.allCases, id: \.self) { category in
					CategoryView(category: category)
					.tag(category.index)
			}
		}
		.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
		.frame(width: 300, height: 300)
		.background(Color.blue)
		CustomPageControl(numberOfPages: Category.allCases.count, currentPage: $selectedCategoryIndex)
	}
}


#Preview {
	CategorySwipeView()
}

#Preview {
	CategoryView(category: .horror)
}
#Preview {
	CustomPageControl(numberOfPages: 4, currentPage: .constant(2))
}
