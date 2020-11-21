import 'package:flutter/material.dart';

class UserMenuItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const UserMenuItem({Key key, this.label, this.icon, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double shortSide = size.shortestSide;
    double margin = shortSide > 600 ? size.width * 0.20 : 0;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Icon(
                      icon,
                      color: Colors.grey[500],
                    ),
                    Center(
                      child: Text(
                        label,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              onTap: this.onPressed),
          const Divider(
            height: 0,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
