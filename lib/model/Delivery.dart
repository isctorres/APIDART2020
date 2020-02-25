import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Activities.dart';
import 'package:apimoviles/model/Users.dart';

class Delivery extends ManagedObject<tblDelivery> implements tblDelivery{}
class tblDelivery {

    @primaryKey
    int idDelivery;

    String file;
    DateTime dateDelivery;

    @Relate(#fkstudent2)
    Users idStudent;

    @Relate(#fkactivity)
    Activities idActivity;
}