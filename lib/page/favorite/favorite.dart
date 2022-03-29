import 'dart:math';

import 'package:flutter/material.dart';
import 'package:togg/data/protos/poi.pb.dart';
import 'package:provider/provider.dart';
import 'package:togg/page/favorite/favorite_vm.dart';
import 'package:togg/page/favorite/widget/fav_button.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteViewModel>(builder: (c, vm, w) {
      return Scaffold(
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton(
              child: const Text("Go Map"),
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
          ),
        ),
        body: vm.items.isEmpty
            ? const Center(
                child: Text("Empty List"),
              )
            : ListView.builder(
                itemBuilder: (c, i) {
                  return ListTile(
                    trailing: FavoriteButton(item: vm.items[i]),
                    title: Text(vm.items[i].name),
                  );
                },
                itemCount: vm.items.length,
              ),
      );
    });
  }
}
