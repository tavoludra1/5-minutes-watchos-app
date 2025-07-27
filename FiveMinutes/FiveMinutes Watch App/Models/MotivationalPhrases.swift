//
//  MotivationalPhrases.swift
//  FiveMinutes Watch App
//
//  Created by GAPT on 21/07/25.
//

import Foundation
import SwiftUI // Necesario para leer @AppStorage

struct Phrase {
    let text: String
    let author: String?
}

struct MotivationalPhrases {
    
    // Leemos la categoría seleccionada por el usuario.
    @AppStorage("phraseCategory") static var selectedCategory = "General"
    
    // Listas de frases por categoría
    static let general = [
        Phrase(text: "Un pequeño paso es un gran progreso.", author: nil),
        Phrase(text: "Tu descanso es tu poder.", author: nil),
        Phrase(text: "Respira hondo, lo estás haciendo bien.", author: nil),
        Phrase(text: "Cinco minutos para ti.", author: nil)
    ]
    
    static let catholic = [
        Phrase(text: "Todo lo puedo en Cristo que me fortalece.", author: "Filipenses 4:13"),
        Phrase(text: "El Señor es mi pastor, nada me falta.", author: "Salmo 23:1"),
        Phrase(text: "Encomienda al Señor tus obras, y tus pensamientos serán afirmados.", author: "Proverbios 16:3")
    ]
    
    static let zen = [
        Phrase(text: "La paz viene de dentro. No la busques fuera.", author: "Buda"),
        Phrase(text: "El único momento real es el ahora.", author: "Thich Nhat Hanh"),
        Phrase(text: "Camina como si estuvieras besando la tierra con tus pies.", author: "Thich Nhat Hanh")
    ]
    
    static let laoTzu = [
        Phrase(text: "Un viaje de mil millas comienza con un solo paso.", author: "Laozi"),
        Phrase(text: "La naturaleza no se apresura, y sin embargo todo se realiza.", author: "Laozi"),
        Phrase(text: "El que conoce a los demás es sabio; el que se conoce a sí mismo está iluminado.", author: "Laozi")
    ]
    
    // Función que devuelve una frase aleatoria de la categoría seleccionada.
    static func getRandom() -> Phrase {
        let list: [Phrase]
        switch selectedCategory {
        case "Católica":
            list = catholic
        case "Zen":
            list = zen
        case "Laozi":
            list = laoTzu
        default:
            list = general
        }
        
        return list.randomElement() ?? Phrase(text: "¡Vamos!", author: nil)
    }
}
