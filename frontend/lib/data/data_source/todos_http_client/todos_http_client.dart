import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:models/models.dart';
import 'package:retrofit/retrofit.dart';
import 'package:typedefs/typedefs.dart';

part 'todos_http_client.g.dart';

@RestApi()
@lazySingleton
abstract class TodosHttpClient {
  @factoryMethod
  factory TodosHttpClient(Dio dio) = _TodosHttpClient;

  @GET('/todos')
  Future<List<Todo>> getAllTodo();
  @GET('/todos/{id}')
  Future<Todo> getTodoById(@Path('id') TodoId id);
  @POST('/todos')
  Future<Todo> createTodo(@Body() CreateTodoDto todo);
  @PATCH('/todos/{id}')
  Future<Todo> updateTodo(@Path('id') TodoId id, @Body() UpdateTodoDto todo);
  @DELETE('/todos/{id}')
  Future<void> deleteTodoById(@Path('id') TodoId id);
}
