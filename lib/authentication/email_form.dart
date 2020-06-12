import 'package:flutter/material.dart';
import 'package:time_tracker/authentication/auth.dart';
import 'package:time_tracker/common_widgets/form_submit_button.dart';

enum EmailSignInFormType { signIn, Register }

class EmailSignInForm extends StatefulWidget {
  EmailSignInForm({@required this.auth});
  final AuthBase auth;
  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  EmailSignInFormType _formType = EmailSignInFormType.signIn;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
 final FocusNode _emailFocusNode = FocusNode();
 final FocusNode _passwordFocusNode = FocusNode();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  void _submit() async {
    try {
      if (_formType == EmailSignInFormType.signIn) {
        await widget.auth.signInWithEmail(_email, _password);
      } else {
        await widget.auth.createUserWithEmail(_email, _password);
      }
      Navigator.of(context).pop();
    } catch (e) {
      print(e.toString());
    }
  }

  void _toggleFormType() {
    setState(() {
      _formType = _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.Register
          : EmailSignInFormType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  List<Widget> _buildChildren() {
    final primaryText = _formType == EmailSignInFormType.signIn
        ? 'Sign In '
        : 'Create an Account';
    final secondaryText = _formType == EmailSignInFormType.signIn
        ? 'Need an account ? Register '
        : 'Have an account ? Sign In';


    bool submitEnabled = _email.isNotEmpty && _password.isNotEmpty;
    return [
      _buildEmailTextField(),
      SizedBox(height: 8.0),
      _buildPasswordTextField(),
      SizedBox(height: 8.0),
      FormSubmitButton(
        text: primaryText,
        onPressed:submitEnabled ? _submit : null,
      ),
      FlatButton(
        child: Text(secondaryText),
         onPressed: _toggleFormType,
      )
    ];
  }

  TextField _buildEmailTextField() {
    return TextField(
      focusNode: _emailFocusNode,
      onEditingComplete: _emailEditingComplete,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      autocorrect: false,
      decoration:
          InputDecoration(labelText: 'Email', hintText: 'test@test.com'),
      onChanged: (email) => _updateState(),
    );

  }

  TextField _buildPasswordTextField() {
    return TextField(
      onEditingComplete: _submit,
      focusNode: _passwordFocusNode,
      controller: _passwordController,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: 'Password',
      ),
      obscureText: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }

  void _emailEditingComplete() {
    FocusScope.of(context).requestFocus(_passwordFocusNode);

  }

  _updateState() {
    setState(() {
      
    });
  }
}
