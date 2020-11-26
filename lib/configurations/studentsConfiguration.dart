import 'package:my_project/my_project.dart';

class StudentsConfig extends Configuration {
  StudentsConfig(String path) : super.fromFile(File(path));
  DatabaseConfiguration database;
}
