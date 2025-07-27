# BetterRest

BetterRest is a SwiftUI iOS application that helps users calculate their ideal bedtime based on desired wake-up time, desired sleep amount, and daily coffee intake. It uses a machine learning model to recommend the optimal time to go to bed for a well-rested day.

## Features

- Select your desired wake-up time using a DatePicker.
- Adjust the number of hours of sleep you want via a Stepper.
- Specify your daily coffee consumption.
- Calculate your recommended bedtime using a CoreML-powered prediction model.
- User-friendly SwiftUI interface with immediate feedback.

## Technologies Used

- SwiftUI (UI framework)
- CoreML (Machine Learning model integration)
- Combine (for state updates)
- Swift (Swift 5.7+)
## How It Works

1. User selects their desired **wake-up time**.
2. Adjusts the **desired sleep duration** (in hours).
3. Inputs their daily **coffee intake**.
4. Taps the **Calculate** button to see the recommended bedtime.
5. The app uses the **SleepCalculator.mlmodel** to process the input and predict the optimal bedtime.

## Running the Project

1. Clone or download the project.
2. Open the `.xcodeproj` or `.xcodeworkspace` in Xcode.
3. Make sure the **target device** is set to a simulator or physical device running iOS 15+.
4. Build and Run (`Cmd + R`).

## Notes

- The machine learning model provided is a simple regression model predicting sleep needs. It may not be medically accurate but serves as an educational tool.
- This project is inspired by Paul Hudson's "Hacking with Swift" 100 Days of SwiftUI curriculum.

## To-Do Improvements

- Add persistent storage for user preferences.
- Integrate HealthKit for more personalized recommendations.
- Dark Mode UI adjustments.
- Add animations and visual enhancements.


