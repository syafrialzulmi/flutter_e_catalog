import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_e_catalog/bloc/register/register_bloc.dart';

import 'package:flutter_e_catalog/data/datasources/auth_datasources.dart';

import 'package:flutter_e_catalog/presentation/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(AuthDatasources()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light(
          useMaterial3: true,
        ),
        home: const RegisterPage(),
      ),
    );
  }
}
