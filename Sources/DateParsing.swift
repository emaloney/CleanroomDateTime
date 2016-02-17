//
//  DateParsing.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 7/22/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

import Foundation

extension String
{
    /**
     Extends `String` to provide a function for parsing the receiver
     as an [RFC 1123](https://www.ietf.org/rfc/rfc1123.txt) date.
     
     - returns: An `NSDate` parsed from the receiver, or `nil` if the
     receiver did not contain a date string in the expected format.
     */
    public func asDateRFC1123()
        -> NSDate?
    {
        let formatter = NSDateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "en_US")
        formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        formatter.dateFormat = DateFormat.RFC1123.rawValue
        return formatter.dateFromString(self)
    }

    /**
     Extends `String` to provide a function for parsing the receiver
     as an [ISO 8601](http://www.w3.org/TR/NOTE-datetime) date.

     - returns: An `NSDate` parsed from the receiver, or `nil` if the
     receiver did not contain a date string in the expected format.
     */
    public func asDateISO8601()
        -> NSDate?
    {
        let formatter = NSDateFormatter()
        formatter.locale = NSLocale(localeIdentifier: NSLocale.currentLocale().localeIdentifier)
        formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        formatter.dateFormat = DateFormat.ISO8601.rawValue
        return formatter.dateFromString(self)
    }
}
