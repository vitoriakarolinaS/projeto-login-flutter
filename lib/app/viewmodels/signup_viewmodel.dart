import '../data/usuario_store.dart';
import '../models/usuario_model.dart';

class SignupViewModel {

  String? cadastrar(String nome, String email, String senha) {

    for (var user in UsuarioStore.usuarios) {
      if (user.email == email) {
        return "Email já cadastrado";
      }
    }

    UsuarioStore.usuarios.add(
      UsuarioModel(
        nome: nome,
        email: email,
        senha: senha,
      ),
    );

    return null;
  }
}