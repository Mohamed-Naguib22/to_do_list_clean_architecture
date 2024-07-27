import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_clean_architecture/core/utils/enum_states.dart';
import 'package:to_do_list_clean_architecture/features/assignments/presentation/controllers/assignment_cubit.dart';
import 'package:to_do_list_clean_architecture/features/assignments/presentation/controllers/assignment_states.dart';
import 'package:to_do_list_clean_architecture/features/assignments/presentation/widgets/assignment_widget.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AssignmentCubit, AssignmentState>(
        builder: (context, state) {
          switch (state.assignmentState) {
            case RequestState.loading:
              return const CircularProgressIndicator();

            case RequestState.loaded:
              return CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return AssignmentWidget(
                        assignment: state.assignments[index],
                      );
                    }, childCount: state.assignments.length),
                  ),
                ],
              );

            case RequestState.error:
              return Text(state.assignmentMessage);
          }
        },
      ),
    );
  }
}
