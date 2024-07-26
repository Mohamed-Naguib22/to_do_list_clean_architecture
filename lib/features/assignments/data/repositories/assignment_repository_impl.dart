import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:to_do_list_clean_architecture/core/error/failure.dart';
import 'package:to_do_list_clean_architecture/features/assignments/data/data_sources/remote/assignment_remote_data_source.dart';
import 'package:to_do_list_clean_architecture/features/assignments/domain/entities/assignment.dart';
import 'package:to_do_list_clean_architecture/features/assignments/domain/repositories/assignment_repository.dart';

class AssignmentRepositoryImpl implements AssignmentRepository {
  final AssignmentRemoteDataSource assignmentRemoteDataSource;

  AssignmentRepositoryImpl({required this.assignmentRemoteDataSource});

  @override
  Future<Either<Failure, List<Assignment>>> getAllAssignments() async {
      try {
        final response = await assignmentRemoteDataSource.getAllAssignments();
        return right(response);
      }catch(e){
        if (e is DioException) {
          return left(ServerFailure.fromDiorError(e));
        }
        return left(ServerFailure(message: e.toString()));
      }      
  }
}