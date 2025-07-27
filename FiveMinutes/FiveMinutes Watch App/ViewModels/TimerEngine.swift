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
    
    @Published var timeLeftString: String = "05:00"
    @Published var isCompleted: Bool = false
    @Published var showPhrase: Bool = false
    
    private var timer: AnyCancellable?
    
    // 'totalSeconds' se lee desde la configuración guardada por el usuario.
    private var totalSeconds: Int
    private var secondsLeft: Int
    
    init() {
        // Leemos la duración guardada desde UserDefaults.
        // Usamos la misma clave "timerDuration" que en @AppStorage.
        let savedDuration = UserDefaults.standard.integer(forKey: "timerDuration")
        
        // Si no hay nada guardado (devuelve 0), usamos 300 segundos (5 min) por defecto.
        let initialDuration = savedDuration > 0 ? savedDuration : 300
        
        self.totalSeconds = initialDuration
        self.secondsLeft = initialDuration
        
        // Actualizamos el texto inicial para que refleje la duración correcta.
        updateTimeLeftString()
    }
    
    func start(phraseDisplayDuration: TimeInterval) {
        isCompleted = false
        showPhrase = true
        
        // Usa la duración calculada dinámicamente.
        DispatchQueue.main.asyncAfter(deadline: .now() + phraseDisplayDuration) {
            if self.showPhrase {
                self.showPhrase = false
                self.startCountdown()
            }
        }
    }
    
    private func startCountdown() {
        // Actualizamos totalSeconds cada vez que inicia el contador, por si el usuario lo cambió en Ajustes.
        let savedDuration = UserDefaults.standard.integer(forKey: "timerDuration")
        self.totalSeconds = savedDuration > 0 ? savedDuration : 300
        secondsLeft = totalSeconds
        updateTimeLeftString()
        
        // Creamos el temporizador que se ejecuta cada segundo.
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                // Si queda tiempo, restamos un segundo.
                if self.secondsLeft > 0 {
                    self.secondsLeft -= 1
                    self.updateTimeLeftString()
                }
                
                // Si el tiempo llega a cero, finalizamos.
                if self.secondsLeft <= 0 {
                    self.finishTimer()
                }
            }
    }
    
    private func finishTimer() {
        self.stop() // Detenemos el temporizador interno.
        
        // Solicitamos permiso y guardamos la sesión en HealthKit.
        HealthKitManager.shared.requestAuthorization { success in
            if success {
                HealthKitManager.shared.saveMindfulSession(durationInSeconds: TimeInterval(self.totalSeconds)) { saved in
                    // Una vez completado el guardado, notificamos a la vista para que se cierre.
                    DispatchQueue.main.async {
                        self.isCompleted = true
                    }
                    print(saved ? "Sesión de Mindfulness guardada." : "Fallo al guardar la sesión.")
                }
            } else {
                // Si no hay permiso, simplemente completamos el ciclo.
                DispatchQueue.main.async {
                    self.isCompleted = true
                }
                print("Autorización de HealthKit denegada.")
            }
        }
        
        // Activamos la vibración háptica inmediatamente.
        WKInterfaceDevice.current().play(.success)
    }
    
    func stop() {
        // Cancelamos y liberamos el temporizador para evitar que siga corriendo en segundo plano.
        timer?.cancel()
        timer = nil
        showPhrase = false // Nos aseguramos de resetear el estado al detener.
    }
    
    private func updateTimeLeftString() {
        let minutes = secondsLeft / 60
        let seconds = secondsLeft % 60
        self.timeLeftString = String(format: "%02d:%02d", minutes, seconds)
    }
}
