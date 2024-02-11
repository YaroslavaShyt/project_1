abstract interface class INetworkService {
  void init();
  Future get({required String endpoint});
  Future post({required String endpoint, required dynamic data});
  Future put({required String endpoint, required dynamic data});
  Future update({required String endpoint, required dynamic data});
  Future delete({required String endpoint});
}
