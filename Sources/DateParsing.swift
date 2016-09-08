//
//  DateParsing.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 7/22/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

import Foundation

/**
 An extension for parsing standard `Date` formats from strings.
*/
extension String
{
    /**
     Extends `String` to provide a function for parsing the receiver
     as an [RFC 1123](https://www.ietf.org/rfc/rfc1123.txt) date.
     
     - returns: A `Date` parsed from the receiver, or `nil` if the
     receiver did not contain a date string in the expected format.
     */
    public func asDateRFC1123()
        -> Date?
    {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = StandardDateFormat.rfc1123.rawValue
        return formatter.date(from: self)
    }

    /**
     Extends `String` to provide a function for parsing the receiver
     as an [ISO 8601](http://www.w3.org/TR/NOTE-datetime) date.

     - returns: A `Date` parsed from the receiver, or `nil` if the
     receiver did not contain a date string in the expected format.
     */
    public func asDateISO8601()
        -> Date?
    {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: Locale.current.identifier)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = StandardDateFormat.iso8601.rawValue
        return formatter.date(from: self)
    }
}
