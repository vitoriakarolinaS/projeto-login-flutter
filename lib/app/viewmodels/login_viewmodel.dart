import '../data/usuario_store.dart';
import '../models/usuario_model.dart';

class LoginViewModel {

  UsuarioModel? login(String email, String senha) {

    for (var user in UsuarioStore.usuarios) {
      if (user.email == email && user.senha == senha) {
        UsuarioStore.usuarioLogado = user;
        return user;
      }
    }

    return null;
  }
}