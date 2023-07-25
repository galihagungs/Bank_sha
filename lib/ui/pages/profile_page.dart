import 'package:bank__sha/shared/theme.dart';
import 'package:bank__sha/ui/widgets/button.dart';
import 'package:bank__sha/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        backgroundColor: lightBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Profile',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semibold,
          ),
        ),
        iconTheme: IconThemeData(
          color: blackColor,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 22,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/img_profile.png'),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: greenColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Shayna Hanna',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ProfileMenuItem(
                  title: 'Edit Profile',
                  urlIcon: 'assets/ic_edit_profile.png',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  title: 'My Pin',
                  urlIcon: 'assets/ic_mypin.png',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  title: 'Wallet Settings',
                  urlIcon: 'assets/ic_walletsetting.png',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  title: 'My Reward',
                  urlIcon: 'assets/ic_reward.png',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  title: 'Help Center',
                  urlIcon: 'assets/ic_helpcenter.png',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  title: 'Log Out',
                  urlIcon: 'assets/ic_logout.png',
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 87,
          ),
          CustomTextButton(
            title: 'Report a Problem',
            onPressed: () {},
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
