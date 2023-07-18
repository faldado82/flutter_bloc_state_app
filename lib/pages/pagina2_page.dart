import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_app/bloc/user/user_bloc.dart';
import 'package:flutter_bloc_state_app/models/user.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              color: Colors.blue,
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
              onPressed: () {
                final newUser =
                    User(nombre: 'Francisco', edad: 41, profesiones: ['Mobile Developer']);
                // utilizamos el BlocProvider y la clase UserBloc
                // y hacemos el add del evento ActivateUserEvent
                // y le mandamos el newUser creado previamente
                // BlocProvider.of<UserBloc>(context, listen: false).add(ActivateUserEvent(newUser));
                userBloc.add(ActivateUserEvent(newUser));
              }),
          MaterialButton(
              color: Colors.blue,
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              onPressed: () => userBloc.add(ChangeUserAgeEvent(25))),
          MaterialButton(
              color: Colors.blue,
              child: const Text('Añadir Profesion', style: TextStyle(color: Colors.white)),
              onPressed: () {
                userBloc.add(AddProfessionEvent('Nueva Profesion'));
              }),
        ],
      )),
    );
  }
}
