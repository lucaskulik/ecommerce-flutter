import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  UserModel _currentUser;

  UserProvider() {
    loadCurrentUser();
  }

  Future<void> loadCurrentUser() async {
    User user = await auth.currentUser;

    try {
      if (user != null) {
        DocumentSnapshot document = await _userDocument(user.uid);

        if (!document.exists) {
          signOut();
          return;
        }

        _currentUser = UserModel.fromDocument(document);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }

    notifyListeners();
  }

  Future<void> login(
      {String email,
      String password,
      Function onSuccess,
      Function onError}) async {
    try {
      final UserCredential userCredential = await auth
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential?.user != null) {
        _currentUser = UserModel.fromDocument(
            await _userDocument(userCredential.user.uid));

        print("Usuário Logado ${_currentUser.id}");
        onSuccess("Usuário Logado ${_currentUser.id}");
      }
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      print(e.message);
      onError(handlerError(e.code));
    }
  }

  Future<void> register(UserModel userModel,
      {Function onSuccess, Function onFail}) async {
    try {
      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
              email: userModel.email, password: userModel.password);

      userModel.id = userCredential.user.uid;

      await _firestore.doc(userModel.id).set(userModel.toMap());

      print(userCredential.user.uid);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onFail(handlerError(e.code));
    }
  }

  void signOut() {
    auth.signOut();
    _currentUser = null;
    notifyListeners();
  }

  Future<DocumentSnapshot> _userDocument(String uid) async {
    return await _firestore.doc(uid).get();
  }

  handlerError(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return "E-mail inválido";
      case 'email-already-in-use':
      case 'email-already-exists':
        return "Já existe um usuário com esse e-mail";
      case 'id-token-expired':
        return "Seu token de acesso expirou";
      case 'wrong-password':
        return "Senha inválida";
      default:
        return "Não foi possível fazer o login, tente novamente.";
    }
  }

  CollectionReference get _firestore => _firebaseFirestore.collection("users");

  UserModel get user => _currentUser;

  bool get isLogado => _currentUser != null;
}
