import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/CommentAdvertisement.dart';
import 'package:apimoviles/model/Course.dart';

class Advertisement extends ManagedObject<tblAdvertisement> implements tblAdvertisement{}
class tblAdvertisement{
  @primaryKey
  int idAdvertisement;

  String notice;
  DateTime dateAdvertisement;

  @Relate(#fkcourse3)
  Course idCourse;

  ManagedSet<CommentAdvertisement> fkadvertisement;
  
}