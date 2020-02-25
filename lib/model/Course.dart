import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Activities.dart';
import 'package:apimoviles/model/Advertisement.dart';
import 'package:apimoviles/model/Schedule.dart';
import 'package:apimoviles/model/Users.dart';

class Course extends ManagedObject<tblCourse> implements tblCourse{}
class tblCourse{

  @primaryKey
  int idCourse;

  String name;
  String description;
  
  @Relate(#fkiduser)
  Users idTeacher;

  ManagedSet<Schedule> fkcourse;
  ManagedSet<Activities> fkcourse2;
  ManagedSet<Advertisement> fkcourse3;
}