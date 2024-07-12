import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chats_app/screens/chat_sceen.dart';
import 'package:flutter_chats_app/services/MatchingService.dart';
import 'package:flutter_chats_app/utils/app_colors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AllChatScreen extends StatefulWidget {
  const AllChatScreen({super.key});

  @override
  _AllChatScreenState createState() => _AllChatScreenState();
}

class _AllChatScreenState extends State<AllChatScreen> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final TextEditingController _searchController = TextEditingController();
  Matchingservice matchingservice = Matchingservice();
  List matchings = [];

  @override
  void initState() {
    super.initState();
    _requestPermissionsAndGetToken();
    _listenToNotifications();
    fetchConversation();
  }

  Future<void> _requestPermissionsAndGetToken() async {
    // Request permissions
    final settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Future<void> fetchConversation() async {
    try {
      var data = await matchingservice.getListMatching();
      setState(() {
        matchings = data;
      });
    } catch (e) {
      print("Error fetching conversation: $e");
    }
  }

  void _listenToNotifications() async{
    String? fcmtoken = await _messaging.getToken();
    _storage.write(key: "fcmtoken", value: fcmtoken);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  // Future<String> _getDownloadURL(String urlImg) async {
  //   Reference ref = await FirebaseStorage.instance.ref();
  //   String url = await ref.child(urlImg).getDownloadURL();
  //   return url;
  // }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: media.width * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Chats",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: AppColors.blackColor,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.pen,
                            size: 30,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: media.width * 0.05),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextFormField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: media.width * 0.02),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(thickness: 1),
            ),
            SizedBox(height: media.width * 0.02),
            ListView.builder(
              itemCount: matchings.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final conversation = matchings[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            matchingId: conversation["conversation-id"],
                            matchingName: conversation["participant-full-name"],
                            matchingImage:
                                conversation["participant-avatar-url"].toString(),
                          ),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          conversation["participant-avatar-url"].toString()),
                    ),
                    title: Text(
                      conversation["participant-full-name"],
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      conversation["last-message"],
                      style: const TextStyle(
                        color: AppColors.grayColor,
                      ),
                    ),
                    trailing: Text(conversation["last-message-time"] ?? ""),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
