//
//  NSTimeInterval-Literals.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 10/28/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

import Foundation

/**
 The `TimeIntervalLiterals` protocol is used to extend `IntegerLiteralType`
 and `FloatLiteralType` to allow for human-readable time notations such as:
 
 ```swift
 let sixtySeconds = 60.seconds
 let twoAndAHalfMinutes = 2.5.minutes
 let oneWeek = 7.days
 let anotherWeek = 1.week
 ```
 
 Default implementations of the `minutes`, `hours`, `days`, and `weeks` 
 properties are supplied; implementors of the `TimeIntervalLiterals`
 protocol only need to supply an implementation for `seconds`.
 */
public protocol TimeIntervalLiterals
{
    /** Returns an `NSTimeInterval` representing the given number of
     seconds. */
    var seconds: NSTimeInterval { get }

    /** Returns an `NSTimeInterval` representing the given number of
     minutes. */
    var minutes: NSTimeInterval { get }

    /** Returns an `NSTimeInterval` representing the given number of
     hours. */
    var hours: NSTimeInterval { get }

    /** Returns an `NSTimeInterval` representing the given number of
     days. */
    var days: NSTimeInterval { get }

    /** Returns an `NSTimeInterval` representing the given number of
     weeks. */
    var weeks: NSTimeInterval { get }
}

extension TimeIntervalLiterals
{
    /** The default implementation of `minutes` returns `seconds * 60`. */
    public var minutes: NSTimeInterval {
        return seconds * 60
    }

    /** The default implementation of `hours` returns `minutes * 60`. */
    public var hours: NSTimeInterval {
        return minutes * 60
    }

    /** The default implementation of `days` returns `hours * 24`. */
    public var days: NSTimeInterval {
        return hours * 24
    }

    /** The default implementation of `weeks` returns `days * 7`. */
    public var weeks: NSTimeInterval {
        return days * 7
    }
}

extension TimeIntervalLiterals
{
    /** An alias for `seconds` designed for correct grammar where single
     units are used, eg. `1.second`. */
    public var second: NSTimeInterval {
        return seconds
    }

    /** An alias for `minutes` designed for correct grammar where single
     units are used, eg. `1.minute`. */
    public var minute: NSTimeInterval {
        return minutes
    }

    /** An alias for `hours` designed for correct grammar where single
     units are used, eg. `1.hour`. */
    public var hour: NSTimeInterval {
        return hours
    }

    /** An alias for `days` designed for correct grammar where single
     units are used, eg. `1.day`. */
    public var day: NSTimeInterval {
        return days
    }

    /** An alias for `weeks` designed for correct grammar where single
     units are used, eg. `1.week`. */
    public var week: NSTimeInterval {
        return weeks
    }
}

extension IntegerLiteralType: TimeIntervalLiterals
{
    /** Extends `IntegerLiteralType` to conform to the `TimeIntervalLiterals` 
     protocol by implementing the `seconds` property. */
    public var seconds: NSTimeInterval {
        return NSTimeInterval(self)
    }
}

extension FloatLiteralType: TimeIntervalLiterals
{
    /** Extends `FloatLiteralType` to conform to the `TimeIntervalLiterals`
     protocol by implementing the `seconds` property. */
    public var seconds: NSTimeInterval {
        return NSTimeInterval(self)
    }
}