import 'package:dio/dio.dart';
import 'package:read_app_2018/utils/httpUtil.dart';

void main() {
  testGet();

  testPost();
}

testGet() async {
  HttpUtil httpUtil = HttpUtil();
  Response? response = await httpUtil.get(
    url:
        'https://t-xiaofa-lawyer.aegis-info.com/xiaofa-manager/sso/customerServiceById2',
    queryParames: {"userId": 10},
  );
  print(response);
}

testPost() async {
  HttpUtil httpUtil = HttpUtil();
  Response? response = await httpUtil.post(
      url:
          'https://t-xiaofa-gateway.aegis-info.com/xiaofa_lawyer/v1.3/lawyer/list',
      data: {"pageNum": 1, "pageSize": 2});
  print(response);
}
