class Report {
  final String identification;
  final String patientName;
  final int age;
  final String image;
  final String doctorConfirmed;

  Report({
    required this.identification,
    required this.patientName,
    required this.age,
    required this.image,
    required this.doctorConfirmed,
  });

  @override
  String toString() => "$patientName (CCCD=$identification)";
}
