//
//  NSDate-BooleanChecks.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 5/14/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

import Foundation

/**
An extension to perform various boolean checks on `NSDate` instances.
*/
public extension NSDate
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
        let yest = NSDate.yesterday
        return isBetween(yest.startOfDay, and: yest.endOfDay)
    }

    /**
    `true` if the receiver represents any time today; `false` otherwise.
    */
    public var isToday: Bool {
        let now = NSDate()
        return isBetween(now.startOfDay, and: now.endOfDay)
    }

    /**
    `true` if the receiver represents any time tomorrow; `false` otherwise.
    */
    public var isTomorrow: Bool {
        let yest = NSDate.tomorrow
        return isBetween(yest.startOfDay, and: yest.endOfDay)
    }

    /**
    `true` if the receiver represents any time before today; `false` otherwise.
    */
    public var isEarlierThanToday: Bool {
        let startOfToday = NSDate().startOfDay
        return earlierDate(startOfToday) == self
    }

    /**
    `true` if the receiver represents any time after today; `false` otherwise.
    */
    public var isLaterThanToday: Bool {
        let endOfToday = NSDate().endOfDay
        return laterDate(endOfToday) == self
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
            && (self.isEqualToDate(laterDate)   || self.laterDate(laterDate) == laterDate)
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
    Determines whether the specified `NSDate` represents the same day as the
    receiver.
    
    :param:     date The date to test.

    :returns:   `true` if `date` represents any time on the same day as
                the receiver; `false` otherwise.
    */
    public func isSameDayAs(date: NSDate)
        -> Bool
    {
        return isBetween(date.startOfDay, and: date.endOfDay)
    }
}
