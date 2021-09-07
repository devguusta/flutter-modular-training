import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular1/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:modular1/app/shared/utils/text_validator.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'Modular and Api'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ModularState<LoginPage, LoginStore> {
  final LoginStore store = Modular.get();
  final _formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Observer(
          builder: (_) {
            return Column(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (String? value) =>
                              Validators().validateName(value!),
                          onChanged: (String value) => store.setUserName(value),
                          controller: userController,
                          decoration: InputDecoration(
                            hintText: "Informe seu userName",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (String value) => store.setName(value),
                          validator: (String? value) =>
                              Validators().validateName(value!),
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: "Informe seu nome",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (String? value) =>
                              Validators.validateEmail(value),
                          onChanged: (String value) {
                          
                            store.setEmail(value);
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Informe seu email",
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (_formKey.currentState!.validate()) {
                              store
                                  .login(
                                      name: store.name,
                                      email: store.email,
                                      userName: store.userName)
                                  .then((value) => {
                                        if (value)
                                          Modular.to
                                              .pushReplacementNamed('/home'),
                                      });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Erro ao logar!")));
                            }
                          },
                          child: Text("Login"))
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
