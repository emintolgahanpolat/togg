import 'package:grpc/service_api.dart';
import 'package:togg/data/data_source/grpc_client.dart';
import 'package:togg/data/data_source/local_data_source.dart';
import 'package:togg/data/protos/poi.pbgrpc.dart';

abstract class IAuthRepository {
  Future<LoginReply> login(LoginRequest request);
}

class AuthRepository implements IAuthRepository {
  @override
  Future<LoginReply> login(LoginRequest request) async {
    var res = await AuthenticationClient(GrpcClient.channel,
        options: CallOptions(
          timeout: const Duration(seconds: 15),
          metadata: {'content-type': 'application/grpc'},
        )).login(request);
    LocalDataSource.instance.setToken(res.token);
    return res;
  }
}
