import 'package:flutter/material.dart';
import 'package:quiz/Constants.dart';
import 'package:quiz/models/user_model.dart';
import 'package:quiz/widgets/custom_button.dart';
import 'package:quiz/widgets/custom_text_form_field.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({
    super.key,
    this.updataUser,
  });
  static String id = 'profile';
  VoidCallback? updataUser;
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    TextEditingController _controller = TextEditingController();
    TextEditingController _controller2 = TextEditingController();
    TextEditingController _controller3 = TextEditingController();

    UserModel userdata = arguments['CurrentUser'];
    _controller.text = userdata.name;
    _controller2.text = userdata.email;
    _controller3.text = userdata.phone;

    return Scaffold(
      backgroundColor: KPrimaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: KPrimaryColor,
        title: Text(
          'Profile',
          style: TextStyle(fontFamily: 'Pacifico'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Builder(builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('name',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    controller: _controller,
                    hintText: 'name',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text('email',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    enabled: false,
                    controller: _controller2,
                    hintText: 'email',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text('Phone',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    controller: _controller3,
                    hintText: 'phone number',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                      onTap: () {
                        updataUser = arguments['UpdateDataMethod'](
                            _controller.text, _controller3.text);
                        Navigator.pop(context);
                      },
                      text: 'Updata Data')
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
