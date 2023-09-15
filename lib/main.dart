import 'package:fininfocom/view/homeView.dart';
import 'package:fininfocom/viewModel/dog_viewmodel.dart';
import 'package:fininfocom/viewModel/user_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DogViewModel>(create: (_) => DogViewModel()),
        ChangeNotifierProvider<UserViewModel>(create: (_) => UserViewModel()),
      ],
      // create: (_) => DogViewModel(),
      child: MaterialApp(
        title: 'Fininfocom Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}
