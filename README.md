# Rest^Better

Rest^Better is a SwiftUI iOS application that helps users calculate their ideal bedtime based on desired wake-up time, desired sleep amount, and daily coffee intake. It uses a machine learning model to recommend the optimal time to go to bed for a well-rested day.

## Features

- Select your desired wake-up time using a DatePicker.
- Adjust the number of hours of sleep you want via a Stepper.
- Specify your daily coffee consumption.
- Calculate your recommended bedtime using a CoreML-powered prediction model.
- User-friendly SwiftUI interface with immediate feedback.

 ## Images
<img width="213" height="389" alt="RB1" src="https://github.com/user-attachments/assets/52d10a99-9dba-4828-ba6c-fc8737fca35e" />
<img width="213" height="389" alt="rb2" src="https://github.com/user-attachments/assets/4c0b8901-0f36-455b-aebb-93078e8e454a" />
<img width="213" height="389" alt="rb3" src="https://github.com/user-attachments/assets/501f15fe-29b3-4892-8540-05981904ccbd" />
<img width="213" height="389" alt="rb4" src="https://github.com/user-attachments/assets/b92b441e-9195-4895-938d-4d0a3ba332ba" />


![Uploading rb2.png…]()

## Technologies Used![Uploading rb2.png…]()


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

## License

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or distribute this software, either in source code form or as a compiled binary, for any purpose, commercial or non-commercial, and by any means.

In jurisdictions that recognize copyright laws, the author or authors of this software dedicate any and all copyright interest in the software to the public domain. We make this dedication for the benefit of the public at large and to the detriment of our heirs and successors. We intend this dedication to be an overt act of relinquishment in perpetuity of all present and future rights to this software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Thanks to Image Contribution

Altered from an Original Image by [catalyststuff](https://www.freepik.com/free-vector/cute-koala-sleeping-tree-cartoon-animal-nature-icon-concept-isolated-flat-cartoon-style_11579989.htm) on Freepik

