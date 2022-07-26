import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

void main(List<String> arguments) async {
  final server = await shelf_io.serve(_handle, '0.0.0.0', 8080);

  print('Server online: Port ${server.port}');
}

Response _handle(Request request) {
  print(request.url.path);

  if (request.url.path == 'json') {
    return Response(200, body: json, headers: {
      'content-type': 'text/json',
    });
  }

  if (request.url.path == 'index.html') {
    return Response(200, body: html, headers: {
      'content-type': 'text/html',
    });
  }

  return Response(404);
}

final json = '''

{
  "message": "tudo certo"

}


''';

final html = '''

<!DOCTYPE html>
<html> 
    <head> 
        <title>Paulo Mercadinho</title> 
    </head> 
    <body> 
        <h1>Produtos em orfeta</h1> 
    </body> 
</html>


''';
