import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Policy {
  Policy(this.policyNumber, this.policyName, this.policyCompany, this.startDate,
      this.endDate, this.policyCoverage, this.policyCost,
      [this.id, this.clientId]);

  String policyNumber;
  String policyName;
  String policyCompany;
  DateTime startDate;
  DateTime endDate;
  double policyCoverage;
  double policyCost;
  String? id;
  String? clientId;
  List<Map<int, int>> protections = [];
  List<CashBenefits> cashIncomes = [];

  Map<String, dynamic> toCollectionObj() {
    return {
      'policyNumber': policyNumber,
      'policyName': policyName,
      'policyCompany': policyCompany,
      'startDate': startDate,
      'endDate': endDate,
      'policyCoverage': policyCoverage,
      'policyCost': policyCost,
    };
  }
}

class Protection {
  Protection(this.name, this.protectionsYears, this.protectionAmount);

  String name;
  List<int> protectionsYears;
  double protectionAmount;
}

class CashBenefits {
  CashBenefits(this.name, this.cashDueMonths, this.cashAmount);

  String name;
  List<int> cashDueMonths;
  double cashAmount;
}

final newClientFormProvider =
    StateProvider<NewPolicyForms>((ref) => NewPolicyForms());

class NewPolicyForms {
  // TextEditingController number = TextEditingController();
  // TextEditingController name = TextEditingController();
  // TextEditingController company = TextEditingController();
  // TextEditingController startDay = TextEditingController();
  // TextEditingController startMonth = TextEditingController();
  // TextEditingController startYear = TextEditingController();
  // TextEditingController endDay = TextEditingController();
  // TextEditingController endMonth = TextEditingController();
  // TextEditingController endYear = TextEditingController();
  // TextEditingController coverage = TextEditingController();
  // TextEditingController cost = TextEditingController();
  TextEditingController number = TextEditingController(text: 'T12345678');
  TextEditingController name = TextEditingController(text: '90/5 ...');
  TextEditingController company = TextEditingController(text: 'AIA');
  TextEditingController startDay = TextEditingController(text: '01');
  TextEditingController startMonth = TextEditingController(text: '01');
  TextEditingController startYear = TextEditingController(text: '2511');
  TextEditingController endDay = TextEditingController(text: '01');
  TextEditingController endMonth = TextEditingController(text: '01');
  TextEditingController endYear = TextEditingController(text: '2601');
  TextEditingController coverage = TextEditingController(text: '11000000');
  TextEditingController cost = TextEditingController(text: '11000');

  Policy toPolicyObj() {
    return Policy(
      number.text,
      name.text,
      company.text,

      DateTime.utc(int.parse(startYear.text) - 543, int.parse(startMonth.text),
          int.parse(startDay.text)), //startDate
      DateTime.utc(int.parse(endYear.text) - 543, int.parse(endMonth.text),
          int.parse(endDay.text)),
      //endDate

      double.parse(coverage.text),
      double.parse(cost.text),
    );
  }
}
