import 'package:flutter/material.dart';

class PolicySpec {
  PolicySpec({
    required this.specCode,
    required this.specPeriodCode,
    this.aaAmount,
    this.aaMonthPeriod,
    this.aaPaymentCount,
  });

  final int specCode; //e.g. 001, 002, 003
  final String specPeriodCode; //e.g.  aa, ab, ac
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

class NewSpecForm {
  NewSpecForm()
      : aaAmount = TextEditingController(),
        aaMonthPeriod = TextEditingController(),
        aaPaymentCount = TextEditingController();

  TextEditingController aaAmount;
  TextEditingController aaMonthPeriod;
  TextEditingController aaPaymentCount;

  PolicySpec toPolicySpecObj(
      {required int specCode, required String specPeriodCode}) {
    return PolicySpec(
      specCode: specCode,
      specPeriodCode: specPeriodCode,
    );
  }
}
