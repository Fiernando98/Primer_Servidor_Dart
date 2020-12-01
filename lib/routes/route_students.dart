import 'package:my_project/models/student.dart';
import 'package:my_project/my_project.dart';

class RouteStudents extends ResourceController {
  RouteStudents(this._context);

  final ManagedContext _context;

  @Operation.get()
  Future<Response> getAllStudents() async {
    final Query _studentsQuery = Query<Student>(_context)
      ..sortBy((u) => u.id, QuerySortOrder.ascending);
    final _students = await _studentsQuery.fetch();
    return Response.ok(_students);
  }

  @Operation.get('id')
  Future<Response> getStudentFromID(@Bind.path('id') int _idStudent) async {
    final Query _studentsQuery = Query<Student>(_context)
      ..where((x) => x.id).equalTo(_idStudent);
    final _student = await _studentsQuery.fetchOne();
    if (_student != null) {
      return Response.ok(_student);
    }
    return Response.notFound(
        body: {"error": "there is no student with id $_idStudent"});
  }

  @Operation.delete('id')
  Future<Response> deleteStudent(@Bind.path('id') int _idStudent) async {
    final _studentsQuery = Query<Student>(_context)
      ..where((x) => x.id).equalTo(_idStudent);
    final _deleted = await _studentsQuery.delete();
    if (_deleted != null && _deleted > 0) {
      return Response.ok(null);
    }
    return Response.notFound(
        body: {"error": "there is no student with id $_idStudent"});
  }

  @Operation.put('id')
  Future<Response> editStudent(@Bind.path('id') int _idStudent,
      @Bind.body(ignore: ['id']) Student input) async {
    final _studentsQuery = Query<Student>(_context)
      ..values = input
      ..where((x) => x.id).equalTo(_idStudent);
    final _updated = await _studentsQuery.updateOne();
    if (_updated != null) {
      return Response.ok(_updated);
    }
    return Response.notFound(
        body: {"error": "there is no student with id $_idStudent"});
  }

  @Operation.post()
  Future<Response> createStudent(
      @Bind.body(ignore: ['id']) Student input) async {
    final query = Query<Student>(_context)..values = input;
    final _insertedData = await query.insert();
    return Response.created("", body: _insertedData);
  }
}
