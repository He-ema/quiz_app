import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz/Constants.dart';
import 'package:quiz/models/user_model.dart';
import 'package:quiz/pages/profile_page.dart';

import '../pages/question_adding_page.dart';

class SideBar extends StatefulWidget {
  SideBar({
    this.email,
    this.updateUi,
    this.logOut,
    this.QuestionIdList = const [],
  });

  String? email;
  VoidCallback? updateUi;
  VoidCallback? logOut;
  List? QuestionIdList;

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int? documentIndex;

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection(KUsersCollection);

    return FutureBuilder<QuerySnapshot>(
        future: users.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          UserModel? currentUser;
          List<UserModel> usersList = [];
          if (snapshot.hasData) {
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              usersList.add(UserModel.fromJson(snapshot.data!.docs[i]));
              if (usersList[i].email == widget.email) {
                currentUser = usersList[i];
                documentIndex = i;
              }
            }
          }

          void updateInfo(name, phone) {
            users.doc(snapshot.data!.docs[documentIndex!].id).update({
              KUsername: name,
              KPhone: phone,
            });
            setState(() {});
          }

          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(snapshot.hasData ? currentUser!.name : ''),
                  accountEmail: Text(widget.email!),
                  currentAccountPicture: CircleAvatar(
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/sky.jpg',
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: KPrimaryColor,
                      image: DecorationImage(
                        image: AssetImage('assets/images/wallpaperbetter.jpg'),
                        fit: BoxFit.cover,
                      )),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ProfilePage.id,
                      arguments: {
                        'CurrentUser': currentUser,
                        'UpdateDataMethod': updateInfo,
                      },
                    );
                  },
                ),
                // ListTile(
                //   leading: Icon(Icons.mark_chat_unread_rounded),
                //   title: Text('Contact with the teacher'),
                //   onTap: () {},
                // ),
                ListTile(
                  leading: Icon(Icons.question_mark),
                  title: Text('add a question'),
                  onTap: () {
                    Navigator.pushNamed(context, QuestionAddingPage.id,
                        arguments: widget.updateUi);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('delete all questions'),
                  onTap: () {
                    CollectionReference questions = FirebaseFirestore.instance
                        .collection(KQuestionCollection);
                    for (int i = 0; i < widget.QuestionIdList!.length; i++) {
                      questions.doc(widget.QuestionIdList![i]).delete();
                    }
                    widget.updateUi!();
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Log out'),
                  onTap: () {
                    widget.logOut!();
                  },
                ),
              ],
            ),
          );
        });
  }
}
