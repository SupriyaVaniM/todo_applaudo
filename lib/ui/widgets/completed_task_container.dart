import 'package:flutter/material.dart';
import 'package:todo_applaudo/ui/style/inter_style.dart';
import 'package:todo_applaudo/ui/style/theme_color.dart';
import 'package:todo_applaudo/ui/widgets/custom_list_tile.dart';

class CompletedTaskContainer extends StatelessWidget {
  const CompletedTaskContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Completed',
              style: InterStyle.s6.copyWith(color: ThemeColors.comet)),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, i) {
                return CustomListTile(
                    title: 'task completed',
                    subtitle: 'category',
                    onChanged: (value) {});
              }),
        ],
      ),
    );
  }
}
