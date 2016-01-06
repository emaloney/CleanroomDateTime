//
//  NSDate-Manipulation.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 5/14/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

import Foundation

/**
Extends the `NSDate` class by adding properties and functions to return new
dates by manipulating components of existing dates.
*/
public extension NSDate
{
    /**
    Returns a new `NSDate` set to the same day as the receiver but with a time
    value specified by the given hour, minute, second and nanosecond components.
    
    :param:     hour The hour component of the time.

    :param:     minute The minute component of the time.

    :param:     second The second component of the time.

    :param:     nanosecond The nanosecond component of the time.
    
    :returns:   The new `NSDate` instance.
    */
    public func sameDayWithHour(hour: Int, minute: Int, second: Int, nanosecond: Int)
        -> NSDate
    {
        let calendar = NSCalendar.currentCalendar()
        let dayStart = calendar.components([.Day, .Month, .Year, .TimeZone], fromDate: self)
        dayStart.hour = hour
        dayStart.minute = minute
        dayStart.second = second
        dayStart.nanosecond = nanosecond

        return calendar.dateFromComponents(dayStart)!
    }

    /**
    Returns a new `NSDate` representing the 24-hour time `00:00:00` on the
    same day as the receiver.
    */
    public var startOfDay: NSDate {
        return sameDayWithHour(0, minute: 0, second: 0, nanosecond: 0)
    }

    /**
    Returns a new `NSDate` representing the 24-hour time `23:59:59.999999999`
    on the same day as the receiver.
    */
    public var endOfDay: NSDate {
        return sameDayWithHour(23, minute: 59, second: 59, nanosecond: 999_999_999)
    }

    /**
    Returns a new `NSDate` representing the current time, but with yesterday's
    date.
    */
    public class var yesterday: NSDate {
        return NSDate().dayBefore
    }

    /**
    Returns a new `NSDate` representing the current time, but with tomorrow's
    date.
    */
    public class var tomorrow: NSDate {
        return NSDate().dayAfter
    }

    /**
    Returns a new `NSDate` containing the same time as the receiver, but with
    the date adjusted earlier or later by the given number of days.
    
    :param:     days The number of days to add to (if positive) or subtract 
                from (if negative) the receiver.

    :returns:   The new `NSDate` instance.
    */
    public func adjustDay(days: Int)
        -> NSDate
    {
        return NSCalendar.currentCalendar().dateByAddingUnit(.Day, value: days, toDate: self, options: .WrapComponents)!
    }

    /**
    Returns a new `NSDate` containing the same time as the receiver, but one
    day earlier.

    :returns:   The new `NSDate` instance.
    */
    public var dayBefore: NSDate {
        return adjustDay(-1)
    }

    /**
    Returns a new `NSDate` containing the same time as the receiver, but one
    day later.

    :returns:   The new `NSDate` instance.
    */
    public var dayAfter: NSDate {
        return adjustDay(1)
    }
}
