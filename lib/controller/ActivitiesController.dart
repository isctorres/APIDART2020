import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Activities.dart';

class ActivitiesController extends ResourceController{

  final ManagedContext context;
  ActivitiesController(this.context);

  @Operation.get()
  Future<Response> getActivities() async{
    final activitiesQuery = Query<Activities>(context);
    final resActivities = await activitiesQuery.fetch();
    return Response.ok(resActivities);
  }

  @Operation.get('idActividad')
  Future<Response> getActividadById(@Bind.path('idActividad') int idAct) async{
    final activitiesQuery = Query<Activities>(context)..
    where((a)=>a.idActivity).equalTo(idAct);
    final resActivities = await activitiesQuery.fetch();
    return Response.ok(resActivities);
  }

  @Operation.post()
  Future<Response> insActividad() async {
    final objActividad = Activities()..read(await request.body.decode());
    final query = Query<Activities>(context)..values = objActividad;
    final insert = await query.insert();
    return Response.ok(insert); 
  }

  @Operation.put()
  Future<Response> updActividad(@Bind.path('idActividad') int idAct) async {
    final objActividad = Activities()..read(await request.body.decode());
    final queryActividad = Query<Activities>(context)..
          where((a)=>a.idActivity).equalTo(idAct)..values = objActividad;
    final update = await queryActividad.updateOne();
    return Response.ok(update);
  }

  @Operation.delete('idActividad')
  Future<Response> delActividad(@Bind.path('idActividad') int idAct) async{
    final queryActividad = Query<Activities>(context)..
          where((a)=>a.idActivity).equalTo(idAct);
    final update = await queryActividad.delete();
    return Response.ok(update);
  }
}