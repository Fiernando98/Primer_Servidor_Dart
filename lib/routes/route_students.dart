import 'package:my_project/models/student.dart';
import 'package:my_project/my_project.dart';

class RouteStudents extends ResourceController {
  final ManagedContext _context;

  RouteStudents(this._context);

  @Operation.get()
  Future<Response> getAllStudents() async {
    final Query _studtetsQuery = Query<Student>(_context);
    final _students = await _studtetsQuery.fetch();
    return Response.ok(_students);
  }

  @Operation.get('id')
  Future<Response> getStudentFromID(@Bind.path('id') int _idStudent) async {
    final Query _studtetsQuery = Query<Student>(_context)
      ..where((x) => x.id).equalTo(_idStudent);
    final _student = await _studtetsQuery.fetchOne();
    if (_student != null) return Response.ok(_student);
    return Response.notFound(
        body: {"error": "there is no student with id $_idStudent"});
  }

  @Operation.post()
  Future<Response> createStudent(
      @Bind.body(ignore: ['id']) Student input) async {
    final query = Query<Student>(_context)..values = input;
    final _insertedData = await query.insert();
    return Response.ok(_insertedData);
  }
}
