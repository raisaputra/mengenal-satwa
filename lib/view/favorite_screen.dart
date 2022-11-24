import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Favorite Animals",
                style: TextStyle(color: Color.fromARGB(255, 34, 34, 34))),
            iconTheme: const IconThemeData(
              color: Color.fromARGB(255, 34, 34, 34), //change your color here
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(48.0),
              child: Column(
                children: const [
                  FaIcon(FontAwesomeIcons.faceFrown, size: 48),
                  SizedBox(height: 8.0),
                  Text("Favorite Empty"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
