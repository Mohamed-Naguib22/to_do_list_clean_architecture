import 'package:dartz/dartz.dart';
import 'package:to_do_list_clean_architecture/core/error/failure.dart';
import 'package:to_do_list_clean_architecture/features/assignments/domain/entities/assignment.dart';
import 'package:to_do_list_clean_architecture/features/assignments/domain/repositories/assignment_repository.dart';

class GetAllAssignmentsUseCase {
  final AssignmentRepository repository;

  GetAllAssignmentsUseCase({required this.repository});

  Future<Either<Failure, List<Assignment>>> call() async {
    return await repository.getAllAssignments();
  }
}