//
//  TimerEngine.swift
//  FiveMinutes Watch App
//
//  Created by GAPT on 21/07/25.
//

import Foundation
import Combine // @Published y temporizador
import WatchKit // para el funcionamiento haptico

class TimerEngine: ObservableObject {
    
    // @Published cualquier cambio en esta variable sera notificada a la UI
    @Published var timeLeftString: String = "00:05" // tiempo restante
    
    private var timer: AnyCancellable?
    
    // pruebas rapidas 5 seg
    // 300 segundos son 5 minutos
    private let totalSeconds: Int = 5
    private var secondsLeft: Int = 5
    
    // Iniciar la cuenta regresiva
    func start() {
        // Reiniciar los valores
        secondsLeft = totalSeconds
        updateTimeLeftString()
        
        // configurar el encendido del temporizador
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.secondsLeft -= 1
                self.updateTimeLeftString()
                
                if self.secondsLeft <= 0 {
                    print("¡Temporizador Finalizado!")
                    
                    // ojo este lugar es para el haptic
                    WKInterfaceDevice.current().play(.success)
                    
                    self.stop()
                }
            }
    }
    
    // Detener la cuenta regresiva
    func stop() {
        timer?.cancel()
        print("Temporizador Detenido 🛑")
    }
    
    // funcion para formatear el tiempo -> minutos:segundos
    private func updateTimeLeftString() {
        let minutes = secondsLeft / 60
        let seconds = secondsLeft % 60
        self.timeLeftString = String(format: "%02d:%02d", minutes, seconds)
    }
}
