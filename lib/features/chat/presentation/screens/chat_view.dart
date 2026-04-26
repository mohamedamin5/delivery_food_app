import 'package:flutter_application_2/core/ui_essentials.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});

  final List<Map<String, String>> messages = [
    {"text": "Hello, how are you?", "sender": "user"},
    {"text": "I'm good, thanks! How about you?", "sender": "other"},
    {"text": "I'm doing well, just working on a project.", "sender": "other"},
    {
      "text": "That's great to hear! What kind of project is it?",
      "sender": "user",
    },
    {"text": "It's a Flutter app for managing tasks.", "sender": "other"},
    {"text": "Sounds interesting! Good luck with it!", "sender": "user"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              _builderTopAppBar(),
              SizedBox(height: 50.h),
              Expanded(child: _builderChatList(messages)),
              _builderfield(),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _builderTopAppBar() {
    return Row(
      children: [
        CustomCircleButton(
          bgColor: AppColors.greyText,
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.black),
          size: 45,
        ),
        SizedBox(width: 16.w),
        Text(
          "Robert Fox",
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget _builderfield() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Type your message",
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(Icons.send, color: AppColors.primary),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: AppColors.greyText,
      ),
    );
  }

  Widget _builderChatList(List<Map<String, String>> messages) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final isUserMessage = messages[index]["sender"] == "user";

        return Row(
          mainAxisAlignment: isUserMessage
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            if (!isUserMessage) ...[
              CustomCircleButton(
                bgColor: AppColors.greyText,
                icon: Icon(Icons.person),
              ),
            ],

            SizedBox(width: 13.w),
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                margin: EdgeInsets.symmetric(vertical: 25.h),
                decoration: BoxDecoration(
                  color: isUserMessage ? AppColors.primary : AppColors.greyText,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r),
                    bottomLeft: isUserMessage
                        ? Radius.circular(15.r)
                        : Radius.zero,
                    bottomRight: isUserMessage
                        ? Radius.zero
                        : Radius.circular(15.r),
                  ),
                ),
                child: Text(
                  messages[index]["text"]!,
                  style: TextStyle(
                    color: isUserMessage ? Colors.white : Colors.black,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
