//
//  DurationSelectionView.swift
//  FiveMinutes Watch App
//
//  Created by GAPT on 27/07/25.
//

import SwiftUI

struct DurationSelectionView: View {
    
    @AppStorage("timerDuration") var selectedDuration = 300
    let availableDurations = [180, 300, 600]
    
    
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
                Picker("Seleccionar Duración", selection: $selectedDuration) {
                    ForEach(availableDurations, id: \.self) { duration in
                        Text("\(duration / 60) minutos").tag(duration)
                    }
                }
                .pickerStyle(.wheel)
                // El .labelsHidden() hace que solo se vea la rueda, que es lo que queremos.
                .labelsHidden()
            }
            .foregroundColor(.white)
            
        }
        .navigationTitle("Duración")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DurationSelectionView()
}
