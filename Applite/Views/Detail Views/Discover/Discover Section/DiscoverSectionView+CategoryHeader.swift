//
//  DiscoverSectionView+CategoryHeader.swift
//  Applite
//
//  Created by Milán Várady on 2024.12.26.
//

import SwiftUI

extension DiscoverSectionView {
    var categoryHeader: some View {
        HStack(alignment: .bottom) {
            let fontSize: CGFloat = 24

            Image(systemName: category.sfSymbol)
                .font(.system(size: fontSize))

            Text(LocalizedStringKey(category.id))
                .font(.system(size: fontSize, weight: .bold))

            Button("See All") {
                navigationSelection = .appCategory(categoryId: category.id)
            }
            .buttonStyle(.plain)
            .foregroundColor(.blue)
            .padding(.bottom, 3)
        }
    }
}
