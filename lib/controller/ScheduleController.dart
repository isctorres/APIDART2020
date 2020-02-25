import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Schedule.dart';

class ScheduleController extends ResourceController{

  final ManagedContext context;
  ScheduleController(this.context);

  @Operation.get()
  Future<Response> getSchedules() async{
    final scheduleQuery = Query<Schedule>(context);
    final resSchedule = await scheduleQuery.fetch();
    return Response.ok(resSchedule);
  }

  @Operation.get('idSchedule')
  Future<Response> getScheduleById(@Bind.path('idSchedule') int idSchedule) async{
    final scheduleQuery = Query<Schedule>(context)..
    where((a)=>a.idSchedule).equalTo(idSchedule);
    final resSchedule = await scheduleQuery.fetch();
    return Response.ok(resSchedule);
  }

  @Operation.post()
  Future<Response> insSchedule() async {
    final objSchedule = Schedule()..read(await request.body.decode());
    final query = Query<Schedule>(context)..values = objSchedule;
    final insert = await query.insert();
    return Response.ok(insert); 
  }

  @Operation.put()
  Future<Response> updSchedule(@Bind.path('idSchedule') int idSchedule) async {
    final objSchedule = Schedule()..read(await request.body.decode());
    final querySchedule = Query<Schedule>(context)..
          where((a)=>a.idSchedule).equalTo(idSchedule)..values = objSchedule;
    final update = await querySchedule.updateOne();
    return Response.ok(update);
  }

  @Operation.delete('idSchedule')
  Future<Response> delSchedule(@Bind.path('idSchedule') int idSchedule) async{
    final querySchedule = Query<Schedule>(context)..
          where((a)=>a.idSchedule).equalTo(idSchedule);
    final delete = await querySchedule.delete();
    return Response.ok(delete);
  }
}