import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:privacychat/core/services/chat/message/message_service.dart';
import 'package:privacychat/core/services/chat/room/chatroom_service.dart';
import 'package:privacychat/core/services/rsa/rsa_service.dart';

class ChatPage extends StatefulWidget {
  final String roomId;
  const ChatPage({
    super.key,
    required this.roomId,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with WidgetsBindingObserver {
  final TextEditingController _messageController = TextEditingController();
  final FocusNode _messageFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  late String receiverPublicKey;
  late String receiverUid;

  late String? myPrivateKey;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _init();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  Future<void> _init() async {
    setState(() {
      isLoading = true;
    });

    Map<String, dynamic> data =
        await ChatRoomService().getReceiverData(widget.roomId);

    myPrivateKey = await RsaService().getPrivateKey();

    receiverPublicKey = data["receiverPublicKey"];
    receiverUid = data["receiverUid"];

    setState(() {
      isLoading = false;
    });
  }

  Future<void> sendMessage() async {
    if (_messageController.text.trim().isEmpty || isLoading) return;

    MessageService().sendMessage(
      _messageController.text.trim(),
      widget.roomId,
      receiverPublicKey,
      receiverUid,
    );

    _messageController.clear();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 50),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    // Triggered when the keyboard appears or disappears
    if (mounted) {
      _scrollToBottom();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _messageController.dispose();
    _messageFocusNode.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.roomId),
      ),
      body: SafeArea(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Column(
                children: [
                  Expanded(
                    child: StreamBuilder(
                      stream: RsaService().streamAndDecryptMessages(
                          widget.roomId, myPrivateKey!),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Center(child: Text('No messages yet.'));
                        }

                        // Display decrypted messages
                        final messages = snapshot.data!;

                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _scrollToBottom(); // Scroll to the bottom whenever new messages arrive
                        });

                        return ListView.builder(
                          controller: _scrollController,
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final message = messages[index];
                            return ListTile(
                              title: Text(message['message']),
                              subtitle:
                                  Text('Sent by: ${message['senderUid']}'),
                              trailing: Text(
                                  DateTime.fromMillisecondsSinceEpoch(
                                          message['createdAt'])
                                      .toString()),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            focusNode: _messageFocusNode,
                            keyboardType: TextInputType.multiline,
                            enableIMEPersonalizedLearning: false,
                            autofocus: false,
                            obscureText: false,
                            style: GoogleFonts.lato(),
                            onSubmitted: (value) {
                              sendMessage();

                              _messageFocusNode.requestFocus();
                            },
                            textInputAction: TextInputAction.send,
                            minLines: 1,
                            maxLines: 8,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              filled: true,
                              fillColor: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHigh,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              hintText: "Message...",
                              hintStyle: GoogleFonts.lato(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                            ),
                          ),
                        ),
                        Gap(12),
                        GestureDetector(
                          onTap: sendMessage,
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.send_rounded,
                                color: Theme.of(context)
                                    .colorScheme
                                    .outlineVariant,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
