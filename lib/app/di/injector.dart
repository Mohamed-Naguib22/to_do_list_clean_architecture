import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_list_clean_architecture/core/network/api_client.dart';
import 'package:to_do_list_clean_architecture/core/network/api_client_impl.dart';
import 'package:to_do_list_clean_architecture/core/network/network_connection.dart';
import 'package:to_do_list_clean_architecture/features/assignments/data/data_sources/remote/assignment_remote_data_source.dart';
import 'package:to_do_list_clean_architecture/features/assignments/data/data_sources/remote/assignment_remote_data_source_impl.dart';
import 'package:to_do_list_clean_architecture/features/assignments/data/repositories/assignment_repository_impl.dart';
import 'package:to_do_list_clean_architecture/features/assignments/domain/repositories/assignment_repository.dart';
import 'package:to_do_list_clean_architecture/features/assignments/domain/use_cases/get_all_assignments_use_case.dart';
import 'package:to_do_list_clean_architecture/features/assignments/presentation/controllers/assignment_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // await _infrastructure();
  _cubit();
  _dataSources();
  _core();
  _repositories();
  _useCase();
}

Future<void> _infrastructure() async {
  // sl.registerLazySingleton<LocalStorageHelper>(
  //         ()=> LocalStorageHelperImpl());
  // await sl<LocalStorageHelper>().initDb();
  // await sl<LocalStorageHelper>().registerAdapters();
}

void _core() async {
  sl.registerLazySingleton<ApiClient>(() => (DioClientImpl()));
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton<NetworkConnection>(
    () => NetworkInfoImpl(
      connectivity: sl(),
    ),
  );
}

// repository
void _repositories() {
  sl.registerLazySingleton<AssignmentRepository>(
    () => AssignmentRepositoryImpl(
      remoteDataSource: sl(),
      networkConnection: sl(),
    ),
  );
}

// data source
void _dataSources() async {
  sl.registerLazySingleton<AssignmentRemoteDataSource>(
    () => AssignmentRemoteDataSourceImpl(
      apiClient: sl(),
    ),
  );
}

// domain
void _useCase() {
  sl.registerLazySingleton(
    () => GetAllAssignmentsUseCase(
      repository: sl(),
    ),
  );
}

// presentation
void _cubit() {
  sl.registerLazySingleton(
    () => AssignmentCubit(
      getAllAssignmentsUseCase: sl(),
    ),
  );
}
