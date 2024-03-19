import 'package:shelf/shelf.dart';
import 'package:shelf/src/middleware.dart';
import 'package:shelf_router/shelf_router.dart';
import '../../core/web/controller.dart';
import '../../domain/ports/inputs/user_service.dart';

class UserController extends Controller {
  final UserService _userService;

  UserController(this._userService);

  @override
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    final Router router = Router();

    router.get('/users', (Request res) {});

    return createHandler(
      router: router,
      isSecurity: isSecurity,
      middlewares: middlewares,
    );
  }
}
