import 'package:dartz/dartz.dart';
import 'package:sp2_ecoomerce/core/data/models/common_response.dart';
import 'package:sp2_ecoomerce/core/data/models/token_info.dart';
import 'package:sp2_ecoomerce/core/data/network/network_config.dart';
import 'package:sp2_ecoomerce/core/enums/request_type.dart';
import 'package:sp2_ecoomerce/core/utils/network_util.dart';

class AuthRepository {
  Future<Either<String, TokenInfo>> login({
    required String username,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        route: 'auth/login',
        body: {
          "username": username,
          "password": password,
        },
        headers: NetworkConfig.getHeaders(type: RequestType.POST),
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, TokenInfo>> signup({
    required String username,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        route: 'auth/login',
        body: {
          "username": username,
          "password": password,
        },
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
