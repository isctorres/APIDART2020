import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Advertisement.dart';
import 'package:apimoviles/model/Users.dart';

class CommentActivity extends ManagedObject<tblCommentActivity> implements tblCommentActivity{}
class tblCommentActivity{

    @primaryKey
    int idCommentActivity;

    String comment;
    DateTime dateCommentActivity;

    @Relate(#fkactivity2)
    Advertisement idAdvertisement;

    @Relate(#fkstudent3)
    Users idStudent;
}