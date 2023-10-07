// import 'package:dio/dio.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';

// import 'local_data_service/local_data_service.dart';

// class AuthService {
//   final _baseUrl = '154.56.60.253:4009';
//   login({
//     required String kode_reg,
//     required String password,
//   }) async {
//     try {
//       final datas = {'kode_reg': kode_reg, 'password': password};
//       ;
//       final response =
//           await Dio().post('http://' + _baseUrl + '/auth/login', data: datas);
//       // var response = await Dio().post(
//       //   "https://capekngoding.com/demo/api/auth/login",
//       //   options: Options(
//       //     headers: {
//       //       "Content-Type": "application/json",
//       //     },
//       //   ),
//       //   data: {
//       //     "email": email,
//       //     "password": password,
//       //   },
//       // );
//       // Map<String, dynamic> obj = response.data;
//       // Map<String, dynamic> userMap = obj["data"];
//       // currentUser = User.fromJson(userMap);
//       // token = currentUser!.token;
//       var decodeToken = JwtDecoder.decode(response.data['payload']);
//       var role = decodeToken['role'];

//       DB.getRole(role);
//       DB.setToken(response.data['payload']);
//     } on Exception catch (err) {
//       print(err);
//     }
//   }
// }
