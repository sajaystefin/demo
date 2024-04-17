import 'package:demo/home.dart';
import 'package:demo/user.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  User user = User();
  @override
  void initState() {
    super.initState();
  }

  onSubmitPressed() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomeView(user: user)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Text('LOGIN'),
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Username'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    user.name = newValue;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    user.password = newValue;
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: onSubmitPressed,
                  child: Text('Login'),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
