import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:togg/data/data_source/grpc_client.dart';
import 'package:togg/data/data_source/local_data_source.dart';
import 'package:togg/data/protos/poi.pbgrpc.dart';

abstract class IHomeRepository {
  Stream<PoiReply> getPois();
}

class HomeRepository extends IHomeRepository {
  @override
  Stream<PoiReply> getPois() {
    return PoiLocatorClient(GrpcClient.channel,
        options: CallOptions(
          timeout: const Duration(seconds: 15),
          metadata: {
            'content-type': 'application/grpc',
            'Authorization': 'Bearer ' + (LocalDataSource.instance.token ?? "")
          },
        )).getPois(PoiRequest());
  }
}
