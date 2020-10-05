class Env {
  static String host = '10.0.2.2';
  static int port = 5001;
  String tokenPrefs = "idToken";

  //Get base url
  static String baseUrl(String url) {
    return 'https://' + host + ':' + port.toString() + '/api/v1/' + url;
  }

  //Get base header
  static Map<String, String> get baseHeader => _baseHeader;
  static Map<String, String> _baseHeader = {
    'accept': 'aplication/json',
    'content-Type': 'application/json'
  };
}
