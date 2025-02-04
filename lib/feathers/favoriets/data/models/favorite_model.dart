import 'package:hive/hive.dart';

part 'favorite_model.g.dart';

@HiveType(typeId: 32)
class FavoriteModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String thumbnail;
  @HiveField(3)
  final String authors;

  FavoriteModel({required this.id, required this.title, required this.thumbnail, required this.authors});
}
