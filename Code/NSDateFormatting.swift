//
//  NSDateFormatting.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 8/14/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

import Foundation

extension NSDate
{
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

    public func formatUTCDateWithStyle(style: NSDateFormatterStyle)
        -> String
    {
        return formatDateWithStyle(style, timeZone: NSTimeZone(abbreviation: "UTC")!)
    }

    public func formatUTCTimeWithStyle(style: NSDateFormatterStyle)
        -> String
    {
        return formatTimeWithStyle(style, timeZone: NSTimeZone(abbreviation: "UTC")!)
    }

    public func formatUTCDateTimeWithStyle(style: NSDateFormatterStyle)
        -> String
    {
        return formatDateTimeWithStyle(style, timeZone: NSTimeZone(abbreviation: "UTC")!)
    }

    public func formatDateTimeAsISO8601 ()
      -> String
    {
        let formatter = NSDateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "en_US")
        formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        formatter.dateFormat = DateFormat.ISO8601.rawValue
        return formatter.stringFromDate(self)
    }
}
