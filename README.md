Simple Calculator App with SwiftUI
==================================
![Simulator Screenshot - iPhone 14 Pro - 2023-07-29 at 00 11 43](https://github.com/apiphoomchu/Calculator/assets/48949523/728bc8ed-3932-4ac2-a28c-a54c45dd1ceb)

This SwiftUI code implements a simple calculator app that allows users to perform basic arithmetic operations. Users can enter numbers and perform addition, subtraction, multiplication, and division operations.

Code Explanation
----------------

The `ContentView` struct is the main view of the app and handles the UI components and logic of the calculator. It includes the following key components:

1.  `@Environment(\.horizontalSizeClass) var horizontalSizeClass`: An environment variable that stores the horizontal size class of the device. This variable is used to adjust the spacing between buttons based on the device's size class.

2.  `@State private var display = ""`: A state variable that stores the current content of the calculator display. It represents the numbers and operators entered by the user.

3.  `@State private var firstNumber = 0.0` and `@State private var secondNumber = 0.0`: State variables to store the first and second numbers for performing arithmetic operations.

4.  `@State private var operation: Operation?`: An optional state variable to keep track of the current arithmetic operation selected by the user.

5.  `enum Operation`: An enumeration representing the four arithmetic operations supported by the calculator: addition, subtraction, multiplication, and division.

6.  `var body: some View`: The body of the `ContentView`, defining the UI elements and their layout. The view consists of a `VStack` containing a text display for the calculator output and a grid of buttons for numbers and operators.

7.  `func buttonLabel(row: Int, column: Int) -> String`: A helper function to determine the label (text) of each button in the grid based on its row and column position.

8.  `func buttonPressed(row: Int, column: Int)`: A function to handle button presses. It updates the display and performs appropriate actions based on the pressed button.

9.  `func addNumberToDisplay(number: Int)`: A function to add numbers to the display when the user enters digits. It handles the concatenation of digits to form the first and second numbers.

10. `func clearDisplay()`: A function to clear the display and reset the calculator to its initial state.

11. `func calculateResult()`: A function to perform the arithmetic operation based on the selected operator and update the display with the result.

12. `func updateDisplay()`: A function to update the display based on the current state of the calculator. It converts the number values to a formatted string for display.

Preview
-------

The `ContentView` displays a simple calculator UI with buttons for numbers (1 to 9), operators (+, -, *, /), a clear button (C), an equals button (=), and a zero button (0). Users can interact with the buttons to enter numbers and perform basic arithmetic calculations.

Feel free to explore and modify the code to enhance the functionality and design of the calculator app!

License
-------

This project is licensed under the MIT License - see the [LICENSE](https://github.com/apiphoomchu/Calculator/blob/main/LICENSE) file for details.

Acknowledgments
---------------

Special thanks to SwiftUI and Apple for providing the framework and tools to build this Simple Calculator app.
