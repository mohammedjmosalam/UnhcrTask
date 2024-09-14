import 'package:equatable/equatable.dart';

class JobModel extends Equatable {
  final String jobId;
  final String title;
  final String company;
  final String location;
  final String description;
  final String longDescription;
  final String salary;
  final String datePosted;
  final String imageUrl;
  const JobModel({
    required this.jobId,
    required this.title,
    required this.company,
    required this.datePosted,
    required this.description,
    required this.imageUrl,
    required this.location,
    required this.salary,
    required this.longDescription,
  });
  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        jobId: json['job_id'],
        title: json['title'] ?? '---',
        company: json['company'] ?? '---',
        location: json['location'] ?? '---',
        description: json['description'] ?? '---',
        longDescription: json['long_description'] ?? '---',
        salary: json['salary'] ?? '---',
        datePosted: json['date_posted'] ?? '---',
        imageUrl: json['image_url'] ?? '---',
      );

  @override
  List<Object?> get props => [
        jobId,
        title,
        company,
        location,
        description,
        longDescription,
        salary,
        datePosted,
        imageUrl,
      ];
}
