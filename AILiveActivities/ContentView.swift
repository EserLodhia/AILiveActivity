//
//  ContentView.swift
//  AILiveActivities
//
//  Created by Eser Lodhia on 31/01/23.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    @State private var isTrackingTime: Bool = false
    @State private var startTime: Date? = nil
    @State private var activity: Activity<TimeTrackingAttributes>? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                if let startTime {
                    Text(startTime, style: .relative)
                }
                
                Button {
                    isTrackingTime.toggle()
                    
                    if isTrackingTime {
                        startTime = .now
                        
                        let attributes = TimeTrackingAttributes ()
                        let state = TimeTrackingAttributes.ContentState(startTime:.now)
                        
                        activity = try? Activity<TimeTrackingAttributes>.request(attributes: attributes, contentState:
                        state, pushType: nil)
                        
                    } else {
                        guard let startTime else { return }
                        let state = TimeTrackingAttributes.ContentState(startTime: startTime)
                        Task {
                            await activity?.end(using: state, dismissalPolicy: .immediate)
                        }
                        
                        self.startTime = nil
                    }
                } label: {
                    Text(isTrackingTime ? "STOP" : "START")
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 200)
                        .background(Circle().fill(isTrackingTime ? .red : .green))
                }
                .navigationTitle("AILiveActivitiesApp")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
