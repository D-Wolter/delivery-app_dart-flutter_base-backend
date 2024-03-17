import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

// import 'package:base_backend/base_backend.dart' as base_backend;

void main(List<String> arguments) {
  serve((Request req) => Response(200, body: 'Ola mundo', headers: {'content-type': 'application/json'}), 'localhost', 8080,);
}
