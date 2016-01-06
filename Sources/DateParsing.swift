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
    public func asDateRFC1123()
        -> NSDate?
    {
        let formatter = NSDateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "en_US")
        formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        formatter.dateFormat = DateFormat.RFC1123.rawValue
        return formatter.dateFromString(self)
    }

    public func asDateISO8601() -> NSDate? {
      let formatter = NSDateFormatter()
      formatter.locale = NSLocale(localeIdentifier: NSLocale.currentLocale().localeIdentifier)
      formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
      formatter.dateFormat = DateFormat.ISO8601.rawValue
      return formatter.dateFromString(self)
    }
}
