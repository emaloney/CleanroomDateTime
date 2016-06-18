//
//  TimeIntervalComponents.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 10/28/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

import Foundation

/**
 Adds properties to `Date` for accessing various representations of the
 amount of time until the date represented by the receiver.
 */
public extension Date
{
    /**
     The number of whole 7-day periods until the date represented by the
     receiver. If the receiver is in the past, the value will be negative.
     */
    public var weeksUntil: Int {
        return daysUntil / 7
    }

    /**
     The number of whole 24-hour periods until the date represented by the 
     receiver. If the receiver is in the past, the value will be negative.
     */
    public var daysUntil: Int {
        return hoursUntil / 24
    }

    /**
     The number of whole 60-minute periods until the date represented by the
     receiver. If the receiver is in the past, the value will be negative.
     */
    public var hoursUntil: Int {
        return minutesUntil / 60
    }

    /**
     The number of whole 60-second periods until the date represented by the
     receiver. If the receiver is in the past, the value will be negative.
     */
    public var minutesUntil: Int {
        return secondsUntil / 60
    }

    /**
     The number of whole seconds until the date represented by the receiver.
     If the receiver is in the past, the value will be negative.
     */
    public var secondsUntil: Int {
        return Int(timeIntervalSinceNow)
    }
}

/**
 Adds properties to `Date` for accessing various representations of the
 amount of time since the date represented by the receiver.
 */
public extension Date
{
    /**
     The number of whole 7-day periods since the date represented by the
     receiver. If the receiver is in the future, the value will be negative.
     */
    public var weeksSince: Int {
        return daysSince / 7
    }

    /**
     The number of whole 24-hour periods since the date represented by the
     receiver. If the receiver is in the future, the value will be negative.
     */
    public var daysSince: Int {
        return hoursSince / 24
    }

    /**
     The number of whole 60-minute periods since the date represented by the
     receiver. If the receiver is in the future, the value will be negative.
     */
    public var hoursSince: Int {
        return minutesSince / 60
    }

    /**
     The number of whole 60-second periods since the date represented by the
     receiver. If the receiver is in the future, the value will be negative.
     */
    public var minutesSince: Int {
        return secondsSince / 60
    }

    /**
     The number of whole seconds since the date represented by the receiver.
     If the receiver is in the future, the value will be negative.
     */
    public var secondsSince: Int {
        return Int(-timeIntervalSinceNow)
    }
}
