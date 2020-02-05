import 'package:flutter_web_mobile/app/modules/auth/register/register_controller.dart';
import 'package:flutter_web_mobile/app/modules/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_mobile/app/modules/auth/auth_page.dart';
import 'package:flutter_web_mobile/app/modules/auth/register/register_page.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RegisterController()),
        Bind((i) => AuthController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AuthPage()),
        Router('/register', child: (_, args) => RegisterPage()),
      ];

  static Inject get to => Inject<AuthModule>.of();
}
