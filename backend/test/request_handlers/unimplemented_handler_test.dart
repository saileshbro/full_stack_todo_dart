import 'dart:convert';
import 'dart:io';

import 'package:backend/request_handlers/unimplemented_handler.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockRequestContext extends Mock implements RequestContext {}

void main() {
  test('unimplemented handler ...', () async {
    final res = await unimplementedHandler(_MockRequestContext());
    expect(res.statusCode, HttpStatus.notImplemented);
    expect(
      await res.body(),
      jsonEncode({'error': '👀 Not implemented yet'}),
    );
  });
}
