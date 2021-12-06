class Patient {
  const Patient(this.id, this.name, this.age, this.image);

  final int id;
  final String name;
  final int age;
  final String image;

  @override
  String toString() => "$name (id=$id)";
}
