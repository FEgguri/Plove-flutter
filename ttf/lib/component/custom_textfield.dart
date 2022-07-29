import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String label;
  final bool isTitle;
  final FormFieldSetter<String> onSaved;

  const CustomText({
    required this.label,
    required this.isTitle,
    required this.onSaved,
    Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
        style: TextStyle(
         color: Colors.purple[300],
          fontWeight: FontWeight.w600
        ),),
        if(isTitle) renderTextField(),
        if(!isTitle) Expanded(child: renderTextField()),
      ],
    );
  }
  Widget renderTextField(){
    return TextFormField(
      onSaved: onSaved,

      //null 이 return 되면 에러가 없다.
      //에러가 있으면 String값으로 리턴한다.
      validator: (String? val){


        if(isTitle){
          if(val!.isEmpty){
            return '제목을 입력해주세요';
          }
        }else{
          if(val == null || val.isEmpty){
            return '내용을 입력해주세요';
          }
          if(val.length > 250){
            return '150자 이하의 글자를 입력해주세요';
          }
        }



          return null;
      },
      cursorColor: Colors.grey,
      maxLines: isTitle ? 1 : null,
      maxLength: !isTitle ? 150 : 20,
      expands: !isTitle,
      keyboardType: isTitle ? TextInputType.text : TextInputType.multiline,

      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[300],

      ),
    );
  }

}
