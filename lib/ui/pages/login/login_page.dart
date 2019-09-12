import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter/bloc/auth.dart';
import 'package:starter/constants/routes.dart';
import 'package:starter/model/api_error.dart';

// Create a Form widget.
class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class LoginPageState extends State<LoginPage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthBloc>(builder: (context, logic, _) {
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Text(
                      '欢迎回来',
                      style: Theme.of(context).textTheme.title,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: '手机号',
                      ),
                      validator: (value) {
                        logic.phone = value;
                        if (value.isEmpty) {
                          return '请输入手机号';
                        }
                        return null;
                      },
                      onFieldSubmitted: (phone) => logic.phone = phone,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: '密码',
                      ),
                      validator: (value) {
                        logic.password = value;
                        if (value.isEmpty) {
                          return '请输入密码';
                        }
                        return null;
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ));
      }),
      floatingActionButton: Consumer<AuthBloc>(builder: (context, logic, _) {
        return FloatingActionButton(
          child: Icon(Icons.arrow_forward),
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              try {
                await logic.login();
              } catch (e) {
                if (e is APIError) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text(e.message)));
                }
                return;
              }
              Navigator.of(context).pushReplacementNamed(MAIN_PAGE);
            }
          },
        );
      }),
    );
  }
}
