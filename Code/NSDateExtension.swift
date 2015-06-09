//
//  NSDateExtension.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 5/14/15.
//  Copyright (c) 2015 Gilt Groupe. All rights reserved.
//

import Foundation

/**
Adds a variety of extension functions to the `NSDate` class.
*/
public extension NSDate
{
    /** The `year` component of the date represented by the receiver. */
    public var year: Int {
        return NSCalendar.currentCalendar().components(.CalendarUnitYear, fromDate: self).year
    }

    /** The `month` component of the date represented by the receiver. */
    public var month: Int {
        return NSCalendar.currentCalendar().components(.CalendarUnitMonth, fromDate: self).month
    }

    /** The `day` (of the month) component of the date represented by the
    receiver. */
    public var day: Int {
        return NSCalendar.currentCalendar().components(.CalendarUnitDay, fromDate: self).day
    }

    /** The `hour` component of the date represented by the receiver. */
    public var hour: Int {
        return NSCalendar.currentCalendar().components(.CalendarUnitHour, fromDate: self).hour
    }

    /** The `minute` component of the date represented by the receiver. */
    public var minute: Int {
        return NSCalendar.currentCalendar().components(.CalendarUnitMinute, fromDate: self).minute
    }

    /** The `second` component of the date represented by the receiver. */
    public var second: Int {
        return NSCalendar.currentCalendar().components(.CalendarUnitSecond, fromDate: self).second
    }

    /** The `nanosecond` component of the date represented by the receiver. */
    public var nanosecond: Int {
        return NSCalendar.currentCalendar().components(.CalendarUnitNanosecond, fromDate: self).nanosecond
    }

    /** The `weekday` component of the date represented by the receiver. This
    is a value between 1 and *n* (inclusive). In the Gregorian calendar, 1 
    represents Sunday, while *n* is 7, representing Saturday. */
    public var weekday: Int {
        return NSCalendar.currentCalendar().components(.CalendarUnitWeekday, fromDate: self).weekday
    }

    /** The `weekdayOrdinal` component of the date represented by the receiver.
    This value indicates the current `weekday`'s ordinal position within the
    current `month`. In the Gregorian calendar, a `weekdayOrdinal` unit of 3
    for a `weekday` of 4 represents "the third Wednesday in the month." */
    public var weekdayOrdinal: Int {
        return NSCalendar.currentCalendar().components(.CalendarUnitWeekdayOrdinal, fromDate: self).weekdayOrdinal
    }

    /** The `weekOfMonth` component of the date represented by the receiver. */
    public var weekOfMonth: Int {
        return NSCalendar.currentCalendar().components(.CalendarUnitWeekOfMonth, fromDate: self).weekOfMonth
    }

    /** The `weekOfYear` component of the date represented by the receiver. */
    public var weekOfYear: Int {
        return NSCalendar.currentCalendar().components(.CalendarUnitWeekOfYear, fromDate: self).weekOfYear
    }

    /** The `timeZone` component of the date represented by the receiver, or
    `nil` if it could not be determined. */
    public var timeZone: NSTimeZone? {
        return NSCalendar.currentCalendar().components(.CalendarUnitTimeZone, fromDate: self).timeZone
    }

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
        let dayStart = calendar.components(.CalendarUnitDay | .CalendarUnitMonth | .CalendarUnitYear | .CalendarUnitTimeZone, fromDate: self)
        dayStart.hour = hour
        dayStart.minute = minute
        dayStart.second = second
        dayStart.nanosecond = nanosecond

        return calendar.dateFromComponents(dayStart)!
    }

    /**
    Returns a new `NSDate` representing the 24-hour time `00:00:00` on the
    same day as the receiver.
    
    :param:     hour The hour component of the time.

    :param:     minute The minute component of the time.

    :param:     second The second component of the time.

    :param:     nanosecond The nanosecond component of the time.
    
    :returns:   The new `NSDate` instance.
    */
    public func startOfDay()
        -> NSDate
    {
        return sameDayWithHour(0, minute: 0, second: 0, nanosecond: 0)
    }

    /**
    Returns a new `NSDate` representing the 24-hour time `23:59:59.999999999`
    on the same day as the receiver.

    :param:     hour The hour component of the time.

    :param:     minute The minute component of the time.

    :param:     second The second component of the time.

    :param:     nanosecond The nanosecond component of the time.

    :returns:   The new `NSDate` instance.
    */
    public func endOfDay()
        -> NSDate
    {
        return sameDayWithHour(23, minute: 59, second: 59, nanosecond: 999_999_999)
    }

    /**
    Returns a new `NSDate` representing the current time, but with yesterday's
    date.

    :returns:   The new `NSDate` instance.
    */
    public class func yesterday()
        -> NSDate
    {
        return NSDate().dayBefore()
    }

    /**
    Returns a new `NSDate` representing the current time, but with tomorrow's
    date.

    :returns:   The new `NSDate` instance.
    */
    public class func tomorrow()
        -> NSDate
    {
        return NSDate().dayAfter()
    }

    /**
    Determines if the receiver represents any time yesterday.

    :returns:   `true` if the receiver represents any time yesterday; `false`
    otherwise.
    */
    public func isYesterday()
        -> Bool
    {
        let yest = NSDate.yesterday()
        return self.isBetween(yest.startOfDay(), and: yest.endOfDay())
    }

    /**
    Determines if the receiver represents any time today.

    :returns:   `true` if the receiver represents any time today; `false`
                otherwise.
    */
    public func isToday()
        -> Bool
    {
        let now = NSDate()
        return self.isBetween(now.startOfDay(), and: now.endOfDay())
    }

    /**
    Determines if the receiver represents any time tomorrow.

    :returns:   `true` if the receiver represents any time tomorrow; `false`
                otherwise.
    */
    public func isTomorrow()
        -> Bool
    {
        let yest = NSDate.tomorrow()
        return self.isBetween(yest.startOfDay(), and: yest.endOfDay())
    }

    /**
    Determines if the receiver represents any time before today.

    :returns:   `true` if the receiver represents any time before today;
                `false` otherwise.
    */
    public func isEarlierThanToday()
        -> Bool
    {
        let startOfToday = NSDate().startOfDay()
        return self.earlierDate(startOfToday) == self
    }

    /**
    Determines if the receiver represents any time after today.

    :returns:   `true` if the receiver represents any time after today;
                `false` otherwise.
    */
    public func isLaterThanToday()
        -> Bool
    {
        let endOfToday = NSDate().endOfDay()
        return self.laterDate(endOfToday) == self
    }

    /**
    Determines if the receiver represents a time between two given times
    or is equal to one of the times.
    
    **Note:** The order of the `time1` and `time2` arguments is not significant;
    they may be swapped without changing the return value of the function.

    :param:     time1 The first `NSDate` value.

    :param:     time2 The second `NSDate` value.

    :returns:   `true` if the receiver represents any time between `time1` and
                `time2` (inclusive); `false` otherwise.
    */
    public func isBetween(time1: NSDate, and time2: NSDate)
        -> Bool
    {
        let earlierDate = time1.earlierDate(time2)
        let laterDate = time1.laterDate(time2)

        return (self.isEqualToDate(earlierDate) || self.earlierDate(earlierDate) == earlierDate)
            && (self.isEqualToDate(laterDate) || self.laterDate(laterDate) == laterDate)
    }

    /**
    Determines if the current time falls between two given times or is equal
    to one of the times.
    
    **Note:** The order of the `time1` and `time2` arguments is not significant;
    they may be swapped without changing the return value of the function.

    :param:     time1 The first `NSDate` value.

    :param:     time2 The second `NSDate` value.

    :returns:   `true` if the current time is between `time1` and `time2`
                (inclusive); `false` otherwise.
    */
    public class func currentTimeIsBetween(time1: NSDate, and time2: NSDate)
        -> Bool
    {
        return NSDate().isBetween(time1, and: time2)
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
        return NSCalendar.currentCalendar().dateByAddingUnit(.CalendarUnitDay, value: days, toDate: self, options: nil)!
    }

    /**
    Returns a new `NSDate` containing the same time as the receiver, but one
    day earlier.

    :returns:   The new `NSDate` instance.
    */
    public func dayBefore()
        -> NSDate
    {
        return adjustDay(-1)
    }

    /**
    Returns a new `NSDate` containing the same time as the receiver, but one
    day later.

    :returns:   The new `NSDate` instance.
    */
    public func dayAfter()
        -> NSDate
    {
        return adjustDay(1)
    }

    /**
    Determines whether the specified `NSDate` represents the same day as the
    receiver.
    
    :param:     date The date to test.

    :returns:   `true` if `date` represents any time on the same day as
                the receiver; `false` otherwise.
    */
    public func isSameDayAs(date: NSDate)
        -> Bool
    {
        return self.isBetween(date.startOfDay(), and: date.endOfDay())
    }
}
