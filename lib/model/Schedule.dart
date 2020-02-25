import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Course.dart';
import 'package:apimoviles/model/Users.dart';

class Schedule extends ManagedObject<tblSchedule> implements tblSchedule{}
class tblSchedule{
  @primaryKey
  int idSchedule;

  @Relate(#fkidstudent)
  Users idstudent;

  @Relate(#fkcourse)
  Course idcourse;

}
