import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'book_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class BookModel {
  @HiveField(0)
  final List<Items> items;

  BookModel(this.items);
  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
}

@HiveType(typeId: 2)
@JsonSerializable()
class Items {
  @HiveField(10)
  final String? id;
  @HiveField(11)
  final VolumeInfo? volumeInfo;

  Items(this.id, this.volumeInfo);
  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
}

@HiveType(typeId: 3)
@JsonSerializable()
class VolumeInfo {
  @HiveField(12)
  final String? publishedDate;
  @HiveField(13)
  final String? title;
  @HiveField(14)
  final String? infoLink;
  @HiveField(15)
  final List<String>? authors;
  @HiveField(16)
  final String? publisher;
  @HiveField(17)
  final String? description;
  @HiveField(18)
  final int? pageCount;
  @HiveField(19)
  final ImageLinks? imageLinks;
  @HiveField(20)
  final String? previewLink;
  @HiveField(21)
  final List<String>? categories;
  @HiveField(22)
  final Pdf? pdf;

  VolumeInfo(
      this.title,
      this.authors,
      this.publisher,
      this.description,
      this.pageCount,
      this.imageLinks,
      this.previewLink,
      this.pdf,
      this.categories,
      this.publishedDate,
      this.infoLink);

  factory VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoFromJson(json);
}

@HiveType(typeId: 4)
@JsonSerializable()
class ImageLinks {
  @HiveField(23)
  final String? thumbnail;
  @HiveField(24)
  final String? smallThumbnail;

  ImageLinks(this.thumbnail, this.smallThumbnail);

  factory ImageLinks.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksFromJson(json);
}
@HiveType(typeId: 5)
@JsonSerializable()
class Pdf {
    @HiveField(25)
  final bool? isAvailable;

  factory Pdf.fromJson(Map<String, dynamic> json) => _$PdfFromJson(json);

  Pdf(this.isAvailable);
}
