import 'package:flutter/material.dart';
import 'package:si_bagus/pages/home.dart';
import 'package:si_bagus/pages/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String fullName = "";
  String username = "";
  String password = "";
  bool isLoginSuccess = true;
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 24,
          ),
          child: Column(children: [
            _heading(),
            _nameField(),
            _usernameField(),
            _passwordField(),
            _registerButton(context),
            const Divider(),
            _loginButton(context)
          ]),
        ),
      ),
    );
  }

  Widget _heading() {
    return Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.1, bottom: 4),
        alignment: Alignment.centerLeft,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Register Page",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text(
              "Please enter your credentials.",
              // style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }

  Widget _nameField() {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          fullName = value;
          setState(() {
            if (isError) isError = false;
          });
        },
        decoration: InputDecoration(
            hintText: 'Full Name',
            prefixIcon: Icon(
              Icons.assignment_ind_rounded,
              color: (!isError)
                  ? Colors.black87
                  : Theme.of(context).colorScheme.error,
            ),
            filled: true,
            fillColor: (isError)
                ? Theme.of(context).colorScheme.errorContainer
                : const Color.fromARGB(255, 229, 229, 229),
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: (!isError)
                        ? Colors.transparent
                        : Theme.of(context).colorScheme.error)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: (!isError)
                        ? Colors.transparent
                        : Theme.of(context).colorScheme.error))),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
          setState(() {
            if (isError) isError = false;
          });
        },
        decoration: InputDecoration(
            hintText: 'Username',
            prefixIcon: Icon(
              Icons.person,
              color: (!isError)
                  ? Colors.black87
                  : Theme.of(context).colorScheme.error,
            ),
            filled: true,
            fillColor: (isError)
                ? Theme.of(context).colorScheme.errorContainer
                : const Color.fromARGB(255, 229, 229, 229),
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: (!isError)
                        ? Colors.transparent
                        : Theme.of(context).colorScheme.error)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: (!isError)
                        ? Colors.transparent
                        : Theme.of(context).colorScheme.error))),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          password = value;
          setState(() {
            if (isError) isError = false;
          });
        },
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          prefixIcon: Icon(
            Icons.key,
            color: (!isError)
                ? Colors.black87
                : Theme.of(context).colorScheme.error,
          ),
          filled: true,
          fillColor: (isError)
              ? Theme.of(context).colorScheme.errorContainer
              : const Color.fromARGB(255, 229, 229, 229),
          contentPadding: const EdgeInsets.all(12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (!isError)
                      ? Colors.transparent
                      : Theme.of(context).colorScheme.error)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (!isError)
                      ? Colors.transparent
                      : Theme.of(context).colorScheme.error)),
        ),
      ),
    );
  }

  Widget _registerButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 14, bottom: 6),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor:
                Theme.of(context).colorScheme.onPrimary, // foreground
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
        onPressed: () {
          String text = "";
          if (username == "mrafliy" && password == "12345") {
            setState(() {
              text = "Login Success";
              isError = false;
            });
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(username: username)),
            );
          } else {
            setState(() {
              text = "Login Failed";
              isError = true;
            });
          }

          SnackBar snackBar = SnackBar(
            content: Text(text),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Register'),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Already have an account?",
          ),
          Container(
            margin: const EdgeInsets.only(top: 6),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide(
                            color: Color.fromARGB(84, 0, 0, 0), width: 1.5))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text('Login'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
