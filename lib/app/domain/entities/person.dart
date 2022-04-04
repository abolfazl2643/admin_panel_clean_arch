class Person {
  final String idNumber;
  final String name;
  final String familyName;
  final String birthDate;
  final String address;
  final String mobile;
  final String photo;
  bool isChecked;
  final bool approved;

  Person({
    required this.approved,
    required this.idNumber,
    required this.name,
    required this.familyName,
    required this.birthDate,
    required this.address,
    required this.mobile,
    required this.photo,
    required this.isChecked,
  });
}
