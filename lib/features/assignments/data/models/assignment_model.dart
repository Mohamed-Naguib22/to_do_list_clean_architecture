import 'package:to_do_list_clean_architecture/core/helpers/date_time_helper.dart';
import 'package:to_do_list_clean_architecture/features/assignments/domain/entities/assignment.dart';

class AssignmentModel extends Assignment {
  const AssignmentModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.dateCreated});

  factory AssignmentModel.fromJson(Map<String, dynamic> json) {
    return AssignmentModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      dateCreated: json['dateCreated'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'dateCreated': dateCreated,
    };
  }
}
