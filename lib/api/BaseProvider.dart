import 'package:get/get.dart';
import '../constants/Networkconstants.dart';
import '../utils/Sharedutils.dart';

class Baseprovider extends GetConnect{
  Baseprovider(){
    allowAutoSignedCert=true;
  }
  Future<Response>hitPost(Map param,{required String url}) async{
    String? token=await SharedUtils().get_token();
    var postAPI=await post(vhBaseUrl+url,param,headers: {
      "Content-Type" : "application/json; charset=UTF-8",
      "Authorization":"Bearer $token",
    });
    print(url);
    print(param);
    print(token);
    return postAPI;
  }
  Future<Response> hitPut(String jsonBody, {required String url}) async {
    String? token = await SharedUtils().get_token();

    // Make sure the body is encoded as JSON
    var response = await put(
      url,
      jsonBody, // Use the JSON-encoded body
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer $token",
      },
    );

    return response;
  }
  Future<Response>hitPost2(Map param,{required String url}) async{
    var postAPI=await post(vhBaseUrl+url,param,headers: {
      "Content-Type" : "application/json; charset=UTF-8",
    });
    print(url);
    print(param);

    return postAPI;
  }
  Future<Response>hitget({required String url}) async{
    String? token=await SharedUtils().get_token();
    var getAPI=await get(vhBaseUrl+url,
    );
    print(url);
    print("token:-"+token.toString());
    return getAPI;
  }
  Future<Response>hitget2({required String url}) async{
    String? token=await SharedUtils().get_token();
    var getAPI=await get(vhBaseUrl+url,
        headers: {
      "Content-Type" : "application/json; charset=UTF-8",
      "Authorization":"Bearer $token",
    }
    );
    print(url);
    print("token:-"+token.toString());
    return getAPI;
  }
  Future<Response>hitdelete({required String url}) async{
    String? token=await SharedUtils().get_token();
    var getAPI=await delete(vhBaseUrl+url,
        headers: {
      "Content-Type" : "application/json; charset=UTF-8",
      "Authorization":"Bearer $token",
    }
    );
    print(url);
    print("token:-"+token.toString());
    return getAPI;
  }

}
