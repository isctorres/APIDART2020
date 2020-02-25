import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Advertisement.dart';

class AdvertisementController extends ResourceController{

  final ManagedContext context;
  AdvertisementController(this.context);

  @Operation.get()
  Future<Response> getActivities() async{
    final advertisementQuery = Query<Advertisement>(context);
    final resAdvertisement = await advertisementQuery.fetch();
    return Response.ok(resAdvertisement);
  }

  @Operation.get('idAdvertisement')
  Future<Response> getAdvertisementById(@Bind.path('idAdvertisement') int idAdv) async{
    final advertisementQuery = Query<Advertisement>(context)..
    where((a)=>a.idAdvertisement).equalTo(idAdv);
    final resAdvertisement = await advertisementQuery.fetch();
    return Response.ok(resAdvertisement);
  }

  @Operation.post()
  Future<Response> insAdvertisement() async {
    final objAdvertisement = Advertisement()..read(await request.body.decode());
    final query = Query<Advertisement>(context)..values = objAdvertisement;
    final insert = await query.insert();
    return Response.ok(insert); 
  }

  @Operation.put()
  Future<Response> updAdvertisement(@Bind.path('idAdvertisement') int idAdv) async {
    final objAdvertisement = Advertisement()..read(await request.body.decode());
    final queryAdvertisement = Query<Advertisement>(context)..
          where((a)=>a.idAdvertisement).equalTo(idAdv)..values = objAdvertisement;
    final update = await queryAdvertisement.updateOne();
    return Response.ok(update);
  }

  @Operation.delete('idAdvertisement')
  Future<Response> delActividad(@Bind.path('idAdvertisement') int idAdv) async{
    final queryAdvertisement = Query<Advertisement>(context)..
          where((a)=>a.idAdvertisement).equalTo(idAdv);
    final delete = await queryAdvertisement.delete();
    return Response.ok(delete);
  }
}