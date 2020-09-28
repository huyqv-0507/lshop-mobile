class Env {
  static String host = '10.0.2.2';
  static String port = '5001';
  String tokenPrefs = "idToken";

  //Get base url
  static String baseUrl(String url) {
    return 'http://' + host + ':' + port + '/api/v1/' + url;
  }

  //Get base header
  static Map<String, String> get baseHeader => _baseHeader;
  static Map<String, String> _baseHeader = {
    'accept': 'aplication/json',
    'content-Type': 'application/json'
  };
}
