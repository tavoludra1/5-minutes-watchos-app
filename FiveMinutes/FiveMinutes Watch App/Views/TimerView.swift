//
//  TimerView.swift
//  FiveMinutes Watch App
//
//  Created by GAPT on 21/07/25.
//

import SwiftUI

import SwiftUI

struct TimerView: View {
    @StateObject private var timerEngine = TimerEngine()
    @Environment(\.dismiss) private var dismiss
    
    // CAMBIO: Guardamos la frase seleccionada en el estado de la vista.
    @State private var selectedPhrase: Phrase = MotivationalPhrases.getRandom()
    
    var body: some View {
        ZStack {
            /// Mantenemos la consistencia visual con un gradiente.
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                if timerEngine.showPhrase {
                    //  La vista ahora muestra el texto de la frase y, si existe, su autor.
                    VStack {
                        Text(selectedPhrase.text)
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        // Si la frase tiene un autor, lo mostramos.
                        if let author = selectedPhrase.author {
                            Text("- \(author)")
                                .font(.footnote)
                                .italic()
                                .padding(.top, 4)
                        }
                    }
                } else {
                    Text(timerEngine.timeLeftString)
                    // Usamos la fuente redondeada de Apple, ideal para números.
                        .font(.system(size: 60, design: .rounded).monospacedDigit())
                        .fontWeight(.bold)
                        .foregroundColor(.white) // Color blanco para contraste.
                    
                    Button("Cancelar") {
                        timerEngine.stop()
                        dismiss()
                    }
                    .tint(.red)
                }
            }
            .foregroundColor(.white) // El color por defecto del texto será blanco.
        }
        .onAppear {
            // Al aparecer la vista, obtenemos una nueva frase aleatoria según la categoría guardada.
            self.selectedPhrase = MotivationalPhrases.getRandom()
            let phraseDuration = calculatePhraseDisplayTime(for: selectedPhrase)
            timerEngine.start(phraseDisplayDuration: phraseDuration)
        }
        .onChange(of: timerEngine.isCompleted) {
            if timerEngine.isCompleted {
                dismiss()
            }
        }
        .navigationBarBackButtonHidden(true) // Ocultamos el botón de regreso para una experiencia más inmersiva.
    }
    private func calculatePhraseDisplayTime(for phrase: Phrase) -> TimeInterval {
        let characterCount = phrase.text.count
        // Lógica: Base de 1.5 segundos + 0.1 segundos por caracter.
        // Se limita a un mínimo de 3s y un máximo de 6s.
        let readingTime = 1.5 + (Double(characterCount) * 0.1)
        return max(3.0, min(readingTime, 6.0))
    }
}

#Preview {
    TimerView()
}
