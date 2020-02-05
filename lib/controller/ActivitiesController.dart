import 'package:apimoviles/apimoviles.dart';

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
    where((a)=>a.idActividad).equalTo(idAct);
    final resActivities = await activitiesQuery.fetch();
    return Response.ok(resActivities);
  }

  @Operation.post()
  Future<Response> insActividad() async {
    final objActividad = Activities()..read(await request.body.decode());
    final query = Query<Activities>(context)..values = objActividad;
    final insActividad = await query.insert();
    return Response.ok(insActividad); 
  }

  @Operation.put()
  Future<Response> updActividad(@Bind.path('idActividad') int idAct) async {
    final objActividad = Activities()..read(await request.body.decode());
    final queryActividad = Query<Activities>(context)..
          where((a)=>a.idActividad).equalTo(idAct)..values = objActividad;
    final updActividad = await queryActividad.updateOne();
    return Response.ok(updActividad);
  }

  @Operation.delete('idActividad')
  Future<Response> delActividad(@Bind.path('idActividad') int idAct) async{
    final queryActividad = Query<Activities>(context)..
          where((a)=>a.idActividad).equalTo(idAct);
    final delActividad = await queryActividad.delete();
    return Response.ok(delActividad);
  }

}