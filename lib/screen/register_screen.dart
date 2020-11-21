import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/providers/user_provider.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  GlobalKey<FormState> _formKey = new GlobalKey();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey();

  UserModel userModel = new UserModel();

  @override
  Widget build(BuildContext context) {
    UserProvider _userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      key: _scaffoldState,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("Registro"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Card(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Registrar-se",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Nome"),
                        keyboardType: TextInputType.name,
                        validator: (name) {
                          if (name.isEmpty) {
                            return "Campo Obrigatório!";
                          }

                          return null;
                        },
                        onSaved: (name) {
                          userModel.firstName = name;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Sobrenome"),
                        keyboardType: TextInputType.name,
                        validator: (name) {
                          if (name.isEmpty) {
                            return "Campo Obrigatório!";
                          }

                          return null;
                        },
                        onSaved: (name) {
                          userModel.lastName = name;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: "meuemail@email.com",
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          RegExp _regex = new RegExp(Constants.REGEX_EMAIL);

                          if (email.isEmpty || !_regex.hasMatch(email))
                            return "E-mail inválido";

                          return null;
                        },
                        onSaved: (value) {
                          userModel.email = value;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: _passController,
                        decoration: InputDecoration(
                          hintText: "*****",
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        validator: (pass) {
                          if (pass.isEmpty) {
                            return "Senha inválida!";
                          }

                          return null;
                        },
                        onSaved: (value) {
                          userModel.password = value;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      RaisedButton(
                        child: Text("REGISTRAR"),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            _userProvider.register(
                              userModel,
                              onFail: (erro) {
                                _showError(erro);
                              },
                              onSuccess: () {
                                // print("Cadastro Realizado com Sucesso");
                                // _showSuccess(message);
                                Navigator.of(context).pop();
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _showError(String message) {
    _scaffoldState.currentState.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Container(color: Colors.red, child: Text(message)),
      ),
    );
  }
}
