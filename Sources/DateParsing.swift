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
        return Date.Formatter.rfc1123.date(from: self)
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
        /** Chain of parsers solves the issue when services use different
         date formats with millisonds of even without time */

        if let date = Date.Formatter.iso8601DateTimeMillis.date(from: self) {
            return date
        }
        if let date = Date.Formatter.iso8601DateTime.date(from: self) {
            return date
        }
        if let date = Date.Formatter.iso8601Date.date(from: self) {
            return date
        }
        return nil
    }
}
