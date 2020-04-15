import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Advertisement.dart';
import 'package:apimoviles/model/CommentAdvertisement.dart';

class CommentAdvertisementController extends ResourceController{

  final ManagedContext context;
  CommentAdvertisementController(this.context);

  @Operation.get()
  Future<Response> getCommentAdvertisement() async{
    final commentAdvertisementQuery = Query<CommentAdvertisement>(context);
    final resCommentAdvertisement = await commentAdvertisementQuery.fetch();
    return Response.ok(resCommentAdvertisement);
  }

  @Operation.get('idCommnetAdvertisement')
  Future<Response> getCommentAdvertisementById(@Bind.path('idCommnetAdvertisement') int idComentAdv) async{
    final commentAdvertisementQuery = Query<CommentAdvertisement>(context)..
    where((a)=>a.idCommnetAdvertisement).equalTo(idComentAdv);
    final resCommentAdvertisement = await commentAdvertisementQuery.fetch();
    return Response.ok(resCommentAdvertisement);
  }

  @Operation.post()
  Future<Response> insCommentAdvertisement() async {
    final objCommentAdvertisement = CommentAdvertisement()..read(await request.body.decode());
    final query = Query<CommentAdvertisement>(context)..values = objCommentAdvertisement;
    final insert = await query.insert();
    return Response.ok(insert); 
  }

  @Operation.put('idCommentAdvertisement')
  Future<Response> updCommentAdvertisement(@Bind.path('idCommentAdvertisement') int idComentAdv) async {
    final objCommentAdvertisement = CommentAdvertisement()..read(await request.body.decode());
    final queryCommentAdvertisement = Query<CommentAdvertisement>(context)..
          where((a)=>a.idCommnetAdvertisement).equalTo(idComentAdv)..values = objCommentAdvertisement;
    final update = await queryCommentAdvertisement.updateOne();
    return Response.ok(update);
  }

  @Operation.delete('idCommentAdvertisement')
  Future<Response> delCommentAdvertisement(@Bind.path('idCommentAdvertisement') int idComentAdv) async{
    final queryCommentAdvertisement = Query<CommentAdvertisement>(context)..
          where((a)=>a.idCommnetAdvertisement).equalTo(idComentAdv);
    final delete = await queryCommentAdvertisement.delete();
    return Response.ok(delete);
  }
}