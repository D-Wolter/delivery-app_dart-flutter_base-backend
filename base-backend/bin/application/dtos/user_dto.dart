import '../../domain/models/user.dart';

class UserDto {
  static Map toJson(User user) => {
        'nome': user.nome,
        'sobrenome': user.sobrenome,
        'nomeCompleto': user.nome + ' ' + user.sobrenome,
        'dtNascimento': user.dtNascimento.toIso8601String()
      };
}
