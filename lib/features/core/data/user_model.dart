class UserConfig {
  UserConfig({required this.inputTypes});

  Map<int, String> inputTypes;

  String getInputName(int inputCode) {
    print(inputTypes);
    if (inputTypes.isNotEmpty) {
      return inputTypes[inputCode] as String;
    } else {
      return 'loading...';
    }
  }
}
