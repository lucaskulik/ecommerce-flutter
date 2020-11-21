import 'package:ecommerce/providers/user_provider.dart';
import 'package:ecommerce/utils/routes.dart';
import 'package:ecommerce/widgets/user/user_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserProvider _userProvider = Provider.of<UserProvider>(context);

    if (_userProvider.isLogado) {
      return Container(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Text(
              "Bem Vindo(a)",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${_userProvider.user.firstName} ${_userProvider.user.lastName}",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.grey[800],
              ),
            ),
            Text(
              _userProvider.user.email,
              style: TextStyle(
                fontSize: 12,
                // fontWeight: FontWeight.w700,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                color: Colors.grey[200],
                child: Column(
                  children: [
                    UserMenuItem(
                      onPressed: _userProvider.signOut,
                      label: "Sair",
                      icon: Icons.exit_to_app,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.LOGIN);
        },
        child: Text("LOGIN"),
      ),
    );
  }
}
