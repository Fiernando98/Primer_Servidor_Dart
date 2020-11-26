import 'package:my_project/my_project.dart';

class Student extends ManagedObject<_Student> implements _Student {
  @override
  String toString() {
    return '_Student{id: $id, name: $name}';
  }
}

class _Student {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Column(unique: true)
  String name;
}
