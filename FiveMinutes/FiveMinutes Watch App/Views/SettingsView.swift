//
//  SettingsView.swift
//  FiveMinutes Watch App
//
//  Created by GAPT on 22/07/25.
//

import SwiftUI


struct SettingsView: View {
    @AppStorage("timerDuration") var selectedDuration = 300
    @AppStorage("phraseCategory") var selectedCategory = "General"
    
    var body: some View {
        // Usamos un 'List' para una apariencia nativa de watchOS.
        ZStack {
            
            // Gradiente
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            List {
                // Cada opción es un NavigationLink que lleva a su propia pantalla de selección.
                NavigationLink(destination: DurationSelectionView()) {
                    VStack(alignment: .leading) {
                        Text("Duración del Descanso")
                            .foregroundColor(.white)
                        // Mostramos el valor actual para que el usuario tenga contexto.
                        Text("\(selectedDuration / 60) minutos")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.7))
                    }
                }
                .listRowBackground(Color.white.opacity(0.1))
                
                NavigationLink(destination: CategorySelectionView()) {
                    VStack(alignment: .leading) {
                        Text("Categoría de Frases")
                            .foregroundColor(.white)
                        // Mostramos la categoría actual.
                        Text(selectedCategory)
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.7))
                    }
                }
                .listRowBackground(Color.white.opacity(0.1))
            }
            .navigationTitle("Ajustes")
        }
    }
}
#Preview {
    NavigationStack {
        SettingsView()
    }
}
