//import 'dart:js';

import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  Widget build(BuildContext context) {
final bloc = Provider.of(context);

    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) { 
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, dynamic snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.org',
            labelText: 'Email Address',
            errorText: snapshot.error,
          ),
        );
      }
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, dynamic snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'password here',
            labelText: 'Password',
            errorText: snapshot.error, 
          ),
        );
      },
    );
  }
  
  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, dynamic snapshot) {
        return ElevatedButton(
          child: Text('Login'),
          // Color: Colors.blue,
          onPressed: snapshot.hasData == true ? bloc.submit() : null,
        );
      },      
    );    
  }
} 