import 'package:my_project/my_project.dart';

class Student extends ManagedObject<_Student> implements _Student {
  @override
  String toString() {
    return '_Student{id: $id, name: $name}';
  }
}

class _Student {
  @Column(
      primaryKey: true,
      nullable: false,
      autoincrement: true,
      indexed: true,
      unique: true)
  int id;

  @Column(unique: true)
  String name;
}
