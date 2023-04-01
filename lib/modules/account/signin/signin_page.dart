import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff091132),
              Color(0xff806000),
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 100),
                child: Text(
                  'Inicio de sesión',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 37,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 50, right: 50, bottom: 20),
                child: TextFieldSignIn(
                  labelText: 'Usuario',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 50, right: 50, bottom: 20),
                child: TextFieldSignIn(
                  labelText: 'Contraseña',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
                child: MaterialButton(
                  padding: const EdgeInsets.all(18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  color: const Color(0xFF0A548F),
                  minWidth: double.infinity,
                  onPressed: () {},
                  child: const Text(
                    'Ingresar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "No tienes cuenta?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Crear una aquí",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldSignIn extends StatelessWidget {
  final String labelText;
  const TextFieldSignIn({
    required this.labelText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.white,
            ),
          ),
          focusColor: Colors.white,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.white,
          )),
    );
  }
}
