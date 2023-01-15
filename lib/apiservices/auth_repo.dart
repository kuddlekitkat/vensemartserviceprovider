import 'package:dio/dio.dart';

import 'api_services.dart';

class AuthRepo with ApiServices {
  Future<Response?> login(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("service_pro_login", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }

  Future<Response?> register(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("service_pro_register", credentials);

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


  Future<Response?> sendServiceId(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("service-pro-onboarding-1", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }


  Future<Response?> sendLocation(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("service-pro-onboarding-2", credentials);

    if (response != null) {
      return response;
    }
    return null;
  }

  Future<Map<String, dynamic> ?> updateProfile(Map<String, dynamic> credentials) async {
    Map<String, dynamic> ? response = await apiUploadPostRequests("service_update_profile", credentials);

    if (response != null) {
      return response;
    }

    return null;
  }


  Future<Response?> acceptRejectBooking(Map<String, String> credentials) async {
    Response? response = await apiPostRequests("accept-reject-bookings", credentials);

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


  Future<Response?> services() async {
    Response? response = await apiGetRequests("services");

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


  Future<Response?> bankPlans() async {
    Response? response = await apiGetRequests("get-banks",);

    if (response != null) {
      return response;
    }

    return null;
  }

  }
