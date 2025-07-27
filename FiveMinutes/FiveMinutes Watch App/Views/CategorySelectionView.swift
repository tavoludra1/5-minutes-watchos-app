//
//  CategorySelectionView.swift
//  FiveMinutes Watch App
//
//  Created by GAPT on 27/07/25.
//

import SwiftUI

struct CategorySelectionView: View {
    @AppStorage("phraseCategory") var selectedCategory = "General"
    let availableCategories = ["General", "Católica", "Zen", "Laozi"]
    
    var body: some View {
        ZStack {
            // Gradiente
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Picker("Seleccionar Categoría", selection: $selectedCategory) {
                    ForEach(availableCategories, id: \.self) { category in
                        Text(category).tag(category)
                    }
                }
                .pickerStyle(.wheel)
                .labelsHidden()
            }
            .foregroundColor(.white)
            
        }
        .navigationTitle("Categoría")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CategorySelectionView()
}
