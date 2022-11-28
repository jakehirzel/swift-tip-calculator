//
//  CkPls_WidgetKit_Extension.swift
//  CkPls WidgetKit Extension
//
//  Created by Jake Hirzel on 11/28/22.
//  Copyright © 2022 Jake Hirzel. All rights reserved.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct CkPls_WidgetKit_ExtensionEntryView : View {
    
    var entry: Provider.Entry
    
    var body: some View {
        //        Text(entry.date, style: .time)
        //        Text("Boo!")
        Image("VectorComplication")
            .resizable()
            .scaledToFit()
            .unredacted()
    }
}

@main
struct CkPls_WidgetKit_Extension: Widget {
    let kind: String = "CkPls_WidgetKit_Extension"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            CkPls_WidgetKit_ExtensionEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct CkPls_WidgetKit_Extension_Previews: PreviewProvider {
    static var previews: some View {
        CkPls_WidgetKit_ExtensionEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
    }
}
