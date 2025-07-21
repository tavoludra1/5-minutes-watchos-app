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
       
        Text("Pantalla Principal") // Texto Simple
            .font(.title3)
            .foregroundColor(.gray)
    }
}

#Preview {
    MainView()
}
