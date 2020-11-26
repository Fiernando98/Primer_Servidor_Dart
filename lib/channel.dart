import 'package:my_project/routes/route_students.dart';

import 'my_project.dart';

class MyProjectChannel extends ApplicationChannel {
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  @override
  Controller get entryPoint {
    /*ManagedDataModel dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    PostgreSQLPersistentStore persistentStore =
        PostgreSQLPersistentStore.fromConnectionInfo(
            'MenonaXS', 'micontra', 'localhost', 5432, 'students');
    ManagedContext context = ManagedContext(dataModel, persistentStore);*/
    return Router()..route("/students/[:id]").link(() => RouteStudents());
  }
}
