// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Salary _$SalaryFromJson(Map<String, dynamic> json) => Salary(
      user: (json['user'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      cut: (json['cut'] as List<dynamic>?)
          ?.map((e) => Add.fromJson(e as Map<String, dynamic>))
          .toList(),
      add: (json['add'] as List<dynamic>?)
          ?.map((e) => Add.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SalaryToJson(Salary instance) => <String, dynamic>{
      'user': instance.user,
      'cut': instance.cut,
      'add': instance.add,
    };

Add _$AddFromJson(Map<String, dynamic> json) => Add(
      mcNam: json['mc_nam'] as String,
      mcMoney: json['mc_money'] as String,
    );

Map<String, dynamic> _$AddToJson(Add instance) => <String, dynamic>{
      'mc_nam': instance.mcNam,
      'mc_money': instance.mcMoney,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      marStatus: json['mar_status'] as String,
      childNo: json['child_no'] as String,
      sex: json['sex'] as String,
      degree: json['degree'] as String,
      levl: json['levl'] as String,
      salary: json['salary'] as String,
      endSalary: json['end_salary'] as String,
      allSalary: json['all_salary'] as String,
      jobTitleNam: json['job_title_nam'] as String,
      salaryMonth: json['salary_month'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'mar_status': instance.marStatus,
      'child_no': instance.childNo,
      'sex': instance.sex,
      'degree': instance.degree,
      'levl': instance.levl,
      'salary': instance.salary,
      'end_salary': instance.endSalary,
      'all_salary': instance.allSalary,
      'job_title_nam': instance.jobTitleNam,
      'salary_month': instance.salaryMonth,
    };
