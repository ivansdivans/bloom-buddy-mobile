# bloom-buddy-mobile

## Technologies used
1. [XCode](https://developer.apple.com/xcode/) - Integrated Development Environment
2. [Swift](https://developer.apple.com/swift/) - Programming Language
3. [SwiftUI](https://developer.apple.com/xcode/swiftui/) - User Interface Framework
4. [CoreML](https://developer.apple.com/documentation/coreml) - Machine Learning Framework

## Collaboration rules
1. Branching strategy - [Trunk-based workflow](https://www.atlassian.com/continuous-delivery/continuous-integration/trunk-based-development); create short-lived branches and regularly integrate them into `main` branch
2. Branch naming convention - `typeOfBranch-issueNumber-descriptiveBranchTitle` (examples: `feature/1-create-basic-navigation-panel`, `release/v0.1`, `bugfix/22-navigation-doesnt-work-in-landscape-mode`)
4. Design patterns - [Model-View-ViewModel](https://learn.microsoft.com/en-us/dotnet/architecture/maui/mvvm)
5. Development conventions - keep `main` ready-to-deploy at all times; use [feature-flags](https://martinfowler.com/articles/feature-toggles.html) for potentially breaking changes
6. Testing strategy - meaningful unit tests for each feature and bugfix
7. Merging policy - mandatory PR, build and unit tests are green, 1 approval; no force pushes

## Credits

This pet project is created by [Daan Brocatus](https://github.com/Inn0) and [Ivans Mihailovs](https://github.com/ivansdivans). Their intention is to practice SwiftUI and try innovative solutions. 
