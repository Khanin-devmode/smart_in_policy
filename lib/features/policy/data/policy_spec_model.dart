import 'package:flutter/material.dart';

class PolicySpec {
  PolicySpec(
      {required this.policySpecCode, required this.policySpecPeriodCode});

  final int policySpecCode; //e.g. 001, 002, 003
  final String policySpecPeriodCode; //e.g.  aa, ab, ac
  double? aaAmount;
  int? aaMonthPeriod;
  int? aaPaymentCount;

  Map<String, dynamic> toCollectionObj() {
    return {
      'aaAmount': aaAmount,
      'aaMonthPeriod': aaMonthPeriod,
      'aaPaymentCount': aaPaymentCount,
    };
  }
}

class NewPolicySpecForm {
  NewPolicySpecForm()
      : aaAmount = TextEditingController(),
        aaMonthPeriod = TextEditingController(),
        aaPaymentCount = TextEditingController();

  TextEditingController aaAmount;
  TextEditingController aaMonthPeriod;
  TextEditingController aaPaymentCount;
}
