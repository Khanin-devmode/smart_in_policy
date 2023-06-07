class Policy {
  Policy(this.policyNumber, this.startDate, this.endDate, this.policyCoverage,
      this.policyCost);

  String policyNumber;
  DateTime startDate;
  DateTime endDate;
  double policyCoverage;
  double policyCost;
  List<Protection> protections = [];
}

class Protection {
  Protection(this.name, this.protectionsYears, this.protectionAmount);

  String name;
  List<int> protectionsYears;
  double protectionAmount;
}
