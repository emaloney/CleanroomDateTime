//
//  NSTimeInterval-Literals.swift
//  Cleanroom Project
//
//  Created by Evan Maloney on 10/28/15.
//  Copyright © 2015 Gilt Groupe. All rights reserved.
//

import Foundation

public protocol TimeIntervalLiterals
{
    var seconds: NSTimeInterval { get }
    var minutes: NSTimeInterval { get }
    var hours: NSTimeInterval { get }
    var days: NSTimeInterval { get }
    var weeks: NSTimeInterval { get }
}

extension TimeIntervalLiterals
{
    public var minutes: NSTimeInterval {
        return seconds * 60
    }

    public var hours: NSTimeInterval {
        return minutes * 60
    }

    public var days: NSTimeInterval {
        return hours * 24
    }

    public var weeks: NSTimeInterval {
        return days * 7
    }
}

extension TimeIntervalLiterals
{
    public var second: NSTimeInterval {
        return seconds
    }

    public var minute: NSTimeInterval {
        return minutes
    }

    public var hour: NSTimeInterval {
        return hours
    }

    public var day: NSTimeInterval {
        return days
    }

    public var week: NSTimeInterval {
        return weeks
    }
}

extension IntegerLiteralType: TimeIntervalLiterals
{
    public var seconds: NSTimeInterval {
        return NSTimeInterval(self)
    }
}

extension FloatLiteralType: TimeIntervalLiterals
{
    public var seconds: NSTimeInterval {
        return NSTimeInterval(self)
    }
}