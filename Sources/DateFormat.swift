//
//  DateFormat.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 7/22/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

import Foundation

/**
 Contains strings representing various date/time formats suitable for use
 with `NSDateFormatter`.
 */
public enum DateFormat: String
{
    /** The date format string representing an 
     [RFC 1123](https://www.ietf.org/rfc/rfc1123.txt) date. */
    case RFC1123 = "EEE, dd MMM yyyy HH:mm:ss zzz"

    /** The date format string representing an
     [ISO 8601](http://www.w3.org/TR/NOTE-datetime) date. */
    case ISO8601 = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
}
