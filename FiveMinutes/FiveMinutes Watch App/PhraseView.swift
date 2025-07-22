//
//  PhraseView.swift
//  FiveMinutes Watch App
//
//  Created by GAPT on 21/07/25.
//

import SwiftUI

struct PhraseView: View {
    // Al crear la vista -> frase aleatoria
    let phrase: String = MotivationalPhrases.getRandom()
    
    // Estado para controlar la navegacion
    @State private var navigateToTimerView: Bool = false
    
    
    var body: some View {
        VStack {
            Text(phrase)
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding()
            
            }
        // modificador vista principal
        // navega cuando cambie a true
        .navigationDestination(isPresented: $navigateToTimerView) {
            TimerView()
        }
        // logica para el tiempo de pausa
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.navigateToTimerView = true
            }
        }

    }
}

#Preview {
    PhraseView()
}
