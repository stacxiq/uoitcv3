import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'college.g.dart';

@JsonSerializable()
class Colleges extends Equatable {
    Colleges({
        required this.colleges,
        required this.utilities,
    });

    final List<College>? colleges;
    final List<Utility>? utilities;

    Colleges copyWith({
        List<College>? colleges,
        List<Utility>? utilities,
    }) {
        return Colleges(
            colleges: colleges ?? this.colleges,
            utilities: utilities ?? this.utilities,
        );
    }

    factory Colleges.fromJson(Map<String, dynamic> json) => _$CollegesFromJson(json);

    Map<String, dynamic> toJson() => _$CollegesToJson(this);

    @override
    String toString(){
        return "$colleges, $utilities, ";
    }

    @override
    List<Object?> get props => [
    colleges, utilities, ];
}

@JsonSerializable()
class College extends Equatable {
    College({
        required this.collegeId,
        required this.title,
        required this.location,
        required this.description,
        required this.year,
        required this.isEvening,
        required this.images,
        required this.departments,
    });

    @JsonKey(name: 'college_id') 
    final String collegeId;
    final String title;
    final String location;
    final String description;
    final String year;

    @JsonKey(name: 'is_evening') 
    final String isEvening;
    final String images;
    final List<Department>? departments;

    College copyWith({
        String? collegeId,
        String? title,
        String? location,
        String? description,
        String? year,
        String? isEvening,
        String? images,
        List<Department>? departments,
    }) {
        return College(
            collegeId: collegeId ?? this.collegeId,
            title: title ?? this.title,
            location: location ?? this.location,
            description: description ?? this.description,
            year: year ?? this.year,
            isEvening: isEvening ?? this.isEvening,
            images: images ?? this.images,
            departments: departments ?? this.departments,
        );
    }

    factory College.fromJson(Map<String, dynamic> json) => _$CollegeFromJson(json);

    Map<String, dynamic> toJson() => _$CollegeToJson(this);

    @override
    String toString(){
        return "$collegeId, $title, $location, $description, $year, $isEvening, $images, $departments, ";
    }

    @override
    List<Object?> get props => [
    collegeId, title, location, description, year, isEvening, images, departments, ];
}

@JsonSerializable()
class Department extends Equatable {
    Department({
        required this.departmentId,
        required this.title,
        required this.description,
        required this.images,
    });

    @JsonKey(name: 'department_id') 
    final String departmentId;
    final String title;
    final String description;
    final String images;

    Department copyWith({
        String? departmentId,
        String? title,
        String? description,
        String? images,
    }) {
        return Department(
            departmentId: departmentId ?? this.departmentId,
            title: title ?? this.title,
            description: description ?? this.description,
            images: images ?? this.images,
        );
    }

    factory Department.fromJson(Map<String, dynamic> json) => _$DepartmentFromJson(json);

    Map<String, dynamic> toJson() => _$DepartmentToJson(this);

    @override
    String toString(){
        return "$departmentId, $title, $description, $images, ";
    }

    @override
    List<Object?> get props => [
    departmentId, title, description, images, ];
}

@JsonSerializable()
class Utility extends Equatable {
    Utility({
        required this.property,
        required this.value,
        required this.extraInformation,
    });

    final String property;
    final String value;

    @JsonKey(name: 'extra_information') 
    final String extraInformation;

    Utility copyWith({
        String? property,
        String? value,
        String? extraInformation,
    }) {
        return Utility(
            property: property ?? this.property,
            value: value ?? this.value,
            extraInformation: extraInformation ?? this.extraInformation,
        );
    }

    factory Utility.fromJson(Map<String, dynamic> json) => _$UtilityFromJson(json);

    Map<String, dynamic> toJson() => _$UtilityToJson(this);

    @override
    String toString(){
        return "$property, $value, $extraInformation, ";
    }

    @override
    List<Object?> get props => [
    property, value, extraInformation, ];
}