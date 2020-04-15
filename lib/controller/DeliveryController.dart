import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Delivery.dart';

class DeliveryController extends ResourceController{

  final ManagedContext context;
  DeliveryController(this.context);

  @Operation.get()
  Future<Response> getDeliveries() async{
    final deliveryQuery = Query<Delivery>(context);
    final resDelivery = await deliveryQuery.fetch();
    return Response.ok(resDelivery);
  }

  @Operation.get('idDelivery')
  Future<Response> getDeliveryById(@Bind.path('idDelivery') int idDelivery) async{
    final deliveryQuery = Query<Delivery>(context)..
    where((a)=>a.idDelivery).equalTo(idDelivery);
    final resDelivery = await deliveryQuery.fetch();
    return Response.ok(resDelivery);
  }

  @Operation.post()
  Future<Response> insDelivery() async {
    final objDelivery = Delivery()..read(await request.body.decode());
    final query = Query<Delivery>(context)..values = objDelivery;
    final insert = await query.insert();
    return Response.ok(insert); 
  }

  @Operation.put('idDelivery')
  Future<Response> updDelivery(@Bind.path('idDelivery') int idDelivery) async {
    final objDelivery = Delivery()..read(await request.body.decode());
    final queryDelivery = Query<Delivery>(context)..
          where((a)=>a.idDelivery).equalTo(idDelivery)..values = objDelivery;
    final update = await queryDelivery.updateOne();
    return Response.ok(update);
  }

  @Operation.delete('idDelivery')
  Future<Response> delDelivery(@Bind.path('idDelivery') int idDelivery) async{
    final queryDelivery = Query<Delivery>(context)..
          where((a)=>a.idDelivery).equalTo(idDelivery);
    final delete = await queryDelivery.delete();
    return Response.ok(delete);
  }
}