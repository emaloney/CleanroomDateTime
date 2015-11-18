//
//  NSDate-FieldExtraction.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 5/14/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

import Foundation

/**
An `NSDate` extension for accessing components of the date.
*/
public extension NSDate
{
    /** The `year` component of the date represented by the receiver. */
    public var year: Int {
        return NSCalendar.currentCalendar().components(.Year, fromDate: self).year
    }

    /** The `month` component of the date represented by the receiver. */
    public var month: Int {
        return NSCalendar.currentCalendar().components(.Month, fromDate: self).month
    }

    /** The `day` (of the month) component of the date represented by the
    receiver. */
    public var day: Int {
        return NSCalendar.currentCalendar().components(.Day, fromDate: self).day
    }

    /** The `hour` component of the date represented by the receiver. */
    public var hour: Int {
        return NSCalendar.currentCalendar().components(.Hour, fromDate: self).hour
    }

    /** The `minute` component of the date represented by the receiver. */
    public var minute: Int {
        return NSCalendar.currentCalendar().components(.Minute, fromDate: self).minute
    }

    /** The `second` component of the date represented by the receiver. */
    public var second: Int {
        return NSCalendar.currentCalendar().components(.Second, fromDate: self).second
    }

    /** The `nanosecond` component of the date represented by the receiver. */
    public var nanosecond: Int {
        return NSCalendar.currentCalendar().components(.Nanosecond, fromDate: self).nanosecond
    }

    /** The `weekday` component of the date represented by the receiver. This
    is a value between 1 and *n* (inclusive). In the Gregorian calendar, 1 
    represents Sunday, while *n* is 7, representing Saturday. */
    public var weekday: Int {
        return NSCalendar.currentCalendar().components(.Weekday, fromDate: self).weekday
    }

    /** The `weekdayOrdinal` component of the date represented by the receiver.
    This value indicates the current `weekday`'s ordinal position within the
    current `month`. In the Gregorian calendar, a `weekdayOrdinal` unit of 3
    for a `weekday` of 4 represents "the third Wednesday in the month." */
    public var weekdayOrdinal: Int {
        return NSCalendar.currentCalendar().components(.WeekdayOrdinal, fromDate: self).weekdayOrdinal
    }

    /** The `weekOfMonth` component of the date represented by the receiver. */
    public var weekOfMonth: Int {
        return NSCalendar.currentCalendar().components(.WeekOfMonth, fromDate: self).weekOfMonth
    }

    /** The `weekOfYear` component of the date represented by the receiver. */
    public var weekOfYear: Int {
        return NSCalendar.currentCalendar().components(.WeekOfYear, fromDate: self).weekOfYear
    }

    /** The `timeZone` component of the date represented by the receiver, or
    `nil` if it could not be determined. */
    public var timeZone: NSTimeZone? {
        return NSCalendar.currentCalendar().components(.TimeZone, fromDate: self).timeZone
    }
}
