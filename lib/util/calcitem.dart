class CalcItem {
  double? firstNum;
  String? operand;
  double? secondNum;

  CalcItem({this.firstNum, this.operand, this.secondNum});

  double? getFirstNum() {
    return firstNum;
  }

  String? getOperand() {
    return operand;
  }

  double? getSecondNum() {
    return secondNum;
  }

  setFirstNum(double? firstNum) {
    this.firstNum = firstNum;
  }

  setSecondNum(double? secondNum) {
    this.secondNum = secondNum;
  }

  setOperand(String? operand) {
    this.operand = operand;
  }
}
