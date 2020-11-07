import 'package:ecommerce/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  UserModel _currentUser;

  Future<void> login(
      {String email,
      String password,
      Function onSuccess,
      Function onError}) async {
    try {
      final UserCredential userCredential = await auth
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential?.user != null) {
        _currentUser = new UserModel(
            id: userCredential.user.uid, email: userCredential.user.email);
        print("Usuário Logado ${_currentUser.id}");
        onSuccess("Usuário Logado ${_currentUser.id}");
      }
    } on FirebaseException catch (e) {
      onError("Erro ao logar");
    }
  }
}
