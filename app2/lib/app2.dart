import 'package:app2/config/di/di.dart';
import 'package:common/bloc/list_page/list_page_cubit.dart';
import 'package:common/pages/list_page/list_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListPage.create(
        locator<ListPageCubit>(),
      ),
    );
  }
}
