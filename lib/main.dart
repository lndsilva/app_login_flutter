import 'package:flutter/material.dart';

void main() => runApp(MyLoginApp());

class MyLoginApp extends StatefulWidget {
  MyLoginApp({Key? key}) : super(key: key);

  @override
  _MyLoginApp createState() => _MyLoginApp();
}

class LoginData {
  String username = "";
  String password = "";
}

class _MyLoginApp extends State {
  LoginData _loginData = new LoginData();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(50.0),
          child: Form(
            key: this._formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? invalue) {
                    if (invalue!.length == 0) {
                      return "Por favor entre com usuário";
                    }
                    return null;
                  },
                  onSaved: (String? invalue) {
                    this._loginData.username = invalue!;
                  },
                  decoration: InputDecoration(
                      hintText: "none@none.com",
                      labelText: "Usuário (endereço de e-mail)"),
                ),
                TextFormField(
                    obscureText: true,
                    validator: (String? invalue) {
                      if (invalue!.length < 10) {
                        return "A senha tem mais de 10 caracteres";
                      }
                      return null;
                    },
                    onSaved: (String? invalue) {
                      this._loginData.password = invalue!;
                    },
                    decoration:
                        InputDecoration(hintText: "Senha", labelText: "Senha")),
                RaisedButton(
                  child: Text("Entrar"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print("Usuário: ${_loginData.username}");
                      print("Senha: ${_loginData.password}");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
