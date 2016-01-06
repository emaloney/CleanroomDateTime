![Gilt Tech logo](https://raw.githubusercontent.com/gilt/Cleanroom/master/Assets/gilt-tech-logo.png)

# CleanroomDateTime

CleanroomDateTime is a Swift framework providing utilities for handling dates and times.

CleanroomDateTime is part of [the Cleanroom Project](https://github.com/gilt/Cleanroom) from [Gilt Tech](http://tech.gilt.com).



### Swift 2.1 compatibility

The `master` branch of this project is **Swift 2.1 compliant** and therefore **requires Xcode 7.1 or higher** to compile.

It is also known to work with Swift 2.1.1 in Xcode 7.2.

### License

CleanroomDateTime is distributed under [the MIT license](/blob/master/LICENSE).

CleanroomDateTime is provided for your use—free-of-charge—on an as-is basis. We make no guarantees, promises or apologies. *Caveat developer.*


### Adding CleanroomDateTime to your project

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

You’ll need to [integrate CleanroomDateTime into your project](https://github.com/emaloney/CleanroomDateTime/blob/master/INTEGRATION.md) in order to use [the API](https://rawgit.com/emaloney/CleanroomDateTime/master/Documentation/API/index.html) it provides. You can choose:

- [Manual integration](https://github.com/emaloney/CleanroomDateTime/blob/master/INTEGRATION.md#manual-integration), wherein you embed CleanroomDateTime’s Xcode project within your own, **_or_**
- [Using the Carthage dependency manager](https://github.com/emaloney/CleanroomDateTime/blob/master/INTEGRATION.md#carthage-integration) to build a framework that you then embed in your application.
 
Once integrated, just add the following `import` statement to any Swift file where you want to use CleanroomDateTime:

```swift
import CleanroomDateTime
```


### API documentation

For detailed information on using CleanroomDateTime, [API documentation](https://rawgit.com/emaloney/CleanroomDateTime/master/Documentation/API/index.html) is available.


## About

The Cleanroom Project began as an experiment to re-imagine Gilt’s iOS codebase in a legacy-free, Swift-based incarnation. 

Since then, we’ve expanded the Cleanroom Project to include multi-platform support. Much of our codebase now supports tvOS in addition to iOS, and our lower-level code is usable on Mac OS X and watchOS as well.

Cleanroom Project code serves as the foundation of Gilt on TV, our tvOS app [featured by Apple during the launch of the new Apple TV](http://www.apple.com/apple-events/september-2015/). And as time goes on, we'll be replacing more and more of our existing Objective-C codebase with Cleanroom implementations.

In the meantime, we’ll be tracking the latest releases of Swift & Xcode, and [open-sourcing major portions of our codebase](https://github.com/gilt/Cleanroom#open-source-by-default) along the way.


### Contributing

CleanroomDateTime is in active development, and we welcome your contributions.

If you’d like to contribute to this or any other Cleanroom Project repo, please read [the contribution guidelines](https://github.com/gilt/Cleanroom#contributing-to-the-cleanroom-project).


### Acknowledgements

[API documentation for CleanroomDateTime](https://rawgit.com/emaloney/CleanroomDateTime/master/Documentation/API/index.html) is generated using [Realm](http://realm.io)’s [jazzy](https://github.com/realm/jazzy/) project, maintained by [JP Simard](https://github.com/jpsim) and [Samuel E. Giddins](https://github.com/segiddins).

