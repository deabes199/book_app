// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookModelAdapter extends TypeAdapter<BookModel> {
  @override
  final int typeId = 1;

  @override
  BookModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookModel(
      (fields[0] as List).cast<Items>(),
    );
  }

  @override
  void write(BinaryWriter writer, BookModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ItemsAdapter extends TypeAdapter<Items> {
  @override
  final int typeId = 2;

  @override
  Items read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Items(
      fields[10] as String?,
      fields[11] as VolumeInfo?,
    );
  }

  @override
  void write(BinaryWriter writer, Items obj) {
    writer
      ..writeByte(2)
      ..writeByte(10)
      ..write(obj.id)
      ..writeByte(11)
      ..write(obj.volumeInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VolumeInfoAdapter extends TypeAdapter<VolumeInfo> {
  @override
  final int typeId = 3;

  @override
  VolumeInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VolumeInfo(
      fields[13] as String?,
      (fields[15] as List?)?.cast<String>(),
      fields[16] as String?,
      fields[17] as String?,
      fields[18] as int?,
      fields[19] as ImageLinks?,
      fields[20] as String?,
      fields[22] as Pdf?,
      (fields[21] as List?)?.cast<String>(),
      fields[12] as String?,
      fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, VolumeInfo obj) {
    writer
      ..writeByte(11)
      ..writeByte(12)
      ..write(obj.publishedDate)
      ..writeByte(13)
      ..write(obj.title)
      ..writeByte(14)
      ..write(obj.infoLink)
      ..writeByte(15)
      ..write(obj.authors)
      ..writeByte(16)
      ..write(obj.publisher)
      ..writeByte(17)
      ..write(obj.description)
      ..writeByte(18)
      ..write(obj.pageCount)
      ..writeByte(19)
      ..write(obj.imageLinks)
      ..writeByte(20)
      ..write(obj.previewLink)
      ..writeByte(21)
      ..write(obj.categories)
      ..writeByte(22)
      ..write(obj.pdf);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VolumeInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImageLinksAdapter extends TypeAdapter<ImageLinks> {
  @override
  final int typeId = 4;

  @override
  ImageLinks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageLinks(
      fields[23] as String?,
      fields[24] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ImageLinks obj) {
    writer
      ..writeByte(2)
      ..writeByte(23)
      ..write(obj.thumbnail)
      ..writeByte(24)
      ..write(obj.smallThumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageLinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PdfAdapter extends TypeAdapter<Pdf> {
  @override
  final int typeId = 5;

  @override
  Pdf read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pdf(
      fields[25] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Pdf obj) {
    writer
      ..writeByte(1)
      ..writeByte(25)
      ..write(obj.isAvailable);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PdfAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      (json['items'] as List<dynamic>)
          .map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'items': instance.items,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      json['id'] as String?,
      json['volumeInfo'] == null
          ? null
          : VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'id': instance.id,
      'volumeInfo': instance.volumeInfo,
    };

VolumeInfo _$VolumeInfoFromJson(Map<String, dynamic> json) => VolumeInfo(
      json['title'] as String?,
      (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['publisher'] as String?,
      json['description'] as String?,
      (json['pageCount'] as num?)?.toInt(),
      json['imageLinks'] == null
          ? null
          : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
      json['previewLink'] as String?,
      json['pdf'] == null
          ? null
          : Pdf.fromJson(json['pdf'] as Map<String, dynamic>),
      (json['categories'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['publishedDate'] as String?,
      json['infoLink'] as String?,
    );

Map<String, dynamic> _$VolumeInfoToJson(VolumeInfo instance) =>
    <String, dynamic>{
      'publishedDate': instance.publishedDate,
      'title': instance.title,
      'infoLink': instance.infoLink,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'description': instance.description,
      'pageCount': instance.pageCount,
      'imageLinks': instance.imageLinks,
      'previewLink': instance.previewLink,
      'categories': instance.categories,
      'pdf': instance.pdf,
    };

ImageLinks _$ImageLinksFromJson(Map<String, dynamic> json) => ImageLinks(
      json['thumbnail'] as String?,
      json['smallThumbnail'] as String?,
    );

Map<String, dynamic> _$ImageLinksToJson(ImageLinks instance) =>
    <String, dynamic>{
      'thumbnail': instance.thumbnail,
      'smallThumbnail': instance.smallThumbnail,
    };

Pdf _$PdfFromJson(Map<String, dynamic> json) => Pdf(
      json['isAvailable'] as bool?,
    );

Map<String, dynamic> _$PdfToJson(Pdf instance) => <String, dynamic>{
      'isAvailable': instance.isAvailable,
    };
