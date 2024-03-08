import 'package:comic_book/controllers/user_controller.dart';
import 'package:comic_book/services/firebase/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';

class LoginButton extends StatelessWidget {
  LoginButton({
    Key? key,
  }) : super(key: key);
  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            if (userController.email.isNotEmpty) ...[
              Text(
                'Welcome ${userController.displayName}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
            ],
            ElevatedButton(
              onPressed: () {
                if (userController.email.isEmpty) {
                  signInWithGoogle();
                } else {
                  Get.defaultDialog(
                      title: "You are about to log out",
                      middleText: "Are you sure you want to log out?",
                      onConfirm: () {
                        signOutGoogle();
                        Get.back();
                      },
                      onCancel: () {
                        Get.back();
                      });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: const StadiumBorder(),
                elevation: 0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (userController.email.isEmpty) ...[
                    const Icon(FontAwesome.google),
                    const SizedBox(width: 8),
                    const Text(
                      'Log In Here!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                  if (userController.email.isNotEmpty) ...[
                    const Icon(
                      FontAwesome.logout,
                      color: Colors.red,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ));
  }
}
