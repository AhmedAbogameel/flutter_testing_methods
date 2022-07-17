class DataSource {

  static Future<Map<String, dynamic>> login(String? email, String? password) async {
    // await Future.delayed(const Duration(seconds: 2));
    if (email == 'jemi@dev.com' && password == '123123') {
      return {
        'success': true,
        'token': "akjsbkjabvkjnsakjsnkvjnaksnavs",
      };
    } else {
      return {
        'success': false,
        'message': 'Invalid email or password!',
      };
    }
  }

}