import 'package:grpc/grpc.dart';
import 'package:flutter_app_layout/grpc/proto/ping.pbgrpc.dart';

class PingService {
  ///here enter your host without the http part (e.g enter google.com now http://google.com)
  String baseUrl = "example.com";

  PingService._internal();
  static final PingService _instance = PingService._internal();

  factory PingService() => _instance;

  ///static PingService instance that we will call when we want to make requests
  static PingService get instance => _instance;

  ///PingClient is the  class that was generated for us when we ran the generation command
  ///We will pass a channel to it to intialize it
  late SvcPingClient _pingClient;

  ///this will be used to create a channel once we create this class.
  ///Call PingService().init() before making any call.
  Future<void> init() async {
    _createChannel();
  }

  ///provide public access to the PingClient instance
  SvcPingClient get helloClient {
    return _pingClient;
  }

  ///here we create a channel and use it to initialize the PingClientthat was generated
  ///
  _createChannel() {
    final channel = ClientChannel(
      baseUrl,

      ///port: 9043,
      port: 443,

      ///use credentials: ChannelCredentials.insecure() if you want to connect without Tls
      //options: const ChannelOptions(credentials: ChannelCredentials.insecure()),

      ///use this if you are connecting with Tls
      options: const ChannelOptions(),
    );
    _pingClient = SvcPingClient(channel);
  }
}
