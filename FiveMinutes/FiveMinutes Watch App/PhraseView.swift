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
    
    
    var body: some View {
        Text(phrase)
            .font(.title3)
            .multilineTextAlignment(.center)
            .padding()
    }
}

#Preview {
    PhraseView()
}
