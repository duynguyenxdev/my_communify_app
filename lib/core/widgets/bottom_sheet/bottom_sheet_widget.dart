part of 'bottom_sheet_manager.dart';

class BottomSheetWidget extends ConsumerWidget {
  const BottomSheetWidget({
    super.key,
    this.options = const BottomSheetOptions(),
    this.content,
  });

  final BottomSheetOptions options;
  final Widget? content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewPadding = MediaQuery.of(context).viewPadding;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: viewPadding.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: .start,
        children: [
          SizedBox(
            height: 48,
            child: options.title != null
                ? Center(
                    child: Text(
                      options.title!,
                      style: TextStyle(fontSize: 16, fontWeight: .w600),
                    ),
                  )
                : null,
          ),
          SizedBox(height: 16),
          ?content,
        ],
      ),
    );
  }
}
