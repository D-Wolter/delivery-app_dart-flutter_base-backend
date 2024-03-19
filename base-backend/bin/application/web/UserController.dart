import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf/src/middleware.dart';
import 'package:shelf_router/shelf_router.dart';
import '../../core/web/controller.dart';
import '../../domain/models/user.dart';
import '../../domain/ports/inputs/user_service.dart';
import '../dtos/user_dto.dart';

class UserController extends Controller {
  final UserService _userService;

  UserController(this._userService);

  @override
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    final Router router = Router();

    router.get('/users', (Request res) async {
      List<User> users = await _userService.getAllUsers();
      List<Map> usersJsonMap =
          users.map((User user) => UserDto.toJson(user)).toList();
      return Response.ok(
        jsonEncode(usersJsonMap),
        headers: {'content-type': 'application/json'},
      );
    });

    return createHandler(
      router: router,
      isSecurity: isSecurity,
      middlewares: middlewares,
    );
  }
}
