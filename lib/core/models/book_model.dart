
import 'package:hive/hive.dart';

part 'book_model.g.dart';
@HiveType(typeId: 0)
class BookModel extends HiveObject{

  @HiveField(0)
  final String name;
  @HiveField(1)
  final String category;
  @HiveField(2)
  final String author;
 @HiveField(3) 
  final double rate;
  @HiveField(4)
  final String notes;

  BookModel({
    required this.name,
    required this.category,
    required this.author,
    required this.rate,
    required this.notes,
  });
}