//
//  CategoryButton.swift
//  YumYum
//
//  Created by fahad samara on 3/1/24.
//

import SwiftUI

struct CategoryButton: View {
    let category: String
    let isSelected: Bool
    
    var body: some View {
        Text(category)
            .font(.headline)
            .fontWeight(.bold)
            .foregroundColor(isSelected ? .white : .primary)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    isSelected ? Color.orange : Color.gray.opacity(0.6),
                                    isSelected ? Color.orange.opacity(0.8) : Color.gray.opacity(0.2)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(isSelected ? Color.orange : Color.gray.opacity(0.5), lineWidth: isSelected ? 0 : 1)
                        )
                    if isSelected {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                LinearGradient(
                                  gradient: Gradient(colors: [
                                        isSelected ? Color.gray.opacity(0.2) : Color.clear,
                                        isSelected ? Color.gray.opacity(0.1) : Color.clear
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .offset(x: 2, y: 2)
                    }
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: Color.black.opacity(0.3), radius: isSelected ? 5 : 0, x: 0, y: isSelected ? 5 : 0)
    }
}

