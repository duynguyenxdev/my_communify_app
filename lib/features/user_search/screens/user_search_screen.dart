import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_communify/core/widgets/error/generic_error.dart';
import 'package:my_communify/core/widgets/loading/circular_loading.dart';
import 'package:my_communify/features/auth/models/user.dart';
import 'package:my_communify/features/user_search/providers/user_search_provider.dart';
import 'package:my_communify/features/user_search/widgets/user_search_list.dart';
import 'package:my_communify/navigation/nav_path.dart';

class UserSearchScreen extends ConsumerStatefulWidget {
  const UserSearchScreen({super.key});

  @override
  ConsumerState<UserSearchScreen> createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends ConsumerState<UserSearchScreen> {
  void _onSearch(String value) async {
    if (value.trim().isEmpty) return;

    await ref.read(userSearchProvider.notifier).searchUsers(value);
  }

  void _onTapItem(User user) {
    context.push(NavPath.chat, extra: user);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userSearchProvider);

    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          autoFocus: true,
          hintText: 'Enter email to search...',
          elevation: WidgetStatePropertyAll(0),
          onSubmitted: _onSearch,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: state.when(
          data: (state) =>
              UserSearchList(users: state.users, onTapItem: _onTapItem),
          error: (error, stackTrace) => GenericError(),
          loading: () => Center(child: CircularLoading()),
        ),
      ),
    );
  }
}
