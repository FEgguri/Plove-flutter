import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ttf/component/custom_textfield.dart';
import 'package:ttf/database/drift_database.dart';

class AddContent extends StatefulWidget {
  const AddContent({Key? key}) : super(key: key);

  @override
  State<AddContent> createState() => _AddContentState();
}

class _AddContentState extends State<AddContent> {
  final GlobalKey<FormState> formkey = GlobalKey();
  String? content;
  String? title;

  @override
  Widget build(BuildContext context) {
    final bottominset = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5 + bottominset,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(bottom: bottominset),
            child: Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
              child: Form(
                key: formkey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    CustomText(
                      label: '제목',
                      isTitle: true,
                      onSaved: (String? val) {
                        title = val;
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Expanded(
                      child: CustomText(
                        label: '내용',
                        isTitle: false,
                        onSaved: (String? val) {
                          content = val;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    _SaveButton(
                      onPressed: onSavePressed,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSavePressed() async {
    if (formkey.currentState == null) {
      return;
    }

    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();

      final key = await GetIt.I<LocalDatabase>().createContent(
          ContentsCompanion(
              title: Value(title!), innercontent: Value(content!)));
      Navigator.of(context).pop();
    } else {
      print('error');
    }
  }
}

class _SaveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _SaveButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: Colors.purple[300],
            ),
            child: Text('글 올리기',
            style: TextStyle(
              fontSize: 16.0,

            ),),
          ),
        ),
      ],
    );
  }
}
