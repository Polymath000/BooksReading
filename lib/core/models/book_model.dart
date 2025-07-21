import 'package:hive/hive.dart';

part 'book_model.g.dart';

@HiveType(typeId: 0)
class BookModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String category;
  @HiveField(2)
  String author;
  @HiveField(3)
  String rate;
  @HiveField(4)
  String notes;

  BookModel({
    required this.name,
    required this.category,
    required this.author,
    required this.rate,
    required this.notes,
  });
}
