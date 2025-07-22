//
//  MotivationalPhrases.swift
//  FiveMinutes Watch App
//
//  Created by GAPT on 21/07/25.
//

import Foundation

struct MotivationalPhrases {
    
    // Array estático de frases
    static let list = [
        "Eres increíble tal y como eres.",
        "Un pequeño paso es un gran progreso.",
        "Tu descanso es tu poder.",
        "Respira hondo, lo estás haciendo bien.",
        "Cinco minutos para ti.",
        "La constancia es clave."
    ]
    
    // Funcion de ayuda para la aleatoriedad
    static func getRandom() -> String {
        return list.randomElement() ?? "¡Vamos!"
    }
}
