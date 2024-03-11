import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gallery.g.dart';
@JsonSerializable()
class GalleryModel extends Equatable {
    GalleryModel({
        required this.id,
        required this.title,
        required this.date,
        required this.images,
    });

    final String id;
    final String title;
    final String date;
    final List<Image>? images;

    GalleryModel copyWith({
        String? id,
        String? title,
        String? date,
        List<Image>? images,
    }) {
        return GalleryModel(
            id: id ?? this.id,
            title: title ?? this.title,
            date: date ?? this.date,
            images: images ?? this.images,
        );
    }

    factory GalleryModel.fromJson(Map<String, dynamic> json) => _$GalleryModelFromJson(json);

    Map<String, dynamic> toJson() => _$GalleryModelToJson(this);

    @override
    String toString(){
        return "$id, $title, $date, $images, ";
    }

    @override
    List<Object?> get props => [
    id, title, date, images, ];
}

@JsonSerializable()
class Image extends Equatable {
    Image({
        required this.path,
    });

    final String path;

    Image copyWith({
        String? path,
    }) {
        return Image(
            path: path ?? this.path,
        );
    }

    factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

    Map<String, dynamic> toJson() => _$ImageToJson(this);

    @override
    String toString(){
        return "$path, ";
    }

    @override
    List<Object?> get props => [
    path, ];
}