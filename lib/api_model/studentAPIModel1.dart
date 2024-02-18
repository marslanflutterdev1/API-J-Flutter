class studentModel {
  String? name, rollNo, semester, degree;

  studentModel({
    this.name,
    this.rollNo,
    this.semester,
    this.degree,
  });

  factory studentModel.fromJson(Map<String, dynamic> puttingJson) {
    return studentModel(
      name: puttingJson['name'],
      rollNo: puttingJson['rollNo'],
      semester: puttingJson['semester'],
      degree: puttingJson['degree'],
    );
  }
}
