import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/CommentActivity.dart';
import 'package:apimoviles/model/Course.dart';
import 'package:apimoviles/model/Delivery.dart';

class Activities extends ManagedObject<tblActivities> implements tblActivities{}
class tblActivities {

    @primaryKey
    int idActivity;

    String activity;
    String description;
    DateTime dateActivity;

    @Relate(#fkcourse2)
    Course idCourse;

    ManagedSet<Delivery> fkactivity;
    ManagedSet<CommentActivity> fkactivity2;
}