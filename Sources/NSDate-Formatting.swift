//
//  NSDate-Formatting.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 8/14/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

import Foundation

extension NSDate
{
    /**
     Formats the receiver as a date string using the specified
     `NSDateFormatterStyle`.

     - parameter style: The `NSDateFormatterStyle` that specifies the format 
     of the string to be returned.

     - parameter timeZone: The `NSTimeZone` associated with the date being
     formatted. If `nil`, the time zone will not be taken into account.

     - returns: The string representation of the receiver's date.
     */
    public func formatDateWithStyle(style: NSDateFormatterStyle, timeZone: NSTimeZone? = nil)
        -> String
    {
        let fmt = NSDateFormatter()
        if let tz = timeZone {
            fmt.timeZone = tz
        }
        fmt.dateStyle = style
        fmt.timeStyle = .NoStyle
        return fmt.stringFromDate(self)
    }

    /**
     Formats the receiver as a time string using the specified
     `NSDateFormatterStyle`.

     - parameter style: The `NSDateFormatterStyle` that specifies the format
     of the string to be returned.

     - parameter timeZone: The `NSTimeZone` associated with the time being
     formatted. If `nil`, the time zone will not be taken into account.

     - returns: The string representation of the receiver's time.
     */
    public func formatTimeWithStyle(style: NSDateFormatterStyle, timeZone: NSTimeZone? = nil)
        -> String
    {
        let fmt = NSDateFormatter()
        if let tz = timeZone {
            fmt.timeZone = tz
        }
        fmt.dateStyle = .NoStyle
        fmt.timeStyle = style
        return fmt.stringFromDate(self)
    }

    /**
     Formats the receiver as a date/time string using the specified
     `NSDateFormatterStyle`.

     - parameter style: The `NSDateFormatterStyle` that specifies the format
     of the string to be returned.

     - parameter timeZone: The `NSTimeZone` associated with the date and time
     being formatted. If `nil`, the time zone will not be taken into account.

     - returns: The string representation of the receiver's date and time.
     */
    public func formatDateTimeWithStyle(style: NSDateFormatterStyle, timeZone: NSTimeZone? = nil)
        -> String
    {
        let fmt = NSDateFormatter()
        if let tz = timeZone {
            fmt.timeZone = tz
        }
        fmt.dateStyle = style
        fmt.timeStyle = style
        return fmt.stringFromDate(self)
    }

    /**
     Formats the receiver as a date string in the UTC time zone using the
     specified `NSDateFormatterStyle`.

     - parameter style: The `NSDateFormatterStyle` that specifies the format
     of the string to be returned.

     - returns: The string representation of the receiver's date.
     */
    public func formatUTCDateWithStyle(style: NSDateFormatterStyle)
        -> String
    {
        return formatDateWithStyle(style, timeZone: NSTimeZone(abbreviation: "UTC")!)
    }

    /**
     Formats the receiver as a time string in the UTC time zone using the
     specified `NSDateFormatterStyle`.

     - parameter style: The `NSDateFormatterStyle` that specifies the format
     of the string to be returned.

     - returns: The string representation of the receiver's time.
     */
    public func formatUTCTimeWithStyle(style: NSDateFormatterStyle)
        -> String
    {
        return formatTimeWithStyle(style, timeZone: NSTimeZone(abbreviation: "UTC")!)
    }

    /**
     Formats the receiver as a date/time string in the UTC time zone using the
     specified `NSDateFormatterStyle`.

     - parameter style: The `NSDateFormatterStyle` that specifies the format
     of the string to be returned.

     - returns: The string representation of the receiver's date and time.
     */
    public func formatUTCDateTimeWithStyle(style: NSDateFormatterStyle)
        -> String
    {
        return formatDateTimeWithStyle(style, timeZone: NSTimeZone(abbreviation: "UTC")!)
    }

    /**
     Formats the receiver as a date/time string using the specified
     `DateFormat` value.

     - parameter format: A `DateFormat` value specifying the format of the
     string to be returned.

     - parameter timeZone: The `NSTimeZone` associated with the date being
     formatted.

     - returns: The string representation of the receiver's date and time.
     */
    public func asStringWithDateFormat(format: DateFormat, inTimeZone timeZone: NSTimeZone)
        -> String
    {
        let formatter = NSDateFormatter()
        formatter.locale = NSLocale(localeIdentifier: NSLocale.currentLocale().localeIdentifier)
        formatter.timeZone = timeZone
        formatter.dateFormat = format.rawValue
        return formatter.stringFromDate(self)
    }

    /**
     Formats the receiver as a date/time string using the specified
     `DateFormat` value.

     - parameter format: A `DateFormat` value specifying the format of the
     string to be returned.

     - parameter inLocalTime: If `true`, the returned string will represent
     the user's local time; otherwise, UTC time is used.

     - returns: The string representation of the receiver's date and time.
     */
    public func asStringWithDateFormat(format: DateFormat, inLocalTime: Bool = false)
        -> String
    {
        let timeZone: NSTimeZone
        if inLocalTime {
            timeZone = NSTimeZone.localTimeZone()
        } else {
            timeZone = NSTimeZone(forSecondsFromGMT: 0)
        }
        return asStringWithDateFormat(format, inTimeZone: timeZone)
    }

    /**
     Formats the receiver as an [RFC 1123](https://www.ietf.org/rfc/rfc1123.txt)
     date/time string.

     - parameter inLocalTime: If `true`, the returned string will represent
     the user's local time; otherwise, UTC time is used.

     - returns: The string representation of the receiver's date and time.
     */
    public func asRFC1123(inLocalTime: Bool = false)
        -> String
    {
        return asStringWithDateFormat(.RFC1123, inLocalTime: inLocalTime)
    }

    /**
     Formats the receiver as an [ISO 8601](http://www.w3.org/TR/NOTE-datetime)
     date/time string.
     
     - parameter inLocalTime: If `true`, the returned string will represent
     the user's local time; otherwise, UTC time is used.
     
     - returns: The string representation of the receiver's date and time.
     */
    public func asISO8601(inLocalTime: Bool = false)
      -> String
    {
        return asStringWithDateFormat(.ISO8601, inLocalTime: inLocalTime)
    }
}
