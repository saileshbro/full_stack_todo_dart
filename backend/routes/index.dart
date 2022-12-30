import 'package:backend/db/database_connection.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final db = context.read<DatabaseConnection>();
  await db.connect();
  final response = Response(body: 'Welcome to Dart Frog!');
  await db.close();
  return response;
}
