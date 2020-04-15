import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/CommentActivity.dart';
import 'package:apimoviles/model/CommentAdvertisement.dart';
import 'package:apimoviles/model/Delivery.dart';
import 'package:apimoviles/model/Schedule.dart';
import 'package:apimoviles/model/UserType.dart';
import 'package:apimoviles/model/Course.dart';
import 'package:aqueduct/managed_auth.dart';

class Users extends ManagedObject<tblUsers> implements tblUsers, ManagedAuthResourceOwner<tblUsers>{
  @Serialize(input: true, output: false)
  String password;
}
class tblUsers extends ResourceOwnerTableDefinition {

  //@primaryKey
  //int idUser;

  String name;
  String lastName;
  DateTime birDate;
  
  //String password;
  @Column(unique: true)
  String email;

  @Relate(#fktypeuser)
  UserType idType;

  ManagedSet<Course> fkiduser;
  ManagedSet<Schedule> fkidstudent;
  ManagedSet<Delivery> fkstudent2;
  ManagedSet<CommentActivity> fkstudent3;
  ManagedSet<CommentAdvertisement> fkstudent4;
}