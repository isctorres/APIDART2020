import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/UserType.dart';

class UserTypeController extends ResourceController{

  final ManagedContext context;
  UserTypeController(this.context);

  @Operation.get()
  Future<Response> getUserType() async{
    final userTypeQuery = Query<UserType>(context);
    final resUserType = await userTypeQuery.fetch();
    return Response.ok(resUserType);
  }

  @Operation.get('idUserType')
  Future<Response> getUserTypeById(@Bind.path('idUserType') int idUserType) async{
    final userTypeQuery = Query<UserType>(context)..
    where((a)=>a.idUserType).equalTo(idUserType);
    final resUserType = await userTypeQuery.fetch();
    return Response.ok(resUserType);
  }

  @Operation.post()
  Future<Response> insUserType() async {
    final objUserType = UserType()..read(await request.body.decode());
    final query = Query<UserType>(context)..values = objUserType;
    final insert = await query.insert();
    return Response.ok(insert); 
  }

  @Operation.put()
  Future<Response> updUserType(@Bind.path('idUserType') int idUserType) async {
    final objUserType = UserType()..read(await request.body.decode());
    final queryUserType = Query<UserType>(context)..
          where((a)=>a.idUserType).equalTo(idUserType)..values = objUserType;
    final update = await queryUserType.updateOne();
    return Response.ok(update);
  }

  @Operation.delete('idUserType')
  Future<Response> delUserType(@Bind.path('idUserType') int idUserType) async{
    final queryUserType = Query<UserType>(context)..
          where((a)=>a.idUserType).equalTo(idUserType);
    final delete = await queryUserType.delete();
    return Response.ok(delete);
  }
}