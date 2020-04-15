import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Activities.dart';
import 'package:apimoviles/model/Advertisement.dart';
import 'package:apimoviles/model/Users.dart';

class CommentActivity extends ManagedObject<tblCommentActivity> implements tblCommentActivity{}
class tblCommentActivity{

    @primaryKey
    int idCommentActivity;

    String comment;
    DateTime dateCommentActivity;

    @Relate(#fkactivity2)
    Activities idActivity;

    @Relate(#fkstudent3)
    Users idStudent;
}