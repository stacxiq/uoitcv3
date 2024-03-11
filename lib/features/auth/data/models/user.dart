import 'dart:convert';

class User {
  bool? status;
  String? name;
  String? jwt;
  String? employeeNumber;
  String? jobTitleNam;
  String? is_updated;

  User(
      [this.status,
      this.name,
      this.jwt,
      this.employeeNumber,
      this.jobTitleNam,
      this.is_updated]);

  User copyWith(
      {bool? status,
      String? name,
      String? jwt,
      String? employeeNumber,
      String? jobTitleNam,
      String? is_updated}) {
    return User(
        status ?? this.status,
        name ?? this.name,
        jwt ?? this.jwt,
        employeeNumber ?? this.employeeNumber,
        jobTitleNam ?? this.jobTitleNam,
        is_updated ?? this.is_updated);
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'name': name,
      'jwt': jwt,
      'employeeNumber': employeeNumber,
      'jobTitleNam': jobTitleNam,
      'is_updated': is_updated
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['status'],
      map['name'],
      map['jwt'],
      map['employeeNumber'],
      map['jobTitleNam'],
      map['is_updated'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(status: $status, name: $name, is_updated: $is_updated, jwt: $jwt, ,employeeNumber: $employeeNumber, jobTitleNam: $jobTitleNam)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.status == status &&
        other.name == name &&
        other.jwt == jwt &&
        other.employeeNumber == employeeNumber &&
        other.jobTitleNam == jobTitleNam;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        name.hashCode ^
        jwt.hashCode ^
        employeeNumber.hashCode ^
        jobTitleNam.hashCode;
  }
}
