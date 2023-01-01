import 'package:backend/db/database_connection.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final connection = context.read<DatabaseConnection>();
  await connection.connect();
  final response =
      await connection.db.query('select * from information_schema.tables');
  await connection.close();
  return Response.json(body: response.map((e) => e.toColumnMap()).toList());
}
