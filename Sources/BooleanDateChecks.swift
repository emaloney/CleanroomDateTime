//
//  BooleanDateChecks.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 5/14/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

import Foundation

/**
 An extension to perform various boolean checks on `Date` instances.
 */
public extension Date
{
    /**
     `true` if the receiver represents a time in the past; `false` otherwise.
     */
    public var isPast: Bool {
        return timeIntervalSinceNow < 0
    }

    /**
     `true` if the receiver represents the current time; `false` otherwise.
     */
    public var isNow: Bool {
        return timeIntervalSinceNow == 0
    }

    /**
     `true` if the receiver represents a time in the future; `false` otherwise.
     */
    public var isFuture: Bool {
        return timeIntervalSinceNow > 0
    }

    /**
     `true` if the receiver represents any time yesterday; `false` otherwise.
     */
    public var isYesterday: Bool {
        let yest = Date.yesterday
        return isBetween(yest.startOfDay, and: yest.endOfDay)
    }

    /**
     `true` if the receiver represents any time today; `false` otherwise.
     */
    public var isToday: Bool {
        let now = Date()
        return isBetween(now.startOfDay, and: now.endOfDay)
    }

    /**
     `true` if the receiver represents any time tomorrow; `false` otherwise.
     */
    public var isTomorrow: Bool {
        let yest = Date.tomorrow
        return isBetween(yest.startOfDay, and: yest.endOfDay)
    }

    /**
     `true` if the receiver represents any time before today; `false` otherwise.
     */
    public var isBeforeToday: Bool {
        return self < Date().startOfDay
    }

    /**
     `true` if the receiver represents any time after today; `false` otherwise.
     */
    public var isAfterToday: Bool {
        return self > Date().endOfDay
    }

    /**
     Determines if the receiver represents a time between two given times
     or is equal to one of the times.

     **Note:** The order of the `time1` and `time2` arguments is not 
     significant; they may be swapped without changing the return value of
     the function.

     - parameter time1: The first `Date` value.

     - parameter time2: The second `Date` value.

     - returns: `true` if the receiver represents any time between `time1` and
     `time2` (inclusive); `false` otherwise.
     */
    public func isBetween(_ time1: Date, and time2: Date)
        -> Bool
    {
        let earlierTime = time1 < time2 ? time1 : time2
        let laterTime = time1 > time2 ? time1 : time2

        return (self >= earlierTime) && (self <= laterTime)
    }

    /**
     Determines if the current time falls between two given times or is equal
     to one of the times.

     **Note:** The order of the `time1` and `time2` arguments is not
     significant; they may be swapped without changing the return value of
     the function.

     - parameter time1: The first `Date` value.

     - parameter time2: The second `Date` value.

     - returns: `true` if the current time is between `time1` and `time2`
     (inclusive); `false` otherwise.
     */
    public static func currentTimeIsBetween(_ time1: Date, and time2: Date)
        -> Bool
    {
        return Date().isBetween(time1, and: time2)
    }

    /**
     Determines whether the specified `Date` represents the same day as the
     receiver.

     - parameter date: The date to test.

     - returns: `true` if `date` represents any time on the same day as the
     receiver; `false` otherwise.
     */
    public func isSameDayAs(_ date: Date)
        -> Bool
    {
        return isBetween(date.startOfDay, and: date.endOfDay)
    }
}
