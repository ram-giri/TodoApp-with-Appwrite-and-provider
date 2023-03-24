import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';

import 'model.dart';

class Id {
  static String endPont = 'https://cloud.appwrite.io/v1';
  static String projectId = '641d499e2cbff5719f36';
  static String dbId = '641d520a6706afb3549f';
  static String docId = '641d52559bb5ff47114f';
}

class AppwriteService {
  Databases? databases;
  Client client = Client();
  Future getAllTodos() async {
    client
        .setEndpoint(Id.endPont)
        .setProject(Id.projectId)
        .setSelfSigned(status: true);
    databases = Databases(client);
    final response =
        databases!.listDocuments(databaseId: Id.dbId, collectionId: Id.docId);
    return response.then(
        (value) => value.documents.map((e) => Todo.fromMap(e.data)).toList());
  }
}

class TodoProvider extends ChangeNotifier {
  List<Todo> todos = [];
  TodoProvider() {
    AppwriteService().getAllTodos().then((value) {
      todos = value;
      notifyListeners();
    });
  }
}
