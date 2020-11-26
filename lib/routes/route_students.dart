import 'package:my_project/my_project.dart';

class RouteStudents extends ResourceController {
  final List<dynamic> _students = [
    {'id': 11, 'nombre': 'Fransico'},
    {'id': 12, 'nombre': 'Pancho'},
    {'id': 13, 'nombre': 'Paco'},
    {'id': 14, 'nombre': 'Frank'},
    {'id': 15, 'nombre': 'Francis'}
  ];

  @Operation.get()
  Future<Response> getAllStudents() async {
    return Response.ok(_students);
  }

  @Operation.get('id')
  Future<Response> getStudentFromID(@Bind.path('id') int _idStudent) async {
    final dynamic _student = _students.firstWhere(
        (student) => student["id"] == _idStudent,
        orElse: () => null);
    if (_students != null) {
      return Response.ok(_student);
    }
    return Response.notFound();
  }
}
