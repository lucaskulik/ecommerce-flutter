import 'package:ecommerce/providers/user_provider.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> _formKey = new GlobalKey();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    UserProvider _userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      key: _scaffoldState,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.REGISTER);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 18,
              ),
              margin: EdgeInsets.only(
                right: 10,
              ),
              child: Text(
                "CRIAR CONTA",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: Center(
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
                      "Acessar E-commerce",
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
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    RaisedButton(
                      child: Text("ACESSAR"),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _userProvider.login(
                              email: _emailController.value.text,
                              password: _passController.value.text,
                              onError: (erro) {
                                _showError(erro);
                              },
                              onSuccess: (message) {
                                _showSuccess(message);
                                Navigator.of(context).pop();
                              });
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

  _showSuccess(String message) {
    _scaffoldState.currentState.showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(message),
      ),
    );
  }
}
