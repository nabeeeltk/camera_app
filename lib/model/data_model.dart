import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 0)
class imagemodel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String image;

  imagemodel({
    required this.image,
    this.id,
  });
}
