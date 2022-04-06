abstract class AbstractService {
  AbstractService({required this.path});

  final String path;

  final String _url = "https://social-network-for-class.herokuapp.com/";

  String getUrl() {
    return _url + path;
  }

  Map<String, String> getHeaders() {
    return <String, String>{'Content-Type': 'application/json; charset=UTF-8'};
  }
}
