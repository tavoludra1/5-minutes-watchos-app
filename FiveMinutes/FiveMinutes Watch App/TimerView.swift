//
//  TimerView.swift
//  FiveMinutes Watch App
//
//  Created by GAPT on 21/07/25.
//

import SwiftUI

struct TimerView: View {
    // 1 crear la instancia del motor @StateObject
    @StateObject private var timerEngine = TimerEngine()
    
    // Variable de entorno para acceder cerrar vista
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        VStack(spacing: 20) {
            // 2 mostrar propiedad timeLeftString
            Text(timerEngine.timeLeftString)
                .font(.system(size: 60, design: .rounded).monospacedDigit())
                .fontWeight(.bold)
                .foregroundColor(.green)
            
            // 3 adicionar boton -> cancelar cuenta regresiva
            Button("Cancelar") {
                // metodo stop
                timerEngine.stop()
                dismiss() // si se cancela manualmente -> tambien cerrar
            }
            .tint(.red)
        }
        // 4 Accion -> iniciar temporizador
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
