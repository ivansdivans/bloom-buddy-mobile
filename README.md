# BloomBuddy iOS App

![alt text](https://github.com/ivansdivans/bloom-buddy-mobile/blob/main/BloomBuddyMobile/Assets.xcassets/AppIcon.appiconset/180.png)

"BloomBuddy" is your personal plant assistant. It serves one purpose - help taking care of your house plants.

You can create a household with up to 5 plants. Plants are automatically classified using a built-in Machine Learning (ML) model. App can create tailored care schedule using scientific data about the plants and your household configuration.

Using an intuitive calendar view, you can easily tick off plant care todos and view a plant's care history.

## Credits

This pet project was created by [Daan Brocatus](https://github.com/Inn0) and [Ivans Mihailovs](https://github.com/ivansdivans). Their intention was to practice SwiftUI and try innovative solutions.

While working on this pet project Daan and Ivans learned:
- key SwiftUI features (including view layouts and design, view hierarchy, navigation between views, managing model data, sheets and alerts, environment variables)
- "Create ML" developer tool

Soft skills that Daan and Ivans practiced while working on this pet project include:
- product ownership
- Scrum like setup with reoccuring meetings and kanban board
- self-organised work on tickets
- peer review

All the above mentioned directly benefited client's project where SwiftUI was being introduced for the first time.

## Project status

Currently the project is in an MVP stage which includes following features:
- Creating and configuring your household (including name, sunlight level, air quality, humidity and average temperature)
- Adding up to 5 plants from your phone's gallery
- Automatically clasifying plant using ML model (trained on flowers and plants datasets from [kaggle](https://www.kaggle.com/))
- Editing plant details
- Generating a household's care schedule based on watering frequency of selected plants

All features and ideas for future development are summarised on the [Kanban board](https://github.com/users/ivansdivans/projects/2).

This project has [Wiki](https://github.com/ivansdivans/bloom-buddy-mobile/wiki) with working materials (inlcuding brainstorming session notes, wireframes and requirements). 

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
8. Feature tracking - each feature/bug is registered as an issue in Github and added to project (Kanban board)
9. Feature estimation - issues were estimated using "T-shirt sizing" technique
10. Feature prioritisation - issues are prioritised based on trafic lights system; focus on mvp related features, highest priority & smallest in size are implemented first
