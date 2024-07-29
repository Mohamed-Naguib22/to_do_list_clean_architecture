import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_clean_architecture/core/utils/enum_states.dart';
import 'package:to_do_list_clean_architecture/features/assignments/domain/use_cases/get_all_assignments_use_case.dart';
import 'package:to_do_list_clean_architecture/features/assignments/presentation/controllers/assignment_states.dart';

class AssignmentCubit extends Cubit<AssignmentState> {
  final GetAllAssignmentsUseCase getAllAssignmentsUseCase;

  AssignmentCubit({required this.getAllAssignmentsUseCase})
      : super(const AssignmentState());

  void getAllAssignments() async {
    try {
      emit(state.copyWith(assignmentState: RequestState.loading));
      final response = await getAllAssignmentsUseCase();
      response.fold(
          (l) => emit(state.copyWith(
              assignmentState: RequestState.error,
              assignmentMessage: l.message)),
          (r) => emit(state.copyWith(
              assignmentState: RequestState.loaded, assignments: r)));
    } catch (_) {}
  }
}
