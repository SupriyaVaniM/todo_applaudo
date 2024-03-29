import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_applaudo/core/bloc/auth_bloc/auth_token_bloc.dart';
import 'package:todo_applaudo/core/bloc/auth_bloc/auth_token_event.dart';
import 'package:todo_applaudo/core/bloc/auth_bloc/auth_token_state.dart';
import 'package:todo_applaudo/core/models/todo_item.dart';
import 'package:todo_applaudo/ui/style/inter_style.dart';
import 'package:todo_applaudo/ui/style/theme_color.dart';
import 'package:todo_applaudo/ui/views/add_task_page.dart';
import 'package:todo_applaudo/ui/views/dashboard_page.dart';
import 'package:todo_applaudo/ui/widgets/custom_floating_action.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime today = DateTime.now();
  List<TodoItem>? todos;

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
     Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthTokenBloc>(context).add(FetchAutTokenEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(110), // Set this height
          child: _buildTitle()),
      body: BlocBuilder<AuthTokenBloc, AuthTokenState>(
        builder: (context, state) {
          if (state is AuthTokenLoadedState) {
            return const DashboardPage();
          }
          if (state is AuthTokenError) {
            return Center(
              child: Text(state.e.toString()),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: CustomfloatingButton(
          child: const Icon(Icons.add), onPressed: () => _navigateToAddItem()),
    );
  }

  void _navigateToAddItem() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTaskPage()),
    );
  }

  Widget _buildDropDown() {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) => Dialog(
                  child: _buildCalendar(),
                ));
      },
      child: const Icon(Icons.expand_more),
    );
  }

  Widget _buildTitle() => Padding(
        padding: const EdgeInsets.only(top: 56.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildDateandTask(),
                const SizedBox(
                  width: 10,
                ),
                _buildDropDown(),
                const SizedBox(
                  width: 10,
                ),
                _buildCircleAvatar()
              ],
            ),
            const SizedBox(height: 20),
            const Divider(
                thickness: 1,
                height: 0,
                indent: 24,
                endIndent: 24,
                color: ThemeColors.dividerColor),
          ],
        ),
      );

  Widget _buildTasks() => Text(
        "5 complete,5 incomplete",
        style: InterStyle.s4.copyWith(color: ThemeColors.comet),
        textAlign: TextAlign.start,
      );

  Padding _buildCircleAvatar() => const Padding(
        padding: EdgeInsets.only(left: 10),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Image(image: AssetImage('assets/profile.JPG')),
        ),
      );
  Widget _buildDateandTask() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildDate(), _buildTasks()],
      );

  Widget _buildDate() {
    return Text(today.toString().split(" ")[0],
        style: InterStyle.s7.copyWith(color: ThemeColors.licorise));
  }

  Widget _buildCalendar() {
    return Container(
      height: 400,
      child: Center(
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
          focusedDay: today,
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
      ),
    );
  }
}
