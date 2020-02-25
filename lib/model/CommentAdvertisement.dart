import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Advertisement.dart';
import 'package:apimoviles/model/Users.dart';

class CommentAdvertisement extends ManagedObject<tblCommentAdvertisement> implements tblCommentAdvertisement{}
class tblCommentAdvertisement{

  @primaryKey
  int idCommnetAdvertisement;

  String comment;
  DateTime dateCommentAdvertisement;

  @Relate(#fkadvertisement)
  Advertisement idAdvertisement;

  @Relate(#fkstudent4)
  Users idStudent;
}