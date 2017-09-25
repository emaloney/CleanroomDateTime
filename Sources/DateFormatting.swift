//
//  DateFormatting.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 8/14/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

import Foundation

extension Date
{
    /**
     Formats the receiver as a date string using the specified
     `DateFormatter.Style`.

     - parameter style: The `DateFormatter.Style` that specifies the format 
     of the string to be returned.

     - parameter timeZone: The `TimeZone` associated with the date being
     formatted. If `nil`, the time zone will not be taken into account.

     - returns: The string representation of the receiver's date.
     */
    public func formatDate(style: DateFormatter.Style, timeZone: TimeZone? = nil)
        -> String
    {
        let fmt = DateFormatter()
        if let tz = timeZone {
            fmt.timeZone = tz
        }
        fmt.dateStyle = style
        fmt.timeStyle = .none
        return fmt.string(from: self)
    }

    /**
     Formats the receiver as a time string using the specified
     `DateFormatter.Style`.

     - parameter style: The `DateFormatter.Style` that specifies the format
     of the string to be returned.

     - parameter timeZone: The `TimeZone` associated with the time being
     formatted. If `nil`, the time zone will not be taken into account.

     - returns: The string representation of the receiver's time.
     */
    public func formatTime(style: DateFormatter.Style, timeZone: TimeZone? = nil)
        -> String
    {
        let fmt = DateFormatter()
        if let tz = timeZone {
            fmt.timeZone = tz
        }
        fmt.dateStyle = .none
        fmt.timeStyle = style
        return fmt.string(from: self)
    }

    /**
     Formats the receiver as a date/time string using the specified
     `DateFormatter.Style`.

     - parameter style: The `DateFormatter.Style` that specifies the format
     of the string to be returned.

     - parameter timeZone: The `TimeZone` associated with the date and time
     being formatted. If `nil`, the time zone will not be taken into account.

     - returns: The string representation of the receiver's date and time.
     */
    public func formatDateTime(style: DateFormatter.Style, timeZone: TimeZone? = nil)
        -> String
    {
        let fmt = DateFormatter()
        if let tz = timeZone {
            fmt.timeZone = tz
        }
        fmt.dateStyle = style
        fmt.timeStyle = style
        return fmt.string(from: self)
    }

    /**
     Formats the receiver as a date string in the UTC time zone using the
     specified `DateFormatter.Style`.

     - parameter style: The `DateFormatter.Style` that specifies the format
     of the string to be returned.

     - returns: The string representation of the receiver's date.
     */
    public func formatUTCDate(style: DateFormatter.Style)
        -> String
    {
        return formatDate(style: style, timeZone: TimeZone(abbreviation: "UTC")!)
    }

    /**
     Formats the receiver as a time string in the UTC time zone using the
     specified `DateFormatter.Style`.

     - parameter style: The `DateFormatter.Style` that specifies the format
     of the string to be returned.

     - returns: The string representation of the receiver's time.
     */
    public func formatUTCTime(style: DateFormatter.Style)
        -> String
    {
        return formatTime(style: style, timeZone: TimeZone(abbreviation: "UTC")!)
    }

    /**
     Formats the receiver as a date/time string in the UTC time zone using the
     specified `DateFormatter.Style`.

     - parameter style: The `DateFormatter.Style` that specifies the format
     of the string to be returned.

     - returns: The string representation of the receiver's date and time.
     */
    public func formatUTCDateTime(style: DateFormatter.Style)
        -> String
    {
        return formatDateTime(style: style, timeZone: TimeZone(abbreviation: "UTC")!)
    }

    /**
     Formats the receiver as a date/time string using the specified
     `DateFormat` value.

     - parameter format: A `DateFormat` value specifying the format of the
     string to be returned.

     - parameter timeZone: The `TimeZone` associated with the date being
     formatted.

     - returns: The string representation of the receiver's date and time.
     */
    public func asString(format: StandardDateFormat, timeZone: TimeZone)
        -> String
    {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: Locale.current.identifier)
        formatter.timeZone = timeZone
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
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
    public func asString(format: StandardDateFormat, inLocalTime: Bool = false)
        -> String
    {
        let timeZone: TimeZone
        if inLocalTime {
            timeZone = TimeZone.current
        } else {
            timeZone = TimeZone(secondsFromGMT: 0)!
        }
        return asString(format: format, timeZone: timeZone)
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
        return asString(format: .rfc1123, inLocalTime: inLocalTime)
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
        return asString(format: .iso8601DateTime, inLocalTime: inLocalTime)
    }
}
