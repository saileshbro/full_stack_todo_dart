import 'package:either_dart/either.dart';
import 'package:exceptions/exceptions.dart';
import 'package:failures/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fullstack_todo/data_services/todos_data_service.dart';
import 'package:fullstack_todo/presentation/maintain_todo/maintain_todo_viewmodel.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:stacked_services/stacked_services.dart';

import 'maintain_todo_viewmodel_test.mocks.dart';

@GenerateMocks([TodosDataService, TodoRepository, NavigationService])
void main() {
  late MockNavigationService mockNavigationService;
  late MockTodoRepository mockTodoRepository;
  late MockTodosDataService mockTodosDataService;
  late MaintainTodoViewModel viewModel;
  setUp(() {
    mockNavigationService = MockNavigationService();
    mockTodoRepository = MockTodoRepository();
    mockTodosDataService = MockTodosDataService();
    viewModel = MaintainTodoViewModel(
      mockTodosDataService,
      mockTodoRepository,
      mockNavigationService,
    );
    when(mockTodoRepository.createTodo(any))
        .thenAnswer((_) async => Right(_todo));
    when(mockNavigationService.back<bool>()).thenAnswer((_) => true);
  });
  group('MaintainTodoView', () {
    test('init test', () {
      viewModel.init(null);
      expect(viewModel.title, '');
      expect(viewModel.description, '');
      expect(viewModel.completed, false);
      expect(viewModel.isValidated, false);
      viewModel.init(_todo);
      expect(viewModel.title, _todo.title);
      expect(viewModel.description, _todo.description);
      expect(viewModel.completed, _todo.completed);
      expect(viewModel.isValidated, true);
    });
    test('state changes', () {
      viewModel.onTitleChanged('');
      expect(viewModel.title, '');
      expect(viewModel.error('title'), 'Title is required');
      expect(viewModel.isValidated, false);
      viewModel.onTitleChanged('title1');
      expect(viewModel.title, 'title1');
      expect(viewModel.isValidated, false);
      viewModel.onDescriptionChanged('');
      expect(viewModel.description, '');
      expect(viewModel.isValidated, false);
      expect(viewModel.error('description'), 'Description is required');
      viewModel.onDescriptionChanged('description1');
      expect(viewModel.description, 'description1');
      expect(viewModel.isValidated, true);
      expect(viewModel.error('title'), null);
      expect(viewModel.error('description'), null);
      expect(viewModel.completed, false);
      viewModel.onCompletedChanged(value: true);
      expect(viewModel.completed, true);
    });

    group('handleTodo -', () {
      test('createTodo with empty data does nothing', () async {
        viewModel
          ..init(null)
          ..onTitleChanged('')
          ..onDescriptionChanged('');
        await viewModel.handleTodo();
        expect(viewModel.isValidated, false);
        expect(viewModel.error('title'), 'Title is required');
        expect(viewModel.error('description'), 'Description is required');
        verifyNever(
          mockTodoRepository.createTodo(
            CreateTodoDto(title: '', description: ''),
          ),
        );
      });

      test('createTodo with valid values, calls repository successfully',
          () async {
        viewModel
          ..init(null)
          ..onTitleChanged('title')
          ..onDescriptionChanged('desc');
        final future = viewModel.handleTodo();
        expect(viewModel.isBusy, true);
        expect(viewModel.error('title'), null);
        expect(viewModel.error('description'), null);
        await future;
        expect(viewModel.isBusy, false);
        verify(
          mockTodoRepository.createTodo(
            CreateTodoDto(title: 'title', description: 'desc'),
          ),
        ).called(1);
        verify(mockNavigationService.back<bool>()).called(1);
        verify(mockTodosDataService.add(_todo)).called(1);
        verifyNoMoreInteractions(mockTodoRepository);
        verifyNoMoreInteractions(mockNavigationService);
      });

      test('createTodo with valid values, calls repository with server error',
          () async {
        when(mockTodoRepository.createTodo(any)).thenAnswer(
          (_) async => const Left(
            NetworkFailure(
              message: 'Network error',
              statusCode: 500,
            ),
          ),
        );
        viewModel
          ..init(null)
          ..onTitleChanged('title')
          ..onDescriptionChanged('desc');
        final future = viewModel.handleTodo();
        expect(viewModel.isBusy, true);
        expect(viewModel.error('title'), null);
        expect(viewModel.error('description'), null);
        await future;
        expect(viewModel.isBusy, false);
        verify(
          mockTodoRepository.createTodo(
            CreateTodoDto(title: 'title', description: 'desc'),
          ),
        ).called(1);
        expect(viewModel.modelError, 'Network error');
        verifyNever(mockNavigationService.back<bool>());
        verifyNever(mockTodosDataService.add(_todo));
        verifyNoMoreInteractions(mockTodoRepository);
        verifyNoMoreInteractions(mockNavigationService);
      });

      test('updateTodo with empty data does nothing', () async {
        viewModel
          ..init(_todo)
          ..onTitleChanged('')
          ..onDescriptionChanged('');
        await viewModel.handleTodo();
        expect(viewModel.isValidated, false);
        expect(viewModel.error('title'), 'Title is required');
        expect(viewModel.error('description'), 'Description is required');
        verifyNever(
          mockTodoRepository.updateTodo(
            id: _todo.id,
            updateTodoDto: UpdateTodoDto(title: '', description: ''),
          ),
        );
      });

      test('updateTodo with valid values, calls repository successfully',
          () async {
        when(
          mockTodoRepository.updateTodo(
            id: anyNamed('id'),
            updateTodoDto: anyNamed('updateTodoDto'),
          ),
        ).thenAnswer(
          (_) async => Right(
            _todo.copyWith(
              completed: true,
              title: 'title',
              description: 'desc',
            ),
          ),
        );
        viewModel
          ..init(_todo)
          ..onTitleChanged('title')
          ..onDescriptionChanged('desc')
          ..onCompletedChanged(value: true);
        final future = viewModel.handleTodo();
        expect(viewModel.isBusy, true);
        expect(viewModel.error('title'), null);
        expect(viewModel.error('description'), null);
        await future;
        expect(viewModel.isBusy, false);
        verify(
          mockTodoRepository.updateTodo(
            id: _todo.id,
            updateTodoDto: UpdateTodoDto(
              title: 'title',
              description: 'desc',
              completed: true,
            ),
          ),
        ).called(1);
        verify(mockNavigationService.back<bool>()).called(1);
        verify(mockTodosDataService.add(any)).called(1);
        verifyNoMoreInteractions(mockTodoRepository);
        verifyNoMoreInteractions(mockNavigationService);
      });
      test('updateTodo with valid values, calls repository with server error',
          () async {
        const notFound = NotFoundException('Not found');
        when(
          mockTodoRepository.updateTodo(
            id: anyNamed('id'),
            updateTodoDto: anyNamed('updateTodoDto'),
          ),
        ).thenAnswer(
          (_) async => Left(
            NetworkFailure(
              message: notFound.message,
              statusCode: notFound.statusCode,
            ),
          ),
        );
        viewModel
          ..init(_todo)
          ..onTitleChanged('title')
          ..onDescriptionChanged('desc');
        final future = viewModel.handleTodo();
        expect(viewModel.isBusy, true);
        expect(viewModel.error('title'), null);
        expect(viewModel.error('description'), null);
        await future;
        expect(viewModel.isBusy, false);
        verify(
          mockTodoRepository.updateTodo(
            id: anyNamed('id'),
            updateTodoDto: anyNamed('updateTodoDto'),
          ),
        ).called(1);
        expect(viewModel.modelError, 'Not found');
        verifyNever(mockNavigationService.back<bool>());
        verifyNever(mockTodosDataService.add(_todo));
        verifyNoMoreInteractions(mockTodoRepository);
        verifyNoMoreInteractions(mockNavigationService);
      });
    });
  });
}

final _todo = Todo(
  id: 1,
  userId: 'userId',
  title: 'title',
  description: 'description',
  completed: false,
  createdAt: DateTime.now(),
);
