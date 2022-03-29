import 'package:flutter/material.dart';
import 'package:togg/page/base/base_view.dart';
import 'package:togg/page/login/login_vm.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(builder: (c, vm, w) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('LoginPage'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            TextFormField(
              initialValue: vm.username,
              onChanged: vm.setUsername,
              decoration: const InputDecoration(label: Text("Username")),
            ),
            TextFormField(
              initialValue: vm.password,
              onChanged: vm.setPassword,
              decoration: const InputDecoration(label: Text("Password")),
            ),
            ElevatedButton(
                onPressed: (vm.password != null &&
                            vm.password!.isNotEmpty &&
                            vm.username != null &&
                            vm.username!.isNotEmpty) &&
                        !vm.isLoading
                    ? () {
                        vm.login().then((value) {
                          if (value != null) {
                            Navigator.pushReplacementNamed(context, "/");
                          }
                        }).onError((error, stackTrace) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("$error")));
                        });
                      }
                    : null,
                child: Text(vm.isLoading ? "Loading..." : "Login")),
          ],
        ),
      );
    });
  }
}
