import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter/bloc/api.dart';
import 'package:starter/bloc/auth.dart';
import 'package:starter/model/api_error.dart';
import 'package:starter/route/routes.dart';

// Create a corresponding State class.
// This class holds data related to the form.
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ProxyProvider<APIProvider, AuthBloc>(
            builder: (context, api, previous) =>
                (previous ?? AuthBloc())..api = api)
      ],
      child: Scaffold(
        body: Consumer<AuthBloc>(builder: (context, logic, _) {
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: SafeArea(
                child: Form(
                  key: logic.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Spacer(),
                      Text(
                        '欢迎回来',
                        style: Theme.of(context).textTheme.title,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
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
              if (logic.formKey.currentState.validate()) {
                var errorMsg;
                try {
                  errorMsg = await logic.login();
                } catch (e) {
                  print(e);
                  if (e is APIError) {
                    errorMsg = e.message;
                  }
                }

                if (errorMsg != null) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text(errorMsg)));
                  return;
                }

                Navigator.of(context).pushReplacementNamed(MAIN_PAGE);
              }
            },
          );
        }),
      ),
    );
  }
}
