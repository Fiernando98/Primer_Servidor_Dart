import 'package:my_project/my_project.dart';

class Student extends ManagedObject<_Student> implements _Student {}

class _Student {
  @Column(primaryKey: true)
  int id;

  @Column(unique: true)
  String name;
}
