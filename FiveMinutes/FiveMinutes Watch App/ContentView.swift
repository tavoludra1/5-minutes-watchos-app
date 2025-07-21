//
//  ContentView.swift
//  FiveMinutes Watch App
//
//  Created by GAPT on 21/07/25.
//

import SwiftUI


// Renombar ContenView a MainView para que sea mas descriptivo
struct MainView: View {
    var body: some View {
        // Contenedor Vertical
        VStack {
            Button {
                // TAREA 3: Logica temporizador
                print("Botón de inicio presionado")
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
    }
}

#Preview {
    MainView()
}
