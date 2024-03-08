import 'package:comic_book/controllers/user_controller.dart';
import 'package:comic_book/services/firebase/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: const Text('ComicBook'),
      ),
      body: Obx(() => Column(
            children: [
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        signOutGoogle();
                      },
                      child: const Text('Latest Issues')),
                  GestureDetector(
                      onTap: () {
                        signInWithGoogle();
                      },
                      child: Text('Welcome ${userController.displayName}')),
                ],
              ),
              const Divider(),
            ],
          )),
    );
  }
}
