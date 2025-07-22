//
//  SettingsView.swift
//  FiveMinutes Watch App
//
//  Created by GAPT on 22/07/25.
//

import SwiftUI

struct SettingsView: View {
    // Duracion en segundos de (3, 5, 10 minutos)
    let availableDurations: [Int] = [3 * 60, 5 * 60, 10 * 60]
    
    // Variable para guardar la seleccion actual del selector
    @State private var selectedDuration: Int = 3 * 60
    
    
    var body: some View {
        VStack {
            Text("Duración del Descanso")
                .font(.headline)
            
            Picker("Tiempo", selection: $selectedDuration) {
                ForEach(availableDurations, id: \.self) { duration in
                    Text("\(duration / 60) minutos")
                    
                }
            }
            .pickerStyle(.wheel)
            Button("Guardar") {
                // Logica en la siguiente tarea
                print("Duración seleccionada: \(selectedDuration) segundos")
            }
        }
        .navigationTitle("Ajustes")
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
