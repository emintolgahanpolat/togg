import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:togg/data/protos/poi.pb.dart';
import 'package:togg/helper/analytics_helper.dart';
import 'package:togg/page/base/base_view.dart';
import 'package:togg/page/favorite/widget/fav_button.dart';
import 'package:togg/page/home/home_vm.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  void _showSheet(ScaffoldState state, PoiReply item) {
    state.showBottomSheet(
        (context) => IntrinsicHeight(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.name,
                              style: Theme.of(context).textTheme.subtitle2),
                          const Spacer(),
                          Text(
                            item.website,
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue),
                          ),
                        ],
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () async {
                            AnalyticsHelper.instance.event("Open Brrowser",
                                parameters: {"website": item.website});
                            if (!await launch(item.website))
                              throw 'Could not launch website';
                          },
                          child: const Text("Open")),
                      FavoriteButton(item: item)
                    ],
                  ),
                ),
              ),
            ),
        backgroundColor: Colors.transparent);
  }

  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey<ScaffoldState>();
    return BaseView<HomeViewModel>(onModelReady: (vm) {
      vm.listen();
    }, builder: (c, vm, w) {
      return Scaffold(
        key: globalKey,
        body: GoogleMap(
          key: const Key("map"),
          mapType: MapType.normal,
          zoomControlsEnabled: false,
          initialCameraPosition: const CameraPosition(
            target: LatLng(40.791745, 29.511554),
            zoom: 15,
          ),
          onMapCreated: (GoogleMapController controller) {
            vm.controller = controller;
          },
          markers: vm.items
              .map((e) => Marker(
                  markerId: MarkerId(e.name),
                  position: LatLng(e.lat, e.lon),
                  onTap: () {
                    _showSheet(globalKey.currentState!, e);
                  }))
              .toSet(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: ElevatedButton(
          child: const Text("Favorites"),
          onPressed: () {
            Navigator.pushNamed(context, "/favorites");

            // showSheet(globalKey.currentState!);
          },
        ),
      );
    });
  }
}
