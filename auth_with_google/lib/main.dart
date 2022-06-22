import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
  runApp(SignInHome());
}

class SignInHome extends StatefulWidget {
  const SignInHome({Key? key}) : super(key: key);

  @override
  State<SignInHome> createState() => _SignInHomeState();
}

class _SignInHomeState extends State<SignInHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('SigIn')),
        body: SignIn(),
      ),
    );
  }
}

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  void login(user, pass) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: user.toString(), password: pass.toString());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextFormField(
            controller: controller1,
          ),
          TextFormField(
            controller: controller2,
            obscureText: true,
          ),
          TextButton(
            child: Text('Login'),
            onPressed: () => login(controller1.text, controller2.text),
          ),
          TextButton(
            child: Text('Sign Up'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUp(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  void register(user, pass) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.toString(),
        password: pass.toString(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Sign Up')),
        body: Container(
          child: Column(
            children: [
              TextFormField(
                controller: controller1,
              ),
              TextFormField(
                controller: controller2,
                obscureText: true,
              ),
              TextButton(
                child: Text('Login'),
                onPressed: () => register(controller1.text, controller2.text),
              ),
              TextButton(
                child: Text('Sign Up'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInHome(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
