//
//  FiveMinutesComplication.swift
//  FiveMinutesComplication
//
//  Created by GAPT on 23/07/25.
//

import WidgetKit
import SwiftUI

// Define la vista de nuestra complicación
struct ComplicationView: View {
    var body: some View {
        Image(systemName: "play.circle.fill")
            .font(.title)
            .foregroundColor(.green)
        // URL app interactiva
            .widgetURL(URL(string: "fiveminutes://start"))
    }
}

// Define el widget principal de la complicación
@main
struct FiveMinutesComplication: Widget {
    let kind: String = "FiveMinutesComplication"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            ComplicationView()
        }
        .configurationDisplayName("5 Minutes")
        .description("Inicia un descanso rápido.")
        .supportedFamilies([
            .accessoryCircular // Esta es la familia correcta para una complicación circular pequeña
        ])
    }
}

// Define la lógica para actualizar la complicación (por ahora, muy simple)
struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let timeline = Timeline(entries: [SimpleEntry(date: Date())], policy: .atEnd)
        completion(timeline)
    }
}

// Define una entrada de datos para la línea de tiempo
struct SimpleEntry: TimelineEntry {
    let date: Date
}


#Preview(as: .accessoryRectangular) {
    FiveMinutesComplication()
} timeline: {
    SimpleEntry(date: .now)
}
