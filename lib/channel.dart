import 'package:apimoviles/model/Users.dart';
import 'package:aqueduct/aqueduct.dart';

import 'apimoviles.dart';
import 'package:apimoviles/controller/ActivitiesController.dart';
import 'package:apimoviles/controller/AdvertisementController.dart';
import 'package:apimoviles/controller/CommentActivityController.dart';
import 'package:apimoviles/controller/CommentAdvertisementController.dart';
import 'package:apimoviles/controller/CourseController.dart';
import 'package:apimoviles/controller/DeliveryController.dart';
import 'package:apimoviles/controller/ScheduleController.dart';
import 'package:apimoviles/controller/UsersContoller.dart';
import 'package:aqueduct/managed_auth.dart';
import 'package:apimoviles/controller/UserTypeController.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class ApimovilesChannel extends ApplicationChannel {
  
  ManagedContext context;
  AuthServer authServer;
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistenStore = PostgreSQLPersistentStore.fromConnectionInfo("postgres", "p31n3t1n", "127.0.0.1", 5433, "classroom_moviles");
    context = ManagedContext(dataModel,persistenStore);

    final authStorage = ManagedAuthDelegate<Users>(context);
    authServer = AuthServer(authStorage);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    /*router
      .route("/example")
      .linkFunction((request) async {
        return Response.ok({"key": "value"});
      });*/
      router.route('/auth/token').link(() => AuthController(authServer));

      router.route("/activities[/:idActivity]").link(()=>ActivitiesController(context));
      router.route("/advertisement[/:idAdvertisement]").link(()=>AdvertisementController(context));
      router.route("/commentactivity[/:idCommentActivity]").link(()=>CommentActivityController(context));
      router.route("/commentadvertisement[/:idCommentAdvertisement]").link(()=>CommentAdvertisementController(context));
      
      router.route("/course[/:idCourse]")
      .link(() => Authorizer.bearer(authServer))
      .link(()=>CourseController(context));
      
      router.route("/delivery[/:idDelivery]").link(()=>DeliveryController(context));
      router.route("/schedule[/:idSchedule]").link(()=>ScheduleController(context));
      router.route("/usertype[/ :idUserType]").link(()=>UserTypeController(context));
      router.route("/user[/:idUser/:password]").link(()=>UsersController(context,authServer));

    return router;
  }
}