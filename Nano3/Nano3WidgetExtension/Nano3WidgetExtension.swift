//
//  Nano3WidgetExtension.swift
//  Nano3WidgetExtension
//
//  Created by Andrew Oroh on 16/07/24.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), availableHourEntry: AvailableHourEntry(icon: "sun.max.fill", day: "Today, July 10th", typographyText: "Best times to play outdoor ", isWalkable: true, walkableIcon: "figure.walk", timeRangeString: "06.00 - 10.00"))
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), availableHourEntry: AvailableHourEntry(icon: "sun.max.fill", day: "Today, July 10th", typographyText: "Best times to play outdoor ", isWalkable: true, walkableIcon: "figure.walk", timeRangeString: "06.00 - 10.00"))
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let availableHourEntry = AvailableHourEntry(icon: "sun.max.fill", day: "Today, July 10th", typographyText: "Best times to play outdoor ", isWalkable: true, walkableIcon: "figure.walk", timeRangeString: "06.00 - 10.00")
            let entry = SimpleEntry(date: entryDate, availableHourEntry: availableHourEntry)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let availableHourEntry: AvailableHourEntry
}

struct AvailableHourEntry {
    let icon: String
    let day: String
    let typographyText: String
    let isWalkable: Bool
    let walkableIcon : String?
    let timeRangeString: String?
}

struct Nano3WidgetExtensionEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .leading,spacing: 3) {
                HStack{
                    Image(systemName: entry.availableHourEntry.icon)
                        .renderingMode(.original)
                        .font(.title)
                    Spacer()
                }
                .padding(.bottom, 3)
                
                HStack{
                    Text(entry.availableHourEntry.day)
                        .font(Font.system(size: 12))
                        .fontWeight(.medium)
                    Spacer()
                }
                
                HStack{
                    Text(entry.availableHourEntry.typographyText)
                        .font(Font.system(size: 20))
                        .fontWeight(.semibold)
                    Spacer()
                }
            
            if let timeRangeString = entry.availableHourEntry.timeRangeString {
                HStack{
                    Image(systemName: entry.availableHourEntry.walkableIcon!)
                        .font(Font.system(size: 23))
                    
                    Text(timeRangeString)
                        .font(Font.system(size: 36))
                        .fontWeight(.bold)
                }
            }
        }
        .padding(.horizontal,31)
        .padding(.vertical, 16)
        .frame(width: 338, height: 158)
        .foregroundStyle(.white)
//            .background(LinearGradient(colors: [Color.backgroundLeft,Color.backgroundRight], startPoint:.leading, endPoint: .trailing))
        
        .background(LinearGradient(colors: entry.availableHourEntry.isWalkable ? [Color.backgroundLeft,Color.backgroundRight] :  [Color.backgroundRainingLeft,Color.backgroundRainingMid,Color.backgroundRainingRight], startPoint:.leading, endPoint: .trailing))
    }
}

struct Nano3WidgetExtension: Widget {
    let kind: String = "Nano3WidgetExtension"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                Nano3WidgetExtensionEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                Nano3WidgetExtensionEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium])
    }
}

#Preview(as: .systemMedium) {
    Nano3WidgetExtension()
} timeline: {
    SimpleEntry(date: .now, availableHourEntry: AvailableHourEntry(icon: "sun.max.fill", day: "Today, July 10th", typographyText: "Best times to play outdoor ", isWalkable: true, walkableIcon: "figure.walk", timeRangeString: "06.00 - 10.00"))
    
    SimpleEntry(date: .now, availableHourEntry: AvailableHourEntry(icon: "cloud.rain.fill", day: "Today, July 10th", typographyText: "It's time for indoor play with your little one", isWalkable: false, walkableIcon: nil, timeRangeString: nil))
}
