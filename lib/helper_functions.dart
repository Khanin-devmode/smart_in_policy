int getCurrentAge(DateTime dateOfBirth) {
  final DateTime currentDate = DateTime.now();
  int age;

  if (currentDate.month > dateOfBirth.month) {
    age = currentDate.year - dateOfBirth.year;
  } else if (currentDate.month == dateOfBirth.month) {
    if (currentDate.day > dateOfBirth.day) {
      age = age = currentDate.year - dateOfBirth.year;
    } else {
      age = currentDate.year - dateOfBirth.year - 1;
    }
  } else {
    age = currentDate.year - dateOfBirth.year - 1;
  }

  return age;
}
