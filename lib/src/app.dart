import'package:flutter/material.dart';
import '../src/screens/login_screen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        home: Scaffold(
          body: LoginScreen(),
          appBar: AppBar(
            title: const Text('Log me in'),
          ),
        ),
      ),   
    );    
  }
}