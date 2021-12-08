class Report {
  final String identification;
  final String patientName;
  final String doctorConfirmed;

  Report({
    required this.identification,
    required this.patientName,
    required this.doctorConfirmed,
  });

  @override
  String toString() => "$patientName (CCCD=$identification)";
}
