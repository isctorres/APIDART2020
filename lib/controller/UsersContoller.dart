import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Users.dart';

class UsersController extends ResourceController{

  final ManagedContext context;
  UsersController(this.context);

  @Operation.get()
  Future<Response> getUsers() async{
    final userQuery = Query<Users>(context);
    final resUser = await userQuery.fetch();
    return Response.ok(resUser);
  }

  @Operation.get('idUser')
  Future<Response> getUserById(@Bind.path('idUser') int idUser) async{
    final userQuery = Query<Users>(context)..
    where((a)=>a.idUser).equalTo(idUser);
    final resUser = await userQuery.fetch();
    return Response.ok(resUser);
  }

  @Operation.post()
  Future<Response> insUser() async {
    final objUser = Users()..read(await request.body.decode());
    final query = Query<Users>(context)..values = objUser;
    final insert = await query.insert();
    return Response.ok(insert); 
  }

  @Operation.put()
  Future<Response> updUser(@Bind.path('idUser') int idUser) async {
    final objUser = Users()..read(await request.body.decode());
    final queryUser = Query<Users>(context)..
          where((a)=>a.idUser).equalTo(idUser)..values = objUser;
    final update = await queryUser.updateOne();
    return Response.ok(update);
  }

  @Operation.delete('idUser')
  Future<Response> delUser(@Bind.path('idUser') int idUser) async{
    final queryUser = Query<Users>(context)..
          where((a)=>a.idUser).equalTo(idUser);
    final delete = await queryUser.delete();
    return Response.ok(delete);
  }
}