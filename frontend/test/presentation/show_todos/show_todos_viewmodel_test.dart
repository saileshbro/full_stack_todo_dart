import 'package:either_dart/either.dart';
import 'package:exceptions/exceptions.dart';
import 'package:failures/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fullstack_todo/core/app/routes.router.dart';
import 'package:fullstack_todo/data_services/todos_data_service.dart';
import 'package:fullstack_todo/presentation/show_todos/show_todos_viewmodel.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:stacked_services/stacked_services.dart';

import 'show_todos_viewmodel_test.mocks.dart';

@GenerateMocks([TodoRepository, TodosDataService, NavigationService])
void main() {
  late MockTodoRepository mockTodoRepository;
  late TodosDataService mockTodosDataService;
  late NavigationService mockNavigationService;
  late ShowTodosViewModel showTodosViewModel;
  setUp(() {
    mockNavigationService = MockNavigationService();
    mockTodoRepository = MockTodoRepository();
    mockTodosDataService = MockTodosDataService();
    showTodosViewModel = ShowTodosViewModel(
      mockTodoRepository,
      mockTodosDataService,
      mockNavigationService,
    );
  });
  group('ShowTodosViewModel', () {
    test('should have correct llist of todos on init', () async {
      when(mockTodosDataService.todos).thenReturn([]);
      expect(showTodosViewModel.todos, equals([]));
    });
    test('when init, gets todos from repository with success', () async {
      when(mockTodoRepository.getTodos())
          .thenAnswer((_) async => Right([_todo]));
      final future = showTodosViewModel.init();
      expect(showTodosViewModel.isBusy, true);
      await expectLater(future, completes);
      expect(showTodosViewModel.isBusy, false);
      verify(mockTodoRepository.getTodos()).called(1);
      verify(mockTodosDataService.addAll([_todo])).called(1);
      verifyNoMoreInteractions(mockTodoRepository);
    });

    test('when init, gets todos from repository with failure', () async {
      when(mockTodoRepository.getTodos()).thenAnswer(
        (_) async => const Left(
          NetworkFailure(
            message: 'error',
            statusCode: 500,
          ),
        ),
      );
      final future = showTodosViewModel.init();
      expect(showTodosViewModel.isBusy, true);
      await expectLater(future, completes);
      expect(showTodosViewModel.isBusy, false);
      verify(mockTodoRepository.getTodos()).called(1);
      verifyNever(mockTodosDataService.addAll([]));
      verifyNoMoreInteractions(mockTodoRepository);
      expect(showTodosViewModel.modelError, 'error');
    });

    test('should open maintain todo view', () async {
      when(
        mockNavigationService.navigateTo<void>(
          Routes.maintainTodoView,
          arguments: anyNamed('arguments'),
        ),
      ).thenAnswer((_) async => Future.value());
      await showTodosViewModel.handleTodo(_todo);
      verify(
        mockNavigationService.navigateTo<void>(
          Routes.maintainTodoView,
          arguments: anyNamed('arguments'),
        ),
      ).called(1);
      verifyNoMoreInteractions(mockNavigationService);
    });

    test('should remove todo when delete successful', () async {
      when(mockTodoRepository.deleteTodo(_todo.id))
          .thenAnswer((_) async => const Right(null));
      await showTodosViewModel.deleteTodo(_todo);
      verify(mockTodoRepository.deleteTodo(_todo.id)).called(1);
      verify(mockTodosDataService.remove(_todo)).called(1);
      verifyNoMoreInteractions(mockTodoRepository);
    });

    test('should handle failure when delete failed', () async {
      const exception = NotFoundException('Not found');
      when(mockTodoRepository.deleteTodo(_todo.id)).thenAnswer(
        (_) async => Left(
          NetworkFailure(
            message: exception.message,
            statusCode: exception.statusCode,
          ),
        ),
      );
      await showTodosViewModel.deleteTodo(_todo);
      verify(mockTodoRepository.deleteTodo(_todo.id)).called(1);
      verifyNever(mockTodosDataService.remove(_todo));
      verifyNoMoreInteractions(mockTodoRepository);
      expect(showTodosViewModel.modelError, exception.message);
    });
    test(
        'should mark completed when called update with negated completed value',
        () async {
      final updated = _todo.copyWith(completed: !_todo.completed);
      when(
        mockTodoRepository.updateTodo(
          id: anyNamed('id'),
          updateTodoDto: anyNamed('updateTodoDto'),
        ),
      ).thenAnswer((_) async => Right(updated));
      final future = showTodosViewModel.markCompleted(_todo);
      expect(showTodosViewModel.busy('updating'), true);
      verify(mockTodosDataService.add(updated)).called(1);
      await expectLater(future, completes);
      expect(showTodosViewModel.busy('updating'), false);
      verify(
        mockTodoRepository.updateTodo(
          id: anyNamed('id'),
          updateTodoDto: anyNamed('updateTodoDto'),
        ),
      ).called(1);
      verifyNoMoreInteractions(mockTodoRepository);
    });

    test(
        'should mark completed when called update, but should revert again if failed',
        () async {
      const exception = NotFoundException('Not found');
      final updated = _todo.copyWith(completed: !_todo.completed);
      when(
        mockTodoRepository.updateTodo(
          id: anyNamed('id'),
          updateTodoDto: anyNamed('updateTodoDto'),
        ),
      ).thenAnswer(
        (_) async => Left(
          NetworkFailure(
            message: exception.message,
            statusCode: exception.statusCode,
          ),
        ),
      );
      final future = showTodosViewModel.markCompleted(_todo);
      expect(showTodosViewModel.busy('updating'), true);
      verify(mockTodosDataService.add(updated)).called(1);
      await expectLater(future, completes);
      expect(showTodosViewModel.busy('updating'), false);
      verify(
        mockTodoRepository.updateTodo(
          id: anyNamed('id'),
          updateTodoDto: anyNamed('updateTodoDto'),
        ),
      ).called(1);
      verifyNoMoreInteractions(mockTodoRepository);
      verify(mockTodosDataService.add(_todo)).called(1);
      expect(showTodosViewModel.modelError, exception.message);
    });
  });
}

final _todo = Todo(
  id: 1,
  title: 'title',
  description: 'description',
  completed: false,
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
);
