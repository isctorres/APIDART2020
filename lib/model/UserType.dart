import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Users.dart';

class UserType extends ManagedObject<tblUserType> 
implements tblUserType{}
class tblUserType{
  @primaryKey
  int idUserType;

  @Column(unique: true)
  String description;

  ManagedObject<Users> fktypeuser;
}