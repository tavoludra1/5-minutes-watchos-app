//
//  TimerEngineTests.swift
//  FiveMinutes Watch AppTests
//
//  Created by GAPT on 22/07/25.
//

import XCTest
@testable import FiveMinutes_Watch_App // Importa nuestro proyecto para poder acceder a su código

final class TimerEngineTests: XCTestCase {

    // Prueba que el estado 'isCompleted' se activa al finalizar el temporizador.
    func testTimerCompletesAndSetsFlag() throws {
        
        // --- Preparación ---
        let timerEngine = TimerEngine()
        
        // La prueba esperará hasta que esta expectativa se cumpla.
        let expectation = self.expectation(description: "El temporizador debe completarse")
        
        var completedFlagWasSet = false

        //  cambios de 'isCompleted'
        let cancellable = timerEngine.$isCompleted.sink { isCompleted in
            if isCompleted {
                completedFlagWasSet = true
                expectation.fulfill() // se ha cumplido.
            }
        }
        
        // --- Acción (Act) ---
        timerEngine.start()
        
        // --- Verificación ---
        // Esperar un máximo de 6 segundos (el temporizador dura 5s).
        waitForExpectations(timeout: 10)
        
        // Verificamos que el flag realmente cambió a true.
        XCTAssertTrue(completedFlagWasSet, "La bandera isCompleted debería ser verdadera al finalizar.")
        
        cancellable.cancel() // Limpiar la suscripción.
    }
}
