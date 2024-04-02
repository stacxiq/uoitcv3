
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'salary.g.dart';

@JsonSerializable()
class Salary extends Equatable {
    const Salary({
        required this.user,
        required this.cut,
        required this.add,
    });

    final List<User>? user;
    final List<Add>? cut;
    final List<Add>? add;

    Salary copyWith({
        List<User>? user,
        List<Add>? cut,
        List<Add>? add,
    }) {
        return Salary(
            user: user ?? this.user,
            cut: cut ?? this.cut,
            add: add ?? this.add,
        );
    }

    factory Salary.fromJson(Map<String, dynamic> json) => _$SalaryFromJson(json);

    Map<String, dynamic> toJson() => _$SalaryToJson(this);

    @override
    String toString(){
        return "$user, $cut, $add, ";
    }

    @override
    List<Object?> get props => [
    user, cut, add, ];
}

@JsonSerializable()
class Add extends Equatable {
    const Add({
        required this.mcNam,
        required this.mcMoney,
    });

    @JsonKey(name: 'mc_nam') 
    final String mcNam;

    @JsonKey(name: 'mc_money') 
    final String mcMoney;

    Add copyWith({
        String? mcNam,
        String? mcMoney,
    }) {
        return Add(
            mcNam: mcNam ?? this.mcNam,
            mcMoney: mcMoney ?? this.mcMoney,
        );
    }

    factory Add.fromJson(Map<String, dynamic> json) => _$AddFromJson(json);

    Map<String, dynamic> toJson() => _$AddToJson(this);

    @override
    String toString(){
        return "$mcNam, $mcMoney, ";
    }

    @override
    List<Object?> get props => [
    mcNam, mcMoney, ];
}

@JsonSerializable()
class User extends Equatable {
    const User({
        required this.marStatus,
        required this.childNo,
        required this.sex,
        required this.degree,
        required this.levl,
        required this.salary,
        required this.endSalary,
        required this.allSalary,
        required this.jobTitleNam,
        required this.salaryMonth,
    });

    @JsonKey(name: 'mar_status') 
    final String marStatus;

    @JsonKey(name: 'child_no') 
    final String childNo;
    final String sex;
    final String degree;
    final String levl;
    final String salary;

    @JsonKey(name: 'end_salary') 
    final String endSalary;

    @JsonKey(name: 'all_salary') 
    final String allSalary;

    @JsonKey(name: 'job_title_nam') 
    final String jobTitleNam;

    @JsonKey(name: 'salary_month') 
    final String salaryMonth;

    User copyWith({
        String? marStatus,
        String? childNo,
        String? sex,
        String? degree,
        String? levl,
        String? salary,
        String? endSalary,
        String? allSalary,
        String? jobTitleNam,
        String? salaryMonth,
    }) {
        return User(
            marStatus: marStatus ?? this.marStatus,
            childNo: childNo ?? this.childNo,
            sex: sex ?? this.sex,
            degree: degree ?? this.degree,
            levl: levl ?? this.levl,
            salary: salary ?? this.salary,
            endSalary: endSalary ?? this.endSalary,
            allSalary: allSalary ?? this.allSalary,
            jobTitleNam: jobTitleNam ?? this.jobTitleNam,
            salaryMonth: salaryMonth ?? this.salaryMonth,
        );
    }

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

    Map<String, dynamic> toJson() => _$UserToJson(this);

    @override
    String toString(){
        return "$marStatus, $childNo, $sex, $degree, $levl, $salary, $endSalary, $allSalary, $jobTitleNam, $salaryMonth, ";
    }

    @override
    List<Object?> get props => [
    marStatus, childNo, sex, degree, levl, salary, endSalary, allSalary, jobTitleNam, salaryMonth, ];
}
