import 'package:flutter/material.dart';
import 'package:mengenal_satwa/view/main_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/cover.jpg',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 378,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 38, horizontal: 40),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.contain,
                        height: 32,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "Learn all you wanted to know about animals",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color.fromARGB(255, 34, 34, 34),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "Discover the strongest, smartest, and fastest animals in the world",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Color.fromARGB(255, 34, 34, 34),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MainScreen();
                          }));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 34, 34, 34),
                            border: Border.all(
                              color: Color.fromARGB(255, 34, 34, 34),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Discover Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
