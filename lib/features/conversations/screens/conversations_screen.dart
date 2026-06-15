import 'package:flutter/material.dart';
import 'package:my_communify/core/widgets/bottom_sheet/bottom_sheet_manager.dart';
import 'package:my_communify/core/widgets/button/button.dart';
import 'package:my_communify/core/widgets/input/input.dart';
import 'package:my_communify/features/conversations/widgets/conversations_empty.dart';

class ConversationsScreen extends StatelessWidget {
  const ConversationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConversationsEmpty(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BottomSheetManager.show(
            options: BottomSheetOptions(title: 'New conversation'),
            builder: (context) {
              return Column(
                children: [
                  Input(
                    placeholder: 'Enter email...',
                    suffix: Icon(Icons.search),
                  ),
                  SizedBox(height: 12),
                  Button(title: 'Confirm', fullWidth: true),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
