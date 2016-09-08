//
//  DateManipulation.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 5/14/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

import Foundation

/**
 Extends the Foundation `Date` by adding properties and functions to return new
 dates by manipulating components of existing dates.
 */
public extension Date
{
    /**
     Returns a new `Date` set to the same day as the receiver but with a time
     changed to the specified hour, minute, second and nanosecond.

     - parameter hour: The hour component for the returned time.

     - parameter minute: The minute component for the returned time.

     - parameter second: The second component for the returned time.

     - parameter nanosecond: The nanosecond component for the returned time.

     - returns: The new `Date` with the time changed.
     */
    public func changedTime(hour: Int, minute: Int, second: Int, nanosecond: Int)
        -> Date
    {
        let calendar = Calendar.current
        var dayStart = calendar.dateComponents([.day, .month, .year, .timeZone], from: self)
        dayStart.hour = hour
        dayStart.minute = minute
        dayStart.second = second
        dayStart.nanosecond = nanosecond

        return calendar.date(from: dayStart)!
    }

    /**
     Returns a new `Date` representing the 24-hour time `00:00:00` on the
     same day as the receiver.
     */
    public var startOfDay: Date {
        return changedTime(hour: 0, minute: 0, second: 0, nanosecond: 0)
    }

    /**
     Returns a new `Date` representing the 24-hour time `23:59:59.999999999`
     on the same day as the receiver.
     */
    public var endOfDay: Date {
        return changedTime(hour: 23, minute: 59, second: 59, nanosecond: 999_999_999)
    }

    /**
     Returns a new `Date` representing the current time, but with yesterday's
     date.
     */
    public static var yesterday: Date {
        return Date().dayBefore
    }

    /**
     Returns a new `Date` representing the current time, but with tomorrow's
     date.
     */
    public static var tomorrow: Date {
        return Date().dayAfter
    }

    /**
     Returns a new `Date` containing the same time as the receiver, but with
     the date adjusted earlier or later by the given number of days.

     - parameter days: The number of days to add to (if positive) or subtract
     from (if negative) the receiver.

     - returns: The new `Date` instance.
     */
    public func adjustDay(_ days: Int)
        -> Date
    {
        return Calendar.current.date(byAdding: .day, value: days, to: self, wrappingComponents: true)!
    }

    /**
     Returns a new `Date` containing the same time as the receiver, but one
     day earlier.

     - returns: The new `Date` instance.
     */
    public var dayBefore: Date {
        return adjustDay(-1)
    }

    /**
     Returns a new `Date` containing the same time as the receiver, but one
     day later.

     - returns: The new `Date` instance.
     */
    public var dayAfter: Date {
        return adjustDay(1)
    }
}
