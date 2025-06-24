import 'package:appointments/core/network/api_constant.dart';
import 'package:appointments/core/utils/shared_prefrances.dart';
import 'package:dio/dio.dart';

Future<bool> validateStoredToken() async {
  final prefs = await SharedPrefrancesHelpers.getSecuredString('tokenKey');
  final id = await SharedPrefrancesHelpers.getSecuredString('userId');
  if (prefs == null) {
    print('No token stored');
    return false;
  }

  try {
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $prefs';

    final response = await dio.get('${ApiConstant.baseUrl}/appointment/${id}'); // or /me

    if (response.statusCode == 200) {
      print('Token is valid ✅');
      return true;
    } else {
      print('Token is invalid ❌');
      return false;
    }
  } catch (e) {
    print('Token validation error: $e');
    return false;
  }
}
