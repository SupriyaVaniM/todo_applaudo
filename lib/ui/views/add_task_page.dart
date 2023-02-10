import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_applaudo/ui/style/inter_style.dart';
import 'package:todo_applaudo/ui/style/theme_color.dart';
import 'package:todo_applaudo/ui/widgets/custom_button.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime? today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          const SizedBox(
            height: 10,
          ),
          const Divider(
              thickness: 1,
              height: 0,
              indent: 24,
              endIndent: 24,
              color: ThemeColors.dividerColor),
          const SizedBox(
            height: 18,
          ),
          _buildTaskTile(),
          _buildCategory(),
          _buildListTile(),
          _buildButton()
        ],
      ),
    );
  }

  Widget _buildNewTask() => Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Text("New Task",
            style: InterStyle.s7.copyWith(color: ThemeColors.licorise)),
      );
  Widget _buildBackButton() => Padding(
        padding: const EdgeInsets.only(top: 76.0, left: 18),
        child: Row(
          children: [
            IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: ThemeColors.blue,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            Text('To go back',
                style: InterStyle.s5.copyWith(color: ThemeColors.blue))
          ],
        ),
      );
  Widget _buildTitle() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildBackButton(), _buildNewTask()],
      );
  Widget _buildButton() => Center(
        child: CustomButton(
          onPressed: () {},
          child: Text('Add'),
        ),
      );
  Widget _buildListTile() => Padding(
        padding: EdgeInsets.all(18.0),
        child: ListTile(
          shape: Border(bottom: BorderSide(color: ThemeColors.licorise)),
          tileColor: ThemeColors.textFieldColor,
          title: Text(
            'When?',
            style: TextStyle(color: ThemeColors.blue),
          ),
          subtitle: Text(today!.toString().split(" ")[0]),
          trailing: IconButton(
            color: ThemeColors.blue,
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => Dialog(
                        child: _buildCalendar(),
                      ));
            },
          ),
        ),
      );
  Widget _buildCategory() => const Padding(
        padding: EdgeInsets.all(18.0),
        child: TextField(
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 28, left: 18, bottom: 28),
              filled: true,
              fillColor: ThemeColors.textFieldColor,
              hintText: 'Category',
              border: UnderlineInputBorder()),
        ),
      );
  Widget _buildTaskTile() => const Padding(
        padding: EdgeInsets.all(18.0),
        child: TextField(
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 28, left: 18, bottom: 28),
              filled: true,
              fillColor: ThemeColors.textFieldColor,
              hintText: 'Title',
              border: UnderlineInputBorder()),
        ),
      );

  Widget _buildCalendar() {
    return Center(
      child: TableCalendar(
        headerStyle: const HeaderStyle(
            leftChevronIcon: Icon(
              Icons.chevron_left,
              color: ThemeColors.licorise,
              size: 28,
            ),
            rightChevronIcon: Icon(
              Icons.chevron_right,
              color: ThemeColors.licorise,
              size: 28,
            ),
            formatButtonVisible: false,
            titleCentered: true),
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: ThemeColors.licorise),
          weekendStyle: TextStyle(color: ThemeColors.licorise),
        ),
        focusedDay: today!,
        firstDay: DateTime.utc(2022, 10, 11),
        lastDay: DateTime.utc(2024, 10, 11),
        locale: 'en_US',
        availableGestures: AvailableGestures.all,
        onDaySelected: _onDaySelected,
        selectedDayPredicate: (day) => (isSameDay(day, today)),
        startingDayOfWeek: StartingDayOfWeek.sunday,
        calendarStyle: const CalendarStyle(
            selectedDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        )),
      ),
    );
  }
}
