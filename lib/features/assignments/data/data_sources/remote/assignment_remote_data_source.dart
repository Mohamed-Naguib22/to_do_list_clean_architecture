import 'package:to_do_list_clean_architecture/features/assignments/data/models/assignment_model.dart';

abstract class AssignmentRemoteDataSource {
  Future<List<AssignmentModel>> getAllAssignments();
}