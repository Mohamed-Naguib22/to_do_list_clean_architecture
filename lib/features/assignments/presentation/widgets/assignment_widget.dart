import 'package:flutter/material.dart';
import 'package:to_do_list_clean_architecture/features/assignments/domain/entities/assignment.dart';

class AssignmentWidget extends StatelessWidget {
  final Assignment assignment;
  const AssignmentWidget({super.key, required this.assignment});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(assignment.name),
      subtitle: Text(assignment.description),
      // trailing: Text(assignment),
    );
  }
}