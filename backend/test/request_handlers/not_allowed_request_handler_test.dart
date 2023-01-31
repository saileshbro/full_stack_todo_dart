import 'dart:convert';
import 'dart:io';

import 'package:backend/request_handlers/not_allowed_request_handler.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockRequestContext extends Mock implements RequestContext {}

void main() {
  test('not allowed request handler ...', () async {
    final res = await notAllowedRequestHandler(_MockRequestContext());
    expect(res.statusCode, HttpStatus.methodNotAllowed);
    expect(
      await res.body(),
      jsonEncode({'error': '👀 Looks like you are lost 🔦'}),
    );
  });
}
