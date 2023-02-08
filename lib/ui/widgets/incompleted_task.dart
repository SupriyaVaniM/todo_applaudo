import 'package:flutter/material.dart';
import 'package:todo_applaudo/ui/widgets/custom_list_tile.dart';

class IncompletedTaskContainer extends StatelessWidget {
  const IncompletedTaskContainer({super.key});


  @override
  Widget build(BuildContext context) {
    return   ListView.builder(
              shrinkWrap: true,
              itemCount:5,
              itemBuilder: (context, i) {
               return CustomListTile(
                  title:'task Incompleted', 
                  subtitle: 'category',
                   onChanged: (value) {
                  
                   }
                  );
              });
  }
}