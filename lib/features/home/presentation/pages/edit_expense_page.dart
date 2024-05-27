import 'package:expense_tracker_app/core/themes/app_theme.dart';
import 'package:expense_tracker_app/core/widgets/common_widgets/elevated_add_button_widget.dart';
import 'package:expense_tracker_app/core/widgets/common_widgets/elevated_button_widget.dart';
import 'package:expense_tracker_app/core/widgets/common_widgets/form_textfield_widget.dart';
import 'package:expense_tracker_app/core/widgets/common_widgets/gap_widget.dart';
import 'package:expense_tracker_app/core/widgets/common_widgets/text_fleid_widget.dart';
import 'package:expense_tracker_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

///Stateless widget
class EditExpensePage extends HookConsumerWidget {
  static const routePath = '/EditExpensePage';

  EditExpensePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateAndTimeController = TextEditingController();
    final tittleController = TextEditingController();
    final amountController = TextEditingController();
    final describtionController = TextEditingController();

    // useEffect(() {
    //   Future.delayed(Duration.zero, () {
    //     DateTime now = DateTime.now();

    //     String formattedDate =
    //         DateFormat('dd-MM-yyyy - hh:mm:ss a').format(now);
    //     dateAndTimeController.text = formattedDate;
    //   });
    //   return null;
    // }, []);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).colors.primary,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          "Edit Expence",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                "Date and Time",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            TextFieldWidget(hinttText: "", controller: dateAndTimeController),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                "Tittle",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            TextFieldWidget(
              hinttText: "",
              controller: tittleController,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                "Amount",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            TextFieldWidget(hinttText: "", controller: amountController),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                "Decribtion",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            TextFieldWidget(hinttText: "", controller: describtionController),
            GapWidget.h24(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        child: ElevatedButtonWidget(
          onPressed: () {},
          text: "UPDATE",
        ),
      ),
    );
  }
}



//// DateTime.now().toString();