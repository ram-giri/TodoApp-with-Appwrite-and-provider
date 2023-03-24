class Todo {
  final String title;
  final String disc;

  Todo({required this.title, required this.disc});

  Todo copyWith({
    String? title,
    String? disc,
  }) {
    return Todo(
      title: title ?? this.title,
      disc: disc ?? this.disc,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'disc': disc,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      title: map['title'] as String,
      disc: map['disc'] as String,
    );
  }
}
