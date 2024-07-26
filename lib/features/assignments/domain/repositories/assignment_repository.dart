import 'package:dartz/dartz.dart';
import 'package:to_do_list_clean_architecture/core/error/failure.dart';
import 'package:to_do_list_clean_architecture/features/assignments/domain/entities/assignment.dart';

abstract class AssignmentRepository {
  Future<Either<Failure, List<Assignment>>> getAllAssignments();
}