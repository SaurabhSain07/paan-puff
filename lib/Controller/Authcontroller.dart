import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  var otpController=List.generate(4, (Index)=> TextEditingController());
  RxBool isfullfill=false.obs;
}