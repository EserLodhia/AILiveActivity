//
//  AiLiveWidget.swift
//  AiLiveWidget
//
//  Created by Eser Lodhia on 31/01/23.
//

import WidgetKit
import SwiftUI
import ActivityKit

struct AiLiveWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TimeTrackingAttributes.self) { context in
            TimeTrackingWidgetView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.center) {
                    Text("Abrar")
                        .foregroundColor(.orange)
                        
                }
            } compactLeading: {
                Text("Long press me")
                    .foregroundColor(.orange)
            } compactTrailing: {
                Text("Semusi")
                    .foregroundColor(.orange)
            } minimal: {
                Text("M")
                    .foregroundColor(.orange)
            }

        }

    }
}

struct TimeTrackingWidgetView: View {
    let context: ActivityViewContext<TimeTrackingAttributes>
    
    var body: some View {
        Text("Widget Test Initiated: \(context.state.startTime, style: .timer)")
            .foregroundColor(.black)
            .frame(width: 350, height: 30)
            
            
    }
}
