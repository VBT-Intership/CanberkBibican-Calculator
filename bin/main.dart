import 'dart:io';
import 'Math.dart';

void main() {
  calculator();
}

//enter numbers and operator
void calculator() {
  String firstNum, secondNum, operation;

  //enter first number
  stderr.write("Enter the first number :");
  firstNum = stdin.readLineSync();
  while (!isNumeric(firstNum)) {
    // check of number
    stderr.write("Please enter numeric, try again enter first number : ");
    firstNum = stdin.readLineSync();
  }
  //enter operators
  stderr.write("Choose one of the operators < + , - , * , / > : ");
  operation = stdin.readLineSync();
  while (optionOperation(operation)) {
    // check of operation
    stderr.write(
        "Please enter options operators, try again choose one of the operators < + , - , * , / > : ");
    operation = stdin.readLineSync();
  }
  //enter second number
  stderr.write("Enter the second number :");
  secondNum = stdin.readLineSync();
  while (!isNumeric(secondNum)) {
    // check of number
    stderr.write("Please enter numeric, try again enter second number : ");
    secondNum = stdin.readLineSync();
  }
  result(double.parse(firstNum), double.parse(secondNum), operation);
}

//number check func
bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.parse(s, (e) => null) !=
      null; //if string can parse -> not null and return true,if string can't be parse -> null and return false
}

//operator check func
bool optionOperation(String s) {
  if (s == '+' || s == '-' || s == '*' || s == '/') {
    return false;
  } else {
    return true;
  }
}

//return result func
void result(double firstNum, double secondNum, String operation) {
  Math math = new Math(firstNum, secondNum); //create math object
  switch (operation) {
    case "+":
      {
        print("Result :" +
            math.addition().round().toString()); // return addition operation
      }
      break;

    case "-":
      {
        print("Result :" +
            math
                .subtraction()
                .round()
                .toString()); // return subtraction operation
      }
      break;
    case "*":
      {
        print("Result :" +
            math
                .multiplication()
                .round()
                .toString()); // return multiplication operation
      }
      break;
    case "/":
      {
        print("Result :" +
            math.division().toString()); // return division operation
      }
      break;
    default:
      {
        print(math.err()); //return error
      }
      break;
  }
}
