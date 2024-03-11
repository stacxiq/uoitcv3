import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()
class VideoModel extends Equatable {
    VideoModel({
        required this.id,
        required this.title,
        required this.url,
        required this.image,
        required this.date,
    });

    final String id;
    final String title;
    final String url;
    final String image;
    final DateTime? date;

    VideoModel copyWith({
        String? id,
        String? title,
        String? url,
        String? image,
        DateTime? date,
    }) {
        return VideoModel(
            id: id ?? this.id,
            title: title ?? this.title,
            url: url ?? this.url,
            image: image ?? this.image,
            date: date ?? this.date,
        );
    }

    factory VideoModel.fromJson(Map<String, dynamic> json) => _$VideoModelFromJson(json);

    Map<String, dynamic> toJson() => _$VideoModelToJson(this);

    @override
    String toString(){
        return "$id, $title, $url, $image, $date, ";
    }

    @override
    List<Object?> get props => [
    id, title, url, image, date, ];
}