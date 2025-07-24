//
//  FiveMinutesApp.swift
//  FiveMinutes Watch App
//
//  Created by GAPT on 21/07/25.
//

import SwiftUI

@main
struct FiveMinutesApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                // El modificador se aplica aquí, dentro del WindowGroup
                .onOpenURL { url in
                    if url.scheme == "fiveminutes" && url.host == "start" {
                        print("Complicación tocada: Iniciar temporizador.")
                    }
                }
        }
    }
}
