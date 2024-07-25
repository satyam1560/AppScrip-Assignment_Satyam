import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satyam_assignment/injectible.dart';
import 'package:satyam_assignment/src/features/users/presentation/bloc/users_bloc.dart';
import 'package:satyam_assignment/src/features/users/presentation/pages/user_detail_page.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final _userBloc = getIt<UserBloc>();

  @override
  void initState() {
    _userBloc.add(UserFetched());
    super.initState();
  }
  Future<void> _onRefresh() async {
    _userBloc.add(UserFetched());
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 211, 241),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3850E1),
        title: Text(
          'AppScrip',
          style: textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              'Employee Details',
              style: textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            BlocBuilder<UserBloc, UserState>(
              bloc: _userBloc,
              builder: (context, state) {
                final userList = state.userList;
                if (state.status == UserStatus.success) {
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: _onRefresh,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: userList!.length,
                        itemBuilder: (context, index) {
                          final user = userList[index];
                          return Card(
                            elevation: 0,
                            color: const Color.fromARGB(121, 255, 255, 255),
                            child: ListTile(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => UserDetailPage(
                                    user: user,
                                  ),
                                ),
                              ),
                              title: RichText(
                                text: TextSpan(
                                  text: 'Name: ',
                                  style: textTheme.labelLarge,
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: user.name,
                                      style: textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                              subtitle: RichText(
                                text: TextSpan(
                                  text: 'Email: ',
                                  style: textTheme.labelLarge,
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: user.email,
                                      style: textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
