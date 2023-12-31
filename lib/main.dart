import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_catalog/bloc/product/create_product/create_product_bloc.dart';
import 'package:flutter_e_catalog/bloc/product/get_all_product/get_all_product_bloc.dart';
import 'package:flutter_e_catalog/bloc/profile/profile_bloc.dart';

import 'package:flutter_e_catalog/bloc/register/register_bloc.dart';
import 'package:flutter_e_catalog/bloc/login/login_bloc.dart';

import 'package:flutter_e_catalog/data/datasources/auth_datasources.dart';
import 'package:flutter_e_catalog/data/datasources/product_datasoureces.dart';
import 'package:flutter_e_catalog/presentation/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(AuthDatasources()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthDatasources()),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(AuthDatasources()),
        ),
        BlocProvider(
          create: (context) => GetAllProductBloc(ProductDatasources()),
        ),
        BlocProvider(
          create: (context) => CreateProductBloc(ProductDatasources()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light(
          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
