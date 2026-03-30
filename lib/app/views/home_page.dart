import 'package:flutter/material.dart';
import '../data/usuario_store.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {

  void logout(BuildContext context) {
    UsuarioStore.usuarioLogado = null;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {

    var user = UsuarioStore.usuarioLogado;
    var lista = UsuarioStore.usuarios;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: () => logout(context),
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            Icon(Icons.home, size: 80),

            SizedBox(height: 10),

            Text(
              "Bem-vindo, ${user?.nome ?? ''}",
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(height: 20),

            Divider(),

            Text(
              "Usuários cadastrados:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  var u = lista[index];

                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text(u.nome),
                      subtitle: Text(u.email),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}