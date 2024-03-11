import 'package:freezed_annotation/freezed_annotation.dart';


part 'news.g.dart';
@JsonSerializable()
class News {
    News({
        required this.id,
        required this.title,
        required this.url,
        required this.date,
        required this.content,
        required this.section,
        required this.views,
        required this.images,
        required this.files,
    });

    final String id;
    final String title;
    final String url;
    final String date;
    final String content;
    final String section;
    final String views;
    final List<Image>? images;
    final List<dynamic>? files;

    News copyWith({
        String? id,
        String? title,
        String? url,
        String? date,
        String? content,
        String? section,
        String? views,
        List<Image>? images,
        List<dynamic>? files,
    }) {
        return News(
            id: id ?? this.id,
            title: title ?? this.title,
            url: url ?? this.url,
            date: date ?? this.date,
            content: content ?? this.content,
            section: section ?? this.section,
            views: views ?? this.views,
            images: images ?? this.images,
            files: files ?? this.files,
        );
    }

    factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

    Map<String, dynamic> toJson() => _$NewsToJson(this);

    @override
    String toString(){
        return "$id, $title, $url, $date, $content, $section, $views, $images, $files, ";
    }


}
 
@JsonSerializable()
class Image {
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


}