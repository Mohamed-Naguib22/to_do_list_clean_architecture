import 'package:to_do_list_clean_architecture/core/network/api_client.dart';
import 'package:to_do_list_clean_architecture/core/utils/constants.dart';
import 'package:to_do_list_clean_architecture/features/assignments/data/data_sources/remote/assignment_remote_data_source.dart';
import 'package:to_do_list_clean_architecture/features/assignments/data/models/assignment_model.dart';

class AssignmentRemoteDataSourceImpl implements AssignmentRemoteDataSource {
  final ApiClient apiClient;

  AssignmentRemoteDataSourceImpl({required this.apiClient});
 
  @override
  Future<List<AssignmentModel>> getAllAssignments() async {
    final result = await apiClient.get(Constants.GET_ALL_ASSIGNMENTS_EP);
    return List<AssignmentModel>.from(
      (result.data as List).map((e) => AssignmentModel.fromJson(e))
    );
  }
}