import 'package:client/utils/font_sizes.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class Providers extends StatelessWidget {
  const Providers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accent,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("images/Logo.png"),
            ),
            const Text(
              "Groove",
              style: TextStyle(
                color: Colors.white,
                fontSize: AppTextStyles.textSizeExtraLarge,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Welcome! Let’s dive into your account",
              style: TextStyle(
                color: Colors.white,
                fontSize: AppTextStyles.textSizeMedium,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 12.0,
                        ),
                        backgroundColor: AppColors.tertiary,
                        side: const BorderSide(
                            color: AppColors.strokes, width: 4)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("images/Discord.png"),
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Continue with Discord",
                          style: TextStyle(
                            fontSize: AppTextStyles.textSizeMedium,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 12.0,
                        ),
                        backgroundColor: AppColors.tertiary,
                        side: const BorderSide(
                            color: AppColors.strokes, width: 4)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("images/facebook.png"),
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Continue with Discord",
                          style: TextStyle(
                            fontSize: AppTextStyles.textSizeMedium,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 12.0,
                        ),
                        backgroundColor: AppColors.tertiary,
                        side: const BorderSide(
                            color: AppColors.strokes, width: 4)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("images/google.png"),
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Continue with Discord",
                          style: TextStyle(
                            fontSize: AppTextStyles.textSizeMedium,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 12.0,
                        ),
                        backgroundColor: AppColors.tertiary,
                        side: const BorderSide(
                            color: AppColors.strokes, width: 4)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("images/twitter.png"),
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Continue with Discord",
                          style: TextStyle(
                            fontSize: AppTextStyles.textSizeMedium,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 130.0,
                  vertical: 15.0,
                ),
                backgroundColor: AppColors.primaryColor,
              ),
              child: const Text(
                "Sign in with Email",
                style: TextStyle(
                  fontSize: AppTextStyles.textSizeMedium,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppTextStyles.textSizeMedium,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Sign In",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: AppTextStyles.textSizeMedium,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
