import 'package:flutter/material.dart';
import 'app_route.dart';

class LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _userName;
  String _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter App Login Page'),
      ),
      body: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            onChanged: () {
              print('onChanged');
            },
            child: new Column(
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: '用户名：'
                  ),
                  onSaved: (value) => this._userName = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '请输入用户名';
                    }
                    if (value.length < 4) {
                      return '用户名最少6个字符';
                    }
                    return null;
                  }
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: '密码：',
                  ),
                  onSaved: (value) => this._password = value,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '请输入密码';
                    }
                    if (value.length > 18 || value.length < 6) {
                      return '密码长度在6-18个字符之间';
                    }
                    return null;
                  }
                ),
                new Row(
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        _formKey.currentState.reset();
                        _showMessage('用户密码已重置');
                      },
                      child: Text('重置'),
                    ),
                    MaterialButton(
                      onPressed: _onSubmit,
                      child: Text('登录'),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // 提示框
  void _showMessage(String value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: Text('提示'),
          content: Text('$value'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                _formKey.currentState.reset();
                Navigator.pop(context);
              },
              child: Text('确定'),
            )
          ],
        );
      }
    );
  }

  // 提交
  void _onSubmit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      if (_password == "123456") {
        var bodyJson = '{"name" : "$_userName", "password" : "$_password"}';
        router.navigateTo(context, 'home/$bodyJson');
      } else {
        _showMessage('密码错误，请重新输入');
      }
    }
  }

}

class LoginPage extends StatefulWidget {
  @override
  createState() => new LoginPageState();
}