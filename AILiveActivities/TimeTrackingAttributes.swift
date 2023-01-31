//
//  TimeTrackingAttributes.swift
//  AILiveActivities
//
//  Created by Eser Lodhia on 31/01/23.
//

import Foundation
import ActivityKit

struct TimeTrackingAttributes: ActivityAttributes {
    public typealias TimeTrackingStatus = ContentState
    
    public struct ContentState: Codable, Hashable {
        var startTime: Date
    }
}
