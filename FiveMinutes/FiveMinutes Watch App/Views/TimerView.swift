//
//  TimerView.swift
//  FiveMinutes Watch App
//
//  Created by GAPT on 21/07/25.
//

import SwiftUI

import SwiftUI

struct TimerView: View {
    
    @StateObject private var timerEngine = TimerEngine()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            
            //  'if' para cambiar el contenido de la vista dinámicamente
            if timerEngine.showPhrase {
                Text(MotivationalPhrases.getRandom())
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding()
            } else {
                // Si no se muestra la frase, se muestra el temporizador
                Text(timerEngine.timeLeftString)
                    .font(.system(size: 60, design: .rounded).monospacedDigit())
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                
                Button("Cancelar") {
                    timerEngine.stop()
                    dismiss()
                }
                .tint(.red)
            }
        }
        
        // Accion -> iniciar temporizador
        .onAppear {
            timerEngine.start()
        }
        .onChange(of: timerEngine.isCompleted) {
            
            // si isCompleted es true se llama dismiss()
            if timerEngine.isCompleted {
                dismiss()
            }
        }
    }
}

#Preview {
    TimerView()
}
