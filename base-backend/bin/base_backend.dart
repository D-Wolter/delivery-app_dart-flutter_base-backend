import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:mysql1/mysql1.dart';

void main(List<String> arguments) async{
  final conn = await MySqlConnection.connect(
    ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'dart_user',
      db: 'delivery',
      password: 'dart_pass',
    ),
  );

  await conn.query("insert into tb_permissions(name, status) values ('ADMIN', 'A')");
  print(await conn.query('select * from tb_permissions'));

  await serve((Request req) => Response(200, body: 'Ola mundo', headers: {'content-type': 'application/json'}), 'localhost', 8080,);
}
