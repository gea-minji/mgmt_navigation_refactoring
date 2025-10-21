class Task {
  final String title;
  final String description;
  final String createdDate;
  final String assignee;
  final String createdBy;

  const Task({
    required this.title,
    required this.description,
    required this.createdDate,
    required this.createdBy,
    required this.assignee,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      description: json['description'],
      createdDate: json['createdDate'],
      createdBy: json['createdBy'],
      assignee: json['assignee'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'createdDate': createdDate,
      'createdBy': createdBy,
      'assignee': assignee,
    };
  }
}
