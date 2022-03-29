import 'package:flutter/material.dart';
import 'package:togg/data/protos/poi.pb.dart';
import 'package:provider/provider.dart';
import 'package:togg/helper/analytics_helper.dart';
import 'package:togg/page/favorite/favorite_vm.dart';

class FavoriteButton extends StatelessWidget {
  final PoiReply item;
  const FavoriteButton({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(context.watch<FavoriteViewModel>().items.contains(item)
            ? Icons.favorite
            : Icons.favorite_border),
        onPressed: () {
          AnalyticsHelper.instance
              .event("Add Or Remove Favorite", parameters: {"id": item.id});
          context.read<FavoriteViewModel>().addRemoveFavorite((item));
        });
  }
}
