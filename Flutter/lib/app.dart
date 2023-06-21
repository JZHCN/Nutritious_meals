import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'router/index.dart';
import 'pages/home/index.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppState();

}

class _AppState extends State<App> {


  @override
  Widget build(BuildContext context) {
    // 路由
    FluroRouter router = FluroRouter();
    Routes.configureRoutes(router);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '校园营养餐',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
      // initialRoute: Routes.loading,
      onGenerateRoute: router.generator,
    );
  }
}