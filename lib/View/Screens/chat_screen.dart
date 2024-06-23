import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/Model/Api_method/Show_user_details.dart';
class ChatPage extends StatefulWidget {
    final String user;

   ChatPage({super.key, required this.user,});
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Message> messages = [];
  final TextEditingController chatController = TextEditingController();

  void _sendMessage(String text) {
    if (text.isEmpty) return;
    setState(() {
      messages.add(Message(text, DateTime.now().millisecondsSinceEpoch % 2 == 0));
      chatController.clear();
    });
  }
  void _deleteMessage(int index) {
    setState(() {
      messages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                height: Get.height/7.6,
                width: Get.width,
                color:Color(0xff438E96),
               padding: EdgeInsets.only(left: 10,top:30),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('Group Chat',style:  GoogleFonts.cherrySwash(
                     textStyle: TextStyle(
                       fontSize: 36, fontWeight:FontWeight.w700,
                       color:Colors.white,
                     ),
                   ),),
                   Padding(
                     padding: const EdgeInsets.only(bottom:6),
                     child: Text("Hi,${widget.user}",style:  GoogleFonts.cherrySwash(
                       textStyle: TextStyle(
                         fontSize:19, fontWeight:FontWeight.w400,
                         color:Colors.white,
                       ),
                     ),),
                   ),
                 ],
               ),
              ),
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return InkWell(
                      onTap: (){
                        showAboutDialog(context:context,children:[
                          Container(
                            height:50,
                            width: 50,
                            child: IconButton(onPressed:()=>_deleteMessage(index), icon:Icon(CupertinoIcons.delete)),
                          )
                        ]);
                      },
                      child: ChatBubble(
                        text: message.text,
                        isMe: message.isMe,
                        onDelete: ()=>_deleteMessage(index),
                      ),
                    );
                  },
                ),
              ),
              Divider(
                color:Color(0xff438E96) ,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        decoration: BoxDecoration(
                        ),
                        child: TextField(
                          controller: chatController,
                          decoration: InputDecoration(
                            hintText: 'Enter Message',
                            hintStyle:GoogleFonts.openSans(
                              fontSize: 14,
                                color:Color(0xff438E96),
                              fontWeight:FontWeight.w400,
                            ),
                            prefixIcon:IconButton(onPressed:(){}, icon:Icon(CupertinoIcons.smiley,color:Color(0xff438E96),)),
                            suffixIcon:IconButton(onPressed:(){}, icon:Icon(CupertinoIcons.photo,color:Color(0xff438E96),)) ,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:BorderSide(color:Color(0xff438E96) ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:BorderSide(color:Color(0xff438E96) ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:BorderSide(color:Color(0xff438E96) ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff438E96),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: IconButton(
                        color: Colors.white,
                        icon: Icon(CupertinoIcons.paperplane),
                        onPressed: () => _sendMessage(chatController.text),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;

  Message(this.text, this.isMe);
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final VoidCallback onDelete;

  const ChatBubble({required this.text, required this.isMe, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: isMe ? Radius.circular(12) : Radius.circular(0),
            bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isMe ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}