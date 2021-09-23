import 'dart:io';

void main(List<String> arguments) {
  int operationValue;
  int function;
  bool stop = false;
  String? tempInput;
  LBSIMCounter lbsimCounter;

  // take input for incrementValue     String?  !=  String

  print('Please enter user name');
  tempInput = stdin.readLineSync();

  if (tempInput != null && tempInput.isNotEmpty) {
    lbsimCounter = LBSIMCounter(
      userName: tempInput,
      count: 100,
    );
  } else {
    return;
  }

  while (!stop) {
    print('Enter operational value');
    tempInput = stdin.readLineSync();

    if (tempInput != null && tempInput.isNotEmpty) {
      print('tempInput is : $tempInput');
      operationValue = int.parse(tempInput);
    } else {
      operationValue = 0;
    }

    print('''
    Enter your choice
    0. Print value
    1. Increment
    2. Decrement
    3. Multiply 
    4. Divide
    5. Reminder
    6. Change User Name
    10. Stop the operation
  ''');

    tempInput = stdin.readLineSync();

    if (tempInput != null && tempInput.isNotEmpty) {
      function = int.parse(tempInput);
    } else {
      function = -1;
    }

    print('starting counter with value: ${lbsimCounter.count}');

    switch (function) {
      case 0: //print
        print(lbsimCounter.count);
        break;
      case 1:  //increment value
        incrementCounter(counter: lbsimCounter, incrementValue: operationValue);
        break;
      case 2:  //decrement value
        decrementCounter(counter: lbsimCounter, decrementValue: operationValue);
        break;
      case 6: //change username
        changeUserName(counter: lbsimCounter);
        break;
      case 10: //stop operation
        stop = true;
        break;
      case 3: //multiply
        multiply(counter: lbsimCounter, multiplication: operationValue);
        break;
      case 4:  //divide
        divide(counter: lbsimCounter, division: operationValue);
        break;
      default:
        print('Are kuch to kr');
    }
    print(
        'Current value of count is ${lbsimCounter.count} by ${lbsimCounter.userName}');
  }

  print(
      'Final value of count is ${lbsimCounter.count} ${lbsimCounter.userName}');
}

void changeUserName({required LBSIMCounter counter}) {
  String? tempInput = stdin.readLineSync();
  if (tempInput != null && tempInput.isNotEmpty) {
    print('New user is :$tempInput');
    counter.userName = tempInput;
  }
}

void incrementCounter(
    {required LBSIMCounter counter, required int incrementValue}) {
  counter.count = counter.count + incrementValue;
}

void decrementCounter(
    {required LBSIMCounter counter, required int decrementValue}) {
  counter.count = counter.count + decrementValue;
}
void multiply(
    {required LBSIMCounter counter, required int multiplication}){
  counter.count=counter.count * multiplication;
}
void divide(
    {required LBSIMCounter counter, required int division}){
  counter.count=(counter.count / division) as int;
}



class LBSIMCounter {
  int count;
  String userName;

  LBSIMCounter({required this.count, required this.userName});
}
