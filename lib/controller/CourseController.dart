import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Course.dart';

class CourseController extends ResourceController{

  final ManagedContext context;
  CourseController(this.context);

  @Operation.get()
  Future<Response> getCourse() async{
    final courseQuery = Query<Course>(context);
    final resCourse = await courseQuery.fetch();
    return Response.ok(resCourse);
  }

  @Operation.get('idCourse')
  Future<Response> getCourseById(@Bind.path('idCourse') int idCourse) async{
    final courseQuery = Query<Course>(context)..
    where((a)=>a.idCourse).equalTo(idCourse);
    final resCourse = await courseQuery.fetch();
    return Response.ok(resCourse);
  }

  @Operation.post()
  Future<Response> insCourse() async {
    final objCourse = Course()..read(await request.body.decode());
    final query = Query<Course>(context)..values = objCourse;
    final insert = await query.insert();
    return Response.ok(insert); 
  }

  @Operation.put('idCourse')
  Future<Response> updCourse(@Bind.path('idCourse') int idCourse) async {
    final objCourse = Course()..read(await request.body.decode());
    final queryCourse = Query<Course>(context)..
          where((a)=>a.idCourse).equalTo(idCourse)..values = objCourse;
    final update = await queryCourse.updateOne();
    return Response.ok(update);
  }

  @Operation.delete('idCourse')
  Future<Response> delCourse(@Bind.path('idCourse') int idCourse) async{
    final queryCourse = Query<Course>(context)..
          where((a)=>a.idCourse).equalTo(idCourse);
    final delete = await queryCourse.delete();
    return Response.ok(delete);
  }

}