import 'package:hive/hive.dart';
import 'package:point_of_sale/clases/cuenta.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  //create the constructor

  @HiveField(0)
  late String name;
  @HiveField(1)
  late String username;
  @HiveField(2)
  late String password;
  @HiveField(3)
  late bool isAdmin = false;
  @HiveField(4)
  late List<Cuenta> cuenta = [];

  User({
    required this.name,
    required this.username,
    required this.password,
  });
}
