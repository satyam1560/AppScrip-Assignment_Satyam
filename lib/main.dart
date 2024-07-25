import 'package:flutter/material.dart';
import 'package:satyam_assignment/injectible.dart';

import 'src/features/users/presentation/pages/post_page.dart';

void main() {
  configureDependencies();
  // getIt<Dio>().interceptors.addAll([]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostsScreen(),
    );
  }
}
