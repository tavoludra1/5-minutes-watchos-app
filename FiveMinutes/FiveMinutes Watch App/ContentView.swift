//
//  ContentView.swift
//  FiveMinutes Watch App
//
//  Created by GAPT on 21/07/25.
//

import SwiftUI


// Renombar ContenView a MainView para que sea mas descriptivo
struct MainView: View {
    // 1. Agregar la variable para guardar el estado actual
    // @State observar la variable
    @State private var isTimerRunning: Bool = false
    
    
    var body: some View {
       // envolver vista
        NavigationStack {
            // Contenedor Vertical
            VStack {
                Button {
                    // accion del boton - variable estado
                    self.isTimerRunning = true
                    //print("Estado de isTimerRunning a cambiado a: \(self.isTimerRunning)")
                } label: {
                    Image(systemName: "play.fill")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.black)
                        .frame(width: 80, height: 80)
                        .background(Color.green)
                        .clipShape(Circle())
                }
                .buttonStyle(PlainButtonStyle()) // Mi estilo para watchOS.
                
            }
            // agregar modificador
            .navigationDestination(isPresented: $isTimerRunning) {
                TimerView()
            }
        }
    }
}

#Preview {
    MainView()
}
