import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular1/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'Modular and Api'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}
class LoginPageState extends State<LoginPage> {
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
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: userController,
                    decoration: InputDecoration(
                      hintText: "Informe seu userName",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Informe seu nome",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Informe seu email",
                    ),
                  ),
                ),
                ElevatedButton(onPressed: (){
                FocusScopeNode currentFocus = FocusScope.of(context);
                if(_formKey.currentState!.validate()){
                  bool isCorrect = true;
                  if(!currentFocus.hasPrimaryFocus){
                    currentFocus.unfocus();
                  }
                   if(isCorrect){
                     Modular.to.pushReplacementNamed('/home');
                   }
                }
               
                }, child: Text("Login"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}