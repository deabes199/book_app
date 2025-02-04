import 'package:book_app/feathers/favoriets/data/models/favorite_model.dart';
import 'package:hive/hive.dart';

class HiveService {
  static const String favBook = 'favBook';
  static late Box<FavoriteModel> _favBookBox;

  // تهيئة الـ Box في البداية
  static Future<void> init() async {
    _favBookBox = await Hive.openBox<FavoriteModel>(favBook);
  }
  

  // إضافة كتاب إلى المفضلة
  static  addItem({required FavoriteModel book}) async {
    await _favBookBox.put(book.id, book);
  }

  // جلب الكتب من المفضلة
  static Future<List<FavoriteModel>> getItems() async {
    return _favBookBox.values.toList();
  }

  // حذف كتاب من المفضلة
  static Future<void> deleteItem(String id) async {
    await _favBookBox.delete(id);
  }

  // مسح جميع الكتب في المفضلة
  static Future<void> clearAllItems() async {
    await _favBookBox.clear();
  }
}
