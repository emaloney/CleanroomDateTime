//
//  DateFieldExtraction.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 5/14/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

import Foundation

/**
 A `Date` extension for accessing components of the date.
*/
public extension Date
{
    /** 
     The `year` component of the date represented by the receiver. 
     */
    public var year: Int {
        return Calendar.current().components(.year, from: self).year!
    }

    /**
     The `month` component of the date represented by the receiver.
     */
    public var month: Int {
        return Calendar.current().components(.month, from: self).month!
    }

    /**
     The `day` (of the month) component of the date represented by the
     receiver.
     */
    public var day: Int {
        return Calendar.current().components(.day, from: self).day!
    }

    /** 
     The `hour` component of the date represented by the receiver.
     */
    public var hour: Int {
        return Calendar.current().components(.hour, from: self).hour!
    }

    /** 
     The `minute` component of the date represented by the receiver.
     */
    public var minute: Int {
        return Calendar.current().components(.minute, from: self).minute!
    }

    /** 
     The `second` component of the date represented by the receiver.
     */
    public var second: Int {
        return Calendar.current().components(.second, from: self).second!
    }

    /** 
     The `nanosecond` component of the date represented by the receiver.
     */
    public var nanosecond: Int {
        return Calendar.current().components(.nanosecond, from: self).nanosecond!
    }

    /**
     The `weekday` component of the date represented by the receiver. This
     is a value between 1 and *n* (inclusive). In the Gregorian calendar, 1
     represents Sunday, while *n* is 7, representing Saturday.
     */
    public var weekday: Int {
        return Calendar.current().components(.weekday, from: self).weekday!
    }

    /** 
     The `weekdayOrdinal` component of the date represented by the receiver.
     This value indicates the current `weekday`'s ordinal position within the
     current `month`. In the Gregorian calendar, a `weekdayOrdinal` unit of 3
     for a `weekday` of 4 represents "the third Wednesday in the month." 
     */
    public var weekdayOrdinal: Int {
        return Calendar.current().components(.weekdayOrdinal, from: self).weekdayOrdinal!
    }

    /** 
     The `weekOfMonth` component of the date represented by the receiver. 
     */
    public var weekOfMonth: Int {
        return Calendar.current().components(.weekOfMonth, from: self).weekOfMonth!
    }

    /** 
     The `weekOfYear` component of the date represented by the receiver.
     */
    public var weekOfYear: Int {
        return Calendar.current().components(.weekOfYear, from: self).weekOfYear!
    }

    /** 
     The `timeZone` component of the date represented by the receiver, or `nil`
     if it could not be determined.
     */
    public var timeZone: TimeZone? {
        return Calendar.current().components(.timeZone, from: self).timeZone
    }
}
