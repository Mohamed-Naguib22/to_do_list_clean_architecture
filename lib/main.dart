import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_clean_architecture/app/di/injector.dart';
import 'package:to_do_list_clean_architecture/features/assignments/presentation/controllers/assignment_cubit.dart';
import 'package:to_do_list_clean_architecture/features/assignments/presentation/screens/assignment_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AssignmentCubit>(
          create: (context) => sl<AssignmentCubit>(),
        )
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: AssignmentScreen(),
      ),
    );
  }
}
