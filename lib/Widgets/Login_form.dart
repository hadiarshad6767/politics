import 'package:flutter/material.dart';
import 'package:qamar_zaman_kaira/Widgets/textfeild.dart';

class LogInForm extends StatefulWidget {
  final Key? key1;
  final TextEditingController? controllerUsername;
  final TextEditingController? controllerPassword;
  const LogInForm(
      {Key? key, this.controllerUsername, this.controllerPassword, this.key1})
      : super(key: key);

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _usernameFieldKey = GlobalKey<FormFieldState<String>>();
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.key1,
        child: Column(
          children: [
            TextFieldF(
                iconI: Icons.person,
                fieldKey: _usernameFieldKey,
                // helperText: '',
                labelText: 'Username ',
                controller: widget.controllerUsername,
                obscuretext: false,
                icon: false,
                ForgetlabelText: 'Forget Username?',
                //onSaved: (input) => _username = input,
                validator: (input) {
                  if (input == null || input.contains('@') || input.isEmpty) {
                    return 'Invalid Username';
                  } else {
                    return null;
                  }
                }),
            TextFieldF(
                iconI: Icons.password,
                fieldKey: _passwordFieldKey,
                // helperText: '',
                labelText: 'Password ',
                controller: widget.controllerPassword,
                obscuretext: true,
                icon: true,
                ForgetlabelText: 'Forget Password?',
                //onSaved: (input) => _username = input,
                validator: (input) {
                  if (input == null || input.length <= 3 || input.isEmpty) {
                    return 'Invalid Password';
                  } else {
                    return null;
                  }
                }),
          ],
        ));
  }
}
