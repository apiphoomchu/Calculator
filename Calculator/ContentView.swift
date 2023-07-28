import SwiftUI

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State private var display = ""
    @State private var firstNumber = 0.0
    @State private var secondNumber = 0.0
    @State private var operation: Operation?

    enum Operation {
        case addition, subtraction, multiplication, division
    }

    var body: some View {
        VStack(spacing: 10) {
            Text(display)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()

            ForEach(0..<4) { row in
                HStack(spacing: horizontalSizeClass == .compact ? 5 : 10) {
                    ForEach(0..<4) { column in
                        Button(action: {
                            buttonPressed(row: row, column: column)
                        }) {
                            Text(buttonLabel(row: row, column: column))
                                .font(.title)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
        .padding()
    }

    func buttonLabel(row: Int, column: Int) -> String {
        switch (row, column) {
        case (3, 0): return "0"
        case (3, 1): return "C"
        case (3, 2): return "="
        case (3, 3): return "÷"
        case (_, 3): return ["+", "−", "×", "÷"][row]
        default: return "\(row * 3 + column + 1)"
        }
    }

    func buttonPressed(row: Int, column: Int) {
        switch (row, column) {
        case (3, 0):
            // 0
            addNumberToDisplay(number: 0)
        case (3, 1):
            // Clear
            clearDisplay()
        case (3, 2):
            // =
            calculateResult()
        case (3, 3):
            // ÷
            operation = .division
        case (_, 3):
            // Operator
            operation = [Operation.addition, .subtraction, .multiplication, .division][row]
        default:
            // Number
            addNumberToDisplay(number: row * 3 + column + 1)
        }
    }

    func addNumberToDisplay(number: Int) {
        if operation != nil {
            secondNumber = secondNumber * 10 + Double(number)
        } else {
            firstNumber = firstNumber * 10 + Double(number)
        }
        updateDisplay()
    }

    func clearDisplay() {
        firstNumber = 0
        secondNumber = 0
        operation = nil
        updateDisplay()
    }

    func calculateResult() {
        if let operation = operation {
            switch operation {
            case .addition: firstNumber += secondNumber
            case .subtraction: firstNumber -= secondNumber
            case .multiplication: firstNumber *= secondNumber
            case .division: firstNumber /= secondNumber
            }
            self.operation = nil
            secondNumber = 0
            updateDisplay()
        }
    }

    func updateDisplay() {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 6
        display = formatter.string(from: NSNumber(value: operation != nil ? secondNumber : firstNumber)) ?? ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
