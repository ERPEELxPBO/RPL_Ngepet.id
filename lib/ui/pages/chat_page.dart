// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngepet_id/cubit/consultation_cubit.dart';
import 'package:ngepet_id/services/user_service.dart';
import 'package:ngepet_id/shared/theme.dart';
import 'package:ngepet_id/ui/pages/chatting_page.dart';
import 'package:ngepet_id/ui/widgets/top_section_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../cubit/auth_cubit.dart';
import '../../models/user_model.dart';
import '../widgets/custom_chat_card.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  _loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId') ??
        ''; // Ganti 'userId' dengan key yang sesuai

    if (userId.isNotEmpty) {
      context.read<AuthCubit>().getCurrentUser(userId);
      context.read<ConsultationCubit>().getConsultations(userId);
    } else {
      // Handle jika userId tidak tersedia
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserService userService = UserService(); // buat objek UserService

    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: Stack(
          children: [
            const TopSectionWidget(
              title: "Pesan",
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 50,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // ... (Widget lainnya)

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pesan Konsultasi",
                          style: mediumTextStyle.copyWith(
                            fontSize: 16,
                            color: kBlackColor,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // Ganti data dengan data yang sesuai dari chat cubit
                        BlocBuilder<ConsultationCubit, ConsultationState>(
                          builder: (context, state) {
                            if (state is ConsultationListLoaded) {
                              return ListView.builder(
                                itemCount: state.consultations.length,
                                itemBuilder: (context, index) {
                                  final consultation =
                                      state.consultations[index];
                                  return FutureBuilder(
                                    future: userService
                                        .getUserById(consultation.receiverId),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const CircularProgressIndicator();
                                      } else if (snapshot.hasError) {
                                        return Text("Error: ${snapshot.error}");
                                      } else {
                                        UserModel user = snapshot.data!;
                                        return CustomChatCard(
                                          imageUrl: user
                                              .imageUrl, // Ganti dengan properti yang sesuai
                                          name: user
                                              .name, // Ganti dengan properti yang sesuai
                                          read:
                                              true, // Ganti dengan properti yang sesuai
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ChatScreen(
                                                  consultationId: consultation
                                                      .consultationId,
                                                  receiverId:
                                                      consultation.receiverId,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    },
                                  );
                                },
                              );
                            } else if (state is ConsultationError) {
                              return Center(
                                child: Text('Error: ${state.errorMessage}'),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // ... (Widget lainnya)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
