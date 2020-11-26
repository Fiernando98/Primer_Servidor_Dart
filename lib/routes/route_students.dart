import 'package:my_project/models/student.dart';
import 'package:my_project/my_project.dart';

class RouteStudents extends ResourceController {
  final ManagedContext _context;

  RouteStudents(this._context);

  final List<dynamic> _students = [
    {'id': 11, 'nombre': 'Fransico'},
    {'id': 12, 'nombre': 'Pancho'},
    {'id': 13, 'nombre': 'Paco'},
    {'id': 14, 'nombre': 'Frank'},
    {'id': 15, 'nombre': 'Francis'},
    {'id': 16, 'nombre': 'Menona'},
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
    if (_student != null) {
      return Response.ok(_student);
    }
    return Response.notFound(
        body: {"error": "there is no student with id $_idStudent"});
  }

  @Operation.post()
  Future<Response> createStudent(@Bind.body() Student input) async {
    print(input.toString());
    final query = Query<Student>(_context)..values = input;
    final _insertedData = await query.insert();
    return Response.ok(_insertedData);
  }
}
