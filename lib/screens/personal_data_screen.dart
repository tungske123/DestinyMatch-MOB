import 'package:flutter/material.dart';
import 'package:flutter_chats_app/utils/app_colors.dart';

class PersonalDataScreen extends StatelessWidget {
  const PersonalDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Personal Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/Smith.jpg"),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                  height: 35,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/profile_icon.png",
                        height: 18,
                        width: 18,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        "Dear",
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                  height: 35,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/profile_icon.png",
                        height: 18,
                        width: 18,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        "Programmer",
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                  height: 35,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/message_icon.png",
                        height: 18,
                        width: 18,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        "dear@gmail.com",
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                  height: 35,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/gender_icon.png",
                        height: 18,
                        width: 18,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        "male",
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                  height: 35,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/calendar_icon.png",
                        height: 18,
                        width: 18,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        "12/03/2000",
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )),
                  const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: AppColors.secondaryG,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: MaterialButton(
                    onPressed: (){},
                    minWidth: double.maxFinite,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                      250,
                    )),
                    textColor: AppColors.primaryColor1,
                    child: const Text(
                      "Change Passowrd",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: AppColors.primaryG,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: MaterialButton(
                    onPressed: (){},
                    minWidth: double.maxFinite,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                      250,
                    )),
                    textColor: AppColors.primaryColor1,
                    child: const Text(
                      "Edit Personal Data",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
