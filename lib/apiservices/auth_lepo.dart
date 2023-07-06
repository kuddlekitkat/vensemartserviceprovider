import 'package:dio/dio.dart';

import 'apr_services.dart';

class AuthLepo with ApiServices {


  Future<Response?> login(Map<String, String> credentials) async {
    Response? response = await apiPostRequests(
        "service_pro_login", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }



  Future<Response?> register(Map<String, String> credentials) async {
    Response? response = await apiPostRequests(
        "service_pro_register", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> sendOtp(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("send-otp", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> verifyOtp(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("verify-otp", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  // Future<Response?> verifyUler(Map<String, String> credentials) async {
  //   Response? response = await apiPostRequests("v1/kyc/photoid/verify", credentials);
  //
  //   if (response != null) {
  //     return response;
  //   }
  //
  //   return null;
  // }


  Future<Map<String, dynamic> ?> verifyUler(
      Map<String, dynamic> credentials) async {
    Map<String, dynamic> ? response = await apiUploadPostRequests(
        "v1/kyc/photoid/verify", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }


  Future<Response?> uploadAndVerify(Map<String, String> credentials) async {
    Response? response = await apiPostRequests(
        "v1/kyc/photoid/verify", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }


  Future<Response?> uploadAndVerifyNin(Map<String, String> credentials) async {
    Response? response = await apiPostRequests(
        "v1/kyc/nin/verify", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }




  Future<Map<String, dynamic> ?> updateProfile(
      Map<String, dynamic> credentials) async {
    Map<String, dynamic> ? response = await apiUploadPostRequests(
        "service_update_profile", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }


  Future<Response?> sendPasswordChange(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("forgot-password", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }


  Future<Response?> changePassword(Map<String, String> credentials) async {
    Response? response = await apiPostRequests(
        "forgot-password-change", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> serviceHome() async {
    Response? response = await apiGetRequests("service-provider-home",);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> getUserDetails() async {
    Response? response = await apiGetRequests("get_profile");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> serviceId(String? num) async {
    Response? response = await apiGetRequests("service-provider/$num");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> services() async {
    Response? response = await apiGetRequests("services");

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> acceptRejectBooking(Map<String, String> credentials) async {
    Response? response = await apiPostRequests(
        "accept-reject-bookings", credentials);

    if (response != null) {
      return response;
    }
    return null;
  }


  Future<Response?> endBooking(Map<String, String> credentials) async {
    Response? response = await apiPostRequests(
        "complete-reject-booking", credentials);

    if (response != null) {
      return response;
    }
    return null;
  }



  Future<Response?> sendSupport(Map<String, String> credentials) async {
    Response? response = await apiPostRequests(
        "send-support-message", credentials);

    if (response != null) {
      return response;
    }
    return null;
  }


  Future<Response?> goOnline(Map<String, String> credentials) async {
    Response? response = await apiPostRequests(
        "service-online-status", credentials);

    if (response != null) {
      return response;
    }
    return null;
  }


  Future<Response?> goOffline(Map<String, String> credentials) async {
    Response? response = await apiPostRequests(
        "service-offline-status", credentials);

    if (response != null) {
      return response;
    }
    return null;
  }


  Future<Response?> verifyUser(Map<String, String> credentials) async {
    Response? response = await apiPostRequests(
        "service-provider-verify-number", credentials);

    if (response != null) {
      return response;
    }
    return null;
  }




  Future<Response?> verifytheUser(Map<String, String> credentials) async {
    Response? response = await apiPostRequests(
        "service-provider-verify-number", credentials);

    if (response != null) {
      return response;
    }
    return null;
  }


  Future<Response?> sendSupportMessage(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("send-support-message", credentials);

    if (response != null) {
      return response;
    }
    return null;
  }



  Future<Response?> rateCustomer(Map<String, String> credentials) async {
    Response? response = await apiPostRequests(
        "rate-service-provider", credentials);

    if (response != null) {
      return response;
    }
    return null;
  }


  Future<Response?> upcomingRequest() async {
    Response? response = await apiGetRequests("upcomming_request_list",);

    if (response != null) {
      return response;
    }

    return null;
  }


  Future<Response?> canceledRequest() async {
    Response? response = await apiGetRequests("cancel_request_list",);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> CompletedRequest() async {
    Response? response = await apiGetRequests("completed-bookings",);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> userLocation() async {
    Response? response = await apiGetRequests("get-location");

    if (response != null) {
      return response;
    }

    return null;
  }


  Future<Response?> sendLocation(Map<String, String> credentials) async {
    Response? response = await apiPostRequests(
        "service-pro-onboarding-2", credentials);

    if (response != null) {
      return response;
    }
    return null;
  }


  Future<Response?> sendServiceId(Map<String, String> credentials) async {
    Response? response = await apiPostRequests(
        "service-pro-onboarding-1", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }


  Future<Response?> providerPlans() async {
    Response? response = await apiGetRequests("service_subscription_plans",);

    if (response != null) {
      return response;
    }

    return null;
  }

}
