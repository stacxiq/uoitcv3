import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'structure.g.dart';

@JsonSerializable()
class Structure extends Equatable {
    Structure({
        required this.mainStructure,
        required this.subStructure,
    });

    @JsonKey(name: 'main_structure') 
    final List<MainStructure>? mainStructure;

    @JsonKey(name: 'sub_structure') 
    final List<SubStructure>? subStructure;

    Structure copyWith({
        List<MainStructure>? mainStructure,
        List<SubStructure>? subStructure,
    }) {
        return Structure(
            mainStructure: mainStructure ?? this.mainStructure,
            subStructure: subStructure ?? this.subStructure,
        );
    }

    factory Structure.fromJson(Map<String, dynamic> json) => _$StructureFromJson(json);

    Map<String, dynamic> toJson() => _$StructureToJson(this);

    @override
    String toString(){
        return "$mainStructure, $subStructure, ";
    }

    @override
    List<Object?> get props => [
    mainStructure, subStructure, ];
}

@JsonSerializable()
class MainStructure extends Equatable {
    MainStructure({
        required this.structureId,
        required this.title,
    });

    @JsonKey(name: 'structure_id') 
    final String structureId;
    final String title;

    MainStructure copyWith({
        String? structureId,
        String? title,
    }) {
        return MainStructure(
            structureId: structureId ?? this.structureId,
            title: title ?? this.title,
        );
    }

    factory MainStructure.fromJson(Map<String, dynamic> json) => _$MainStructureFromJson(json);

    Map<String, dynamic> toJson() => _$MainStructureToJson(this);

    @override
    String toString(){
        return "$structureId, $title, ";
    }

    @override
    List<Object?> get props => [
    structureId, title, ];
}

@JsonSerializable()
class SubStructure extends Equatable {
    SubStructure({
        required this.departmentId,
        required this.structureId,
        required this.title,
    });

    @JsonKey(name: 'department_id') 
    final String departmentId;

    @JsonKey(name: 'structure_id') 
    final String structureId;
    final String title;

    SubStructure copyWith({
        String? departmentId,
        String? structureId,
        String? title,
    }) {
        return SubStructure(
            departmentId: departmentId ?? this.departmentId,
            structureId: structureId ?? this.structureId,
            title: title ?? this.title,
        );
    }

    factory SubStructure.fromJson(Map<String, dynamic> json) => _$SubStructureFromJson(json);

    Map<String, dynamic> toJson() => _$SubStructureToJson(this);

    @override
    String toString(){
        return "$departmentId, $structureId, $title, ";
    }

    @override
    List<Object?> get props => [
    departmentId, structureId, title, ];
}
