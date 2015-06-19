# CleanroomDateTime Breaking Changes

Cleanroom Project frameworks adhere to [the semantic versioning system used by Carthage](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#version-requirement).

This system assigns version numbers with three independent integer values separated by periods:

    major.minor.patch

- When the *major version* is incremented, it reflects large-scale changes to the framework that are likely to introduce public API changes, possibly significant ones.
- An incremented the *minor version* usually signals additional functionality or minor rearchitecting, either of which *may* bring changes to the public API.
- An incremented *patch version* signals bugfixes and/or cleanup, but should **not** signal breaking API changes. (If a breaking change is made to the public API in a patch release, it is unintentional and should be considered a bug.)

## 0.1.0

**This release uses version 2.0 of the Swift language, and therefore requires Xcode 7 or higher.**
