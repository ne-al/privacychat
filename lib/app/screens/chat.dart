import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:privacychat/core/cache/chat_cache_manger.dart';
import 'package:privacychat/core/services/chat/message/message_service.dart';
import 'package:privacychat/core/services/chat/room/chatroom_service.dart';

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
  final ChatCacheManager chatCacheManager = ChatCacheManager();
  final TextEditingController _messageController = TextEditingController();
  final FocusNode _messageFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  late String receiverPublicKey;
  late String receiverUid;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    chatCacheManager.initCache();
    WidgetsBinding.instance.addObserver(this);
    _init();
  }

  Future<void> _init() async {
    setState(() {
      isLoading = true;
    });

    try {
      Map<String, dynamic> data =
          await ChatRoomService().getReceiverData(widget.roomId);

      receiverPublicKey = data["receiverPublicKey"];
      receiverUid = data["receiverUid"];
    } catch (e) {
      print("Error fetching receiver data: $e");
    }

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
    _scrollToBottom();
  }

  void _scrollToBottom({bool animated = true}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        if (animated) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
          );
        } else {
          _scrollController.jumpTo(
            _scrollController.position.maxScrollExtent,
          );
        }
      }
    });
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    // Triggered when the keyboard appears or disappears
    _scrollToBottom(animated: true);
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
        title: Text(
          "Chat with Receiver", // Placeholder, replace with receiver's name
          style: GoogleFonts.lato(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: StreamBuilder<List<Map<String, dynamic>>>(
                      stream: chatCacheManager
                          .streamAndCacheMessages(widget.roomId),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              "Error: ${snapshot.error}",
                              style: GoogleFonts.lato(color: Colors.red),
                            ),
                          );
                        }

                        final messages = snapshot.data ?? [];

                        if (messages.isEmpty) {
                          return const Center(child: Text("No messages yet."));
                        }

                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _scrollToBottom(animated: false);
                        });

                        return ListView.builder(
                          controller: _scrollController,
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final message = messages[index];
                            final isSentByMe =
                                message['senderUid'] != receiverUid;

                            return Align(
                              alignment: isSentByMe
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: isSentByMe
                                      ? Colors.blue.shade100
                                      : Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: isSentByMe
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      message['message'],
                                      style: GoogleFonts.lato(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    const Gap(4),
                                    Text(
                                      DateFormat('hh:mm a').format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            message['createdAt']),
                                      ),
                                      style: GoogleFonts.lato(
                                        fontSize: 12,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
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
                        const Gap(8),
                        IconButton(
                          onPressed: sendMessage,
                          icon: const Icon(Icons.send),
                          color: Colors.blue,
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
