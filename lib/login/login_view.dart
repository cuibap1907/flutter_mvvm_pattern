import 'package:flutter/material.dart';
import 'login_viewmodel.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: BodyWidget(),
    );
  }
}

class BodyWidget extends StatefulWidget {
  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginViewModel = LoginViewModel();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      loginViewModel.emailSink.add(emailController.text);
    });
    passwordController.addListener(() {
      loginViewModel.emailSink.add(passwordController.text);
    });
  }

  @override
  void dispose() {
    loginViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder<String>(
              stream: loginViewModel.emailStream,
              builder: (context, snapshot) {
                return TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: "example@gmail.com",
                      errorText: snapshot.data,
                      labelText: "Email *"),
                );
              }),
          SizedBox(
            height: 20,
          ),
          StreamBuilder<String>(
              stream: loginViewModel.passStream,
              builder: (context, snapshot) {
                return TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    errorText: snapshot.data,
                      icon: Icon(Icons.lock), labelText: "Password *"),
                );
              }),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 200,
            height: 45,
            child: StreamBuilder<bool>(
              stream: loginViewModel.btnStream,
              builder: (context, snapshot) {
                return RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: snapshot.data == true? () {
                  }: null,
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
