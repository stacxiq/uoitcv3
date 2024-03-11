// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'college.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Colleges _$CollegesFromJson(Map<String, dynamic> json) => Colleges(
      colleges: (json['colleges'] as List<dynamic>?)
          ?.map((e) => College.fromJson(e as Map<String, dynamic>))
          .toList(),
      utilities: (json['utilities'] as List<dynamic>?)
          ?.map((e) => Utility.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CollegesToJson(Colleges instance) => <String, dynamic>{
      'colleges': instance.colleges,
      'utilities': instance.utilities,
    };

College _$CollegeFromJson(Map<String, dynamic> json) => College(
      collegeId: json['college_id'] as String,
      title: json['title'] as String,
      location: json['location'] as String,
      description: json['description'] as String,
      year: json['year'] as String,
      isEvening: json['is_evening'] as String,
      images: json['images'] as String,
      departments: (json['departments'] as List<dynamic>?)
          ?.map((e) => Department.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CollegeToJson(College instance) => <String, dynamic>{
      'college_id': instance.collegeId,
      'title': instance.title,
      'location': instance.location,
      'description': instance.description,
      'year': instance.year,
      'is_evening': instance.isEvening,
      'images': instance.images,
      'departments': instance.departments,
    };

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
      departmentId: json['department_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      images: json['images'] as String,
    );

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'department_id': instance.departmentId,
      'title': instance.title,
      'description': instance.description,
      'images': instance.images,
    };

Utility _$UtilityFromJson(Map<String, dynamic> json) => Utility(
      property: json['property'] as String,
      value: json['value'] as String,
      extraInformation: json['extra_information'] as String,
    );

Map<String, dynamic> _$UtilityToJson(Utility instance) => <String, dynamic>{
      'property': instance.property,
      'value': instance.value,
      'extra_information': instance.extraInformation,
    };
