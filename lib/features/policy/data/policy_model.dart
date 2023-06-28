import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Policy {
  Policy(this.policyNumber, this.startDate, this.endDate, this.policyCoverage,
      this.policyCost);

  String policyNumber;
  DateTime startDate;
  DateTime endDate;
  double policyCoverage;
  double policyCost;
  List<Protection> protections = [];
  List<CashIncome> cashIncomes = [];
}

class Protection {
  Protection(this.name, this.protectionsYears, this.protectionAmount);

  String name;
  List<int> protectionsYears;
  double protectionAmount;
}

class CashIncome {
  CashIncome(this.name, this.cashDueMonths, this.cashAmount);

  String name;
  List<int> cashDueMonths;
  double cashAmount;
}

final newClientFormProvider =
    StateProvider<NewPolicyForms>((ref) => NewPolicyForms());

class NewPolicyForms {
  TextEditingController number = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController startDay = TextEditingController();
  TextEditingController startMonth = TextEditingController();
  TextEditingController startYear = TextEditingController();
  TextEditingController endDay = TextEditingController();
  TextEditingController endMonth = TextEditingController();
  TextEditingController endYear = TextEditingController();
  TextEditingController coverage = TextEditingController();

  // Client toClientObj() {
  //   return Client(
  //     firstName.text,
  //     lastName.text,
  //     nickName.text,
  //     DateTime.utc(int.parse(birthYear.text) - 543, int.parse(birthMonth.text),
  //         int.parse(birthDay.text)),
  //     int.parse(age.text),
  //   );
  // }
}
