abstract class BaseApiService {
  Future<dynamic> getApi(Uri url, {Map<String, String>? headers});
}
