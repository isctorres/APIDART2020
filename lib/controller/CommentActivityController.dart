import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Advertisement.dart';
import 'package:apimoviles/model/CommentActivity.dart';

class CommentActivityController extends ResourceController{

  final ManagedContext context;
  CommentActivityController(this.context);

  @Operation.get()
  Future<Response> getCommentAct() async{
    final commentactQuery = Query<CommentActivity>(context);
    final resCommentAct = await commentactQuery.fetch();
    return Response.ok(resCommentAct);
  }

  @Operation.get('idCommentAct')
  Future<Response> getCommentActById(@Bind.path('idCommentAct') int idCA) async{
    final commentactQuery = Query<CommentActivity>(context)..
    where((a)=>a.idCommentActivity).equalTo(idCA);
    final resCommentActivity = await commentactQuery.fetch();
    return Response.ok(resCommentActivity);
  }

  @Operation.post()
  Future<Response> insCommentActivity() async {
    final objCommentAct = CommentActivity()..read(await request.body.decode());
    final query = Query<CommentActivity>(context)..values = objCommentAct;
    final insert = await query.insert();
    return Response.ok(insert); 
  }

  @Operation.put('idCommentAct')
  Future<Response> updCommentAct(@Bind.path('idCommentAct') int idCA) async {
    final objCommentAct = CommentActivity()..read(await request.body.decode());
    final queryCommentAct = Query<CommentActivity>(context)..
          where((a)=>a.idCommentActivity).equalTo(idCA)..values = objCommentAct;
    final update = await queryCommentAct.updateOne();
    return Response.ok(update);
  }

  @Operation.delete('idCommentAct')
  Future<Response> delCommentAct(@Bind.path('idCommentAct') int idCA) async{
    final queryCommentAct = Query<CommentActivity>(context)..
          where((a)=>a.idCommentActivity).equalTo(idCA);
    final delete = await queryCommentAct.delete();
    return Response.ok(delete);
  }
}