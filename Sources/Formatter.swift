//
//  Formatter.swift
//  CleanroomDateTime
//
//  Created by Nikita Korchagin on 22/09/2017.
//  Copyright © 2017 Gilt Groupe. All rights reserved.
//

import Foundation

/**
 Formatters are expinsive to create. It's important to not unnecessarily create
 and destroy formatters that you're likely to need again. In WWDC 2012 video,
 iOS App Performance: Responsiveness,
 https://developer.apple.com/videos/wwdc/2012/?id=235

 Apple explicitly encourages us to:
     - Cache one formatter per date format;
     - Add observer for NSLocale.currentLocaleDidChangeNotification through the
       NSNotificationCenter, and clearing resetting cached formatters if this occurs;
     - resetting a format is as expensive as recreating, so avoid repeatedly changing
       a formatter's format string.

 Bottom line, reuse date formatters wherever possible if you're using the same date format repeatedly.
 */

extension Date {
    struct Formatter {

        private static let ThreadDictionaryKeyPrefix = "CleanroomDateTimeFormatter-"

        //MARK: Fixed-format dates

        /**
         If using NSDateFormatter to parse date strings to be exchanged with a
         web service (or stored in a database), you should use en_US_POSIX locale
         to avoid problems with international users who might not be using
         Gregorian calendars. See Apple Technical Q&A #1480.
         https://developer.apple.com/library/content/qa/qa1480/_index.html
         */
        private static func fixedDateFormatter(format: String) -> DateFormatter {
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            formatter.dateFormat = format
            return formatter
        }

        static let iso8601Date: DateFormatter = {
            return fixedDateFormatter(format: StandardDateFormat.iso8601Date.rawValue)
        }()

        static let iso8601DateTime: DateFormatter = {
            return fixedDateFormatter(format: StandardDateFormat.iso8601DateTime.rawValue)
        }()

        static let iso8601DateTimeMillis: DateFormatter = {
            return fixedDateFormatter(format: StandardDateFormat.iso8601DateTimeMillis.rawValue)
        }()

        static let rfc1123: DateFormatter = {
            return fixedDateFormatter(format: StandardDateFormat.iso8601DateTimeMillis.rawValue)
        }()

        //MARK: User-visible dates

        /**
         If formatting date strings for the user interface, localize the strings
         by avoiding using string literals dateFormat if possible. Use dateStyle
         and timeStyle where you can. And if you must use custom dateFormat,
         use templates to localize your strings. See Apple Technical Q&A #1480.
         https://developer.apple.com/library/content/qa/qa1480/_index.html
         */

        //TODO: create a collection with reusable common formatters styles, probably in threadDictionary and store them with autoupdating current timezone and autoupdating current locale
    }
}
