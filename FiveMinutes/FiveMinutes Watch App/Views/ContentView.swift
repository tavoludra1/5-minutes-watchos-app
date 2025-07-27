//
//  ContentView.swift
//  FiveMinutes Watch App
//
//  Created by GAPT on 21/07/25.
//

import SwiftUI


// Renombar ContenView a MainView para que sea mas descriptivo
struct MainView: View {
    @State private var isTimerRunning = false
    // CAMBIO: Esta variable de estado ahora controla qué ícono se muestra.
    @State private var iconName = "hourglass.bottomhalf.filled"

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)

                VStack {
                    Spacer()

                    Button(action: {
                        // CAMBIO: Implementamos la nueva lógica de animación interactiva.
                        // 1. Cambia el ícono al ser presionado.
                        self.iconName = "hourglass.tophalf.filled"
                        
                        // 2. Espera un momento para que el cambio sea visible.
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.70) {
                            // 3. Activa la navegación.
                            self.isTimerRunning = true
                        }
                    }) {
                        // El ícono ahora es dinámico, basado en nuestra variable de estado.
                        Image(systemName: iconName)
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80)
                            .background(Color.purple)
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                    }
                    .buttonStyle(PlainButtonStyle())

                    Spacer()

                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape.fill")
                            .font(.title2)
                    }
                    .tint(.white.opacity(0.8))
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.bottom)
            }
            .navigationDestination(isPresented: $isTimerRunning) {
                TimerView()
            }
            //.navigationTitle("5 Minutes")
            .navigationBarTitleDisplayMode(.inline)
            // CAMBIO: Usamos .onAppear para resetear el ícono cada vez que la vista aparece.
            .onAppear {
                self.iconName = "hourglass.bottomhalf.filled"
            }
        }
    }
}
    
    #Preview {
        MainView()
    }
