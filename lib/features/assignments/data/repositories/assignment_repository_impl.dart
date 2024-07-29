import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:to_do_list_clean_architecture/core/error/failure.dart';
import 'package:to_do_list_clean_architecture/core/network/network_connection.dart';
import 'package:to_do_list_clean_architecture/features/assignments/data/data_sources/remote/assignment_remote_data_source.dart';
import 'package:to_do_list_clean_architecture/features/assignments/domain/entities/assignment.dart';
import 'package:to_do_list_clean_architecture/features/assignments/domain/repositories/assignment_repository.dart';

class AssignmentRepositoryImpl implements AssignmentRepository {
  final AssignmentRemoteDataSource remoteDataSource;
  final NetworkConnection networkConnection;

  AssignmentRepositoryImpl({
    required this.networkConnection,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Assignment>>> getAllAssignments() async {
    if (await networkConnection.isConnected) {
      try {
        final response = await remoteDataSource.getAllAssignments();
        return right(response);
      } catch (e) {
        if (e is DioException) {
          return left(ServerFailure.fromDiorError(e));
        }
        return left(ServerFailure(message: e.toString()));
      }
    } else {
      return left(const ServerFailure(message: 'No Internet connection!'));
    }
  }
}
