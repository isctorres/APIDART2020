import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Users.dart';

class UsersController extends ResourceController{

  final ManagedContext context;
  final AuthServer authServer;

  UsersController(this.context, this.authServer);

  @Operation.get()
  Future<Response> getUsers() async{
    final userQuery = Query<Users>(context);
    final resUser = await userQuery.fetch();
    return Response.ok(resUser);
  }

  /*@Operation.get('idUser')
  Future<Response> getUserById(@Bind.path('idUser') int idUser) async{
    final userQuery = Query<Users>(context)..
    where((a)=>a.id).equalTo(idUser);
    final resUser = await userQuery.fetch();
    return Response.ok(resUser);
  }*/

  @Operation.get('idUser','password')
  Future<Response> loginUser(@Bind.path('idUser') String usuario, 
  @Bind.path('password') String pwd ) async {
    
    String token = "";
    try {
      final autenticado = await authServer.authenticate(usuario, pwd, "com.classroom.patm","");
      token = autenticado.accessToken;
      return Response.ok(token);
    } catch (e) {
      return Response.forbidden(body: {"error": "las credenciales no son validas"});
    }
  }

  @Operation.post()
  Future<Response> insUser(@Bind.body() Users user) async {
    
    if (user.username == null || user.password == null) {
      return Response.badRequest(
        body: {"error": "username and password required."});
    }

    user
      ..salt = AuthUtility.generateRandomSalt()
      ..hashedPassword = authServer.hashPassword(user.password, user.salt);
    return Response.ok(await Query(context, values: user).insert());
  }

  @Operation.put('idUser')
  Future<Response> updUser(@Bind.path('idUser') int idUser) async {
    final objUser = Users()..read(await request.body.decode());
    final queryUser = Query<Users>(context)..
          where((a)=>a.id).equalTo(idUser)..values = objUser;
    final update = await queryUser.updateOne();
    return Response.ok(update);
  }

  @Operation.delete('idUser')
  Future<Response> delUser(@Bind.path('idUser') int idUser) async{
    final queryUser = Query<Users>(context)..
          where((a)=>a.id).equalTo(idUser);
    final delete = await queryUser.delete();
    return Response.ok(delete);
  }
}