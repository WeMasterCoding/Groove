import 'package:client/utils/colors.dart';
import 'package:client/utils/font_sizes.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accent,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildImage(),
            _buildDivider(),
            _buildContent(),
            _buildDivider(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return SizedBox(
      height: 440,
      child: Image.asset(
        'images/LandingSplashOne.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        children: [
          const Text(
            "Unleash Your Creativity with Ai Artistry",
            style: TextStyle(
              color: Colors.white,
              fontSize: AppTextStyles.textSizeExtraLarge,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            "Explore a world where imagination meets innovation at the tap of your finger",
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 15.0,
                ),
                backgroundColor: AppColors.secondary,
              ),
              child: const Text(
                "Skip",
                style: TextStyle(
                  fontSize: AppTextStyles.textSizeMedium,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 15.0,
                ),
                backgroundColor: AppColors.primaryColor,
              ),
              child: const Text(
                "Next",
                style: TextStyle(
                  fontSize: AppTextStyles.textSizeMedium,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
