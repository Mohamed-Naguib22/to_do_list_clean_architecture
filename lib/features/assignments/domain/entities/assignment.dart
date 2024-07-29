import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'assignment.g.dart';

@HiveType(typeId: 0)
class Assignment extends Equatable {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String dateCreated;

  const Assignment(
      {required this.id,
      required this.name,
      required this.description,
      required this.dateCreated});

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        dateCreated,
      ];
}
