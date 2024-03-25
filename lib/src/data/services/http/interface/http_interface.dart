abstract class IHttpService {
  Future get(String url);

  Future post(String url, {String? data});

  Future put(String url, {String? data});

  Future delete(String url);
}
