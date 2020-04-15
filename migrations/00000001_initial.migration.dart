import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration1 extends Migration { 
  @override
  Future upgrade() async {
   		database.createTable(SchemaTable("tblUsers", [SchemaColumn("name", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("lastName", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("birDate", ManagedPropertyType.datetime, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("email", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true),SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("username", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: true, isNullable: false, isUnique: true),SchemaColumn("hashedPassword", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("salt", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false)]));
		database.createTable(SchemaTable("_authclient", [SchemaColumn("id", ManagedPropertyType.string, isPrimaryKey: true, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("hashedSecret", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: true, isUnique: false),SchemaColumn("salt", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: true, isUnique: false),SchemaColumn("redirectURI", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: true, isUnique: false),SchemaColumn("allowedScope", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: true, isUnique: false)]));
		database.createTable(SchemaTable("_authtoken", [SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("code", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: true, isNullable: true, isUnique: true),SchemaColumn("accessToken", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: true, isNullable: true, isUnique: true),SchemaColumn("refreshToken", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: true, isNullable: true, isUnique: true),SchemaColumn("scope", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: true, isUnique: false),SchemaColumn("issueDate", ManagedPropertyType.datetime, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("expirationDate", ManagedPropertyType.datetime, isPrimaryKey: false, autoincrement: false, isIndexed: true, isNullable: false, isUnique: false),SchemaColumn("type", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: true, isNullable: true, isUnique: false)]));
		database.createTable(SchemaTable("tblCommentActivity", [SchemaColumn("idCommentActivity", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("comment", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("dateCommentActivity", ManagedPropertyType.datetime, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false)]));
		database.createTable(SchemaTable("tblCommentAdvertisement", [SchemaColumn("idCommnetAdvertisement", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("comment", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("dateCommentAdvertisement", ManagedPropertyType.datetime, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false)]));
		database.createTable(SchemaTable("tblDelivery", [SchemaColumn("idDelivery", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("file", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("dateDelivery", ManagedPropertyType.datetime, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false)]));
		database.createTable(SchemaTable("tblSchedule", [SchemaColumn("idSchedule", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false)]));
		database.createTable(SchemaTable("tblUserType", [SchemaColumn("idUserType", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("description", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true)]));
		database.createTable(SchemaTable("tblCourse", [SchemaColumn("idCourse", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("name", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("description", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false)]));
		database.createTable(SchemaTable("tblActivities", [SchemaColumn("idActivity", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("activity", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("description", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("dateActivity", ManagedPropertyType.datetime, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false)]));
		database.createTable(SchemaTable("tblAdvertisement", [SchemaColumn("idAdvertisement", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("notice", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("dateAdvertisement", ManagedPropertyType.datetime, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false)]));
		database.addColumn("tblUsers", SchemaColumn.relationship("idType", ManagedPropertyType.bigInteger, relatedTableName: "tblUserType", relatedColumnName: "idUserType", rule: DeleteRule.nullify, isNullable: true, isUnique: true));
		database.addColumn("_authtoken", SchemaColumn.relationship("resourceOwner", ManagedPropertyType.bigInteger, relatedTableName: "tblUsers", relatedColumnName: "id", rule: DeleteRule.cascade, isNullable: false, isUnique: false));
		database.addColumn("_authtoken", SchemaColumn.relationship("client", ManagedPropertyType.string, relatedTableName: "_authclient", relatedColumnName: "id", rule: DeleteRule.cascade, isNullable: false, isUnique: false));
		database.addColumn("tblCommentActivity", SchemaColumn.relationship("idActivity", ManagedPropertyType.bigInteger, relatedTableName: "tblActivities", relatedColumnName: "idActivity", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("tblCommentActivity", SchemaColumn.relationship("idStudent", ManagedPropertyType.bigInteger, relatedTableName: "tblUsers", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("tblCommentAdvertisement", SchemaColumn.relationship("idAdvertisement", ManagedPropertyType.bigInteger, relatedTableName: "tblAdvertisement", relatedColumnName: "idAdvertisement", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("tblCommentAdvertisement", SchemaColumn.relationship("idStudent", ManagedPropertyType.bigInteger, relatedTableName: "tblUsers", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("tblDelivery", SchemaColumn.relationship("idStudent", ManagedPropertyType.bigInteger, relatedTableName: "tblUsers", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("tblDelivery", SchemaColumn.relationship("idActivity", ManagedPropertyType.bigInteger, relatedTableName: "tblActivities", relatedColumnName: "idActivity", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("tblSchedule", SchemaColumn.relationship("idstudent", ManagedPropertyType.bigInteger, relatedTableName: "tblUsers", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("tblSchedule", SchemaColumn.relationship("idcourse", ManagedPropertyType.bigInteger, relatedTableName: "tblCourse", relatedColumnName: "idCourse", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("tblCourse", SchemaColumn.relationship("idTeacher", ManagedPropertyType.bigInteger, relatedTableName: "tblUsers", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("tblActivities", SchemaColumn.relationship("idCourse", ManagedPropertyType.bigInteger, relatedTableName: "tblCourse", relatedColumnName: "idCourse", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("tblAdvertisement", SchemaColumn.relationship("idCourse", ManagedPropertyType.bigInteger, relatedTableName: "tblCourse", relatedColumnName: "idCourse", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    