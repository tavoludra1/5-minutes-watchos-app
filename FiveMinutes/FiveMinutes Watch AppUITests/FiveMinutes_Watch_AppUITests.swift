//
//  FiveMinutes_Watch_AppUITests.swift
//  FiveMinutes Watch AppUITests
//
//  Created by GAPT on 21/07/25.
//

import XCTest

final class FiveMinutes_Watch_AppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
    
    @MainActor
    func testNavigationToTimerView() throws {
        // 1. Preparamos la aplicación para ser lanzada.
        let app = XCUIApplication()
        app.launch()

        // 2. Buscamos el botón de inicio. Usamos 'buttons.firstMatch' porque solo hay uno.
        let startButton = app.buttons.firstMatch
        XCTAssertTrue(startButton.exists, "El botón de inicio debería existir.")
        
        // 3. Tocamos el botón.
        startButton.tap()
        
        // 4. Verificamos que hemos navegado. Buscamos el texto que aparece en la pantalla
        //    del temporizador (la frase motivacional es lo primero que se ve).
        //    La prueba esperará un poco a que aparezca el elemento.
        let phraseText = app.staticTexts.firstMatch
        XCTAssertTrue(phraseText.waitForExistence(timeout: 3), "Debería navegar y mostrar un texto de frase motivacional.")
    }
}
