class Report {
  final String identification;
  final String patientName;
  final int age;
  final String image;

  Report(this.identification, this.patientName, this.age, this.image);

  @override
  String toString() => "$patientName (id=$identification)";
}
