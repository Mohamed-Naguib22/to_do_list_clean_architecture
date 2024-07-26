import 'package:equatable/equatable.dart';
import 'package:to_do_list_clean_architecture/core/utils/enum_states.dart';
import 'package:to_do_list_clean_architecture/features/assignments/domain/entities/assignment.dart';

class AssignmentState extends Equatable {
  final RequestState assignmentState;
  final List<Assignment> assignments;
  final String assignmentMessage;

  const AssignmentState({
    this.assignmentState = RequestState.loading,
    this.assignments = const [],
    this.assignmentMessage = "",
  });

  AssignmentState copyWith({
    RequestState? assignmentState,
    List<Assignment>? assignments,
    String? assignmentMessage,
  }) {
    return AssignmentState(
      assignmentState: assignmentState ?? this.assignmentState,
      assignments: assignments ?? this.assignments,
      assignmentMessage: assignmentMessage ?? this.assignmentMessage,
    );
  }

  @override
  List<Object> get props =>
  [
    assignmentState,
    assignments,
    assignmentMessage,
  ];
}
