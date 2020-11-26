import 'package:my_project/my_project.dart';

class Alumno extends ManagedObject<_Alumno> implements _Alumno {}

class _Alumno {
  @Column(primaryKey: true)
  int id;

  @Column(unique: true)
  String name;
}
