import 'dart:io';
import 'package:coolmovies/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  ValueNotifier<GraphQLClient> client = await setupGraphQl();
  runApp(
    GraphQLProvider(
      client: client,
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cool Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                  color: Colors.white
              )
          ),
          iconTheme: const IconThemeData(
              color: Colors.white
          )
      ),
      home: const HomeScreen(),
    );
  }
}

Future<ValueNotifier<GraphQLClient>> setupGraphQl() async {
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(
    Platform.isAndroid
        ? 'http://10.0.2.2:5001/graphql'
        : 'http://localhost:5001/graphql',
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );
  return client;
}
