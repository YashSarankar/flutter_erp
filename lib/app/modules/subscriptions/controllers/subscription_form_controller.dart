import 'package:flutter/cupertino.dart';
import 'package:flutter_erp/app/data/models/discount.dart';
import 'package:flutter_erp/app/data/models/subscription.dart';
import 'package:flutter_erp/app/data/repositories/branch_repository.dart';
import 'package:flutter_erp/app/data/repositories/subscription_repository.dart';
import 'package:flutter_erp/app/data/services/auth_service.dart';
import 'package:get/get.dart';

class SubscriptionFormController extends GetxController {
  late GlobalKey<FormState> formKey;
  late Rx<Subscription> subscription;
  late RxBool isLoading;
  late RxString error;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    subscription = Rx<Subscription>(
      Get.arguments ??
          Subscription(branchId: Get.find<AuthService>().currentBranch.id),
    );
    isLoading = false.obs;
    error = "".obs;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void submit() async {
    try {
      isLoading.value = true;
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        await Get.find<SubscriptionRepository>().insert(subscription.value);
        Get.back(result: true);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
      rethrow;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
