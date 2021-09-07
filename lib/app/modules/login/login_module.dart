import 'package:modular1/app/modules/login/login_Page.dart';
import 'package:modular1/app/modules/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular1/app/modules/login/repositories/login_repository.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore(i())),
    Bind.singleton((i) => LoginRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
  ];
}
