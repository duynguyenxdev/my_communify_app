import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_communify/assets/assets.dart';
import 'package:my_communify/core/theme/colors/app_color.dart';
import 'package:my_communify/core/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:my_communify/core/widgets/button/button.dart';
import 'package:my_communify/core/widgets/image/svg_image.dart';
import 'package:my_communify/core/widgets/input/input.dart';

class AddConversationBottomSheet extends BottomSheetWidget {
  AddConversationBottomSheet({super.key})
    : super(
        options: BottomSheetOptions(title: 'New Conversation'),
        content: _Content(),
      );
}

class _Content extends ConsumerStatefulWidget {
  const _Content();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContentState();
}

class _ContentState extends ConsumerState<_Content> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColor.watch(ref);

    return Column(
      children: [
        Input(
          placeholder: 'Who you want to chat with?',
          suffix: SvgImage(Assets.icon.search, color: colors.textMuted),
          controller: _textController,
        ),
        SizedBox(height: 12),
        ValueListenableBuilder(
          valueListenable: _textController,
          builder: (context, value, child) {
            return Button(
              title: 'Confirm',
              fullWidth: true,
              enabled: value.text.isNotEmpty,
            );
          },
        ),
      ],
    );
  }
}
