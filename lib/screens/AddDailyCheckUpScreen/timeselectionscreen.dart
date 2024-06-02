import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DatePickerScreen extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const DatePickerScreen({Key? key, required this.onDateSelected})
      : super(key: key);

  @override
  _DatePickerScreenState createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Select Date',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _selectedDate,
            selectedDayPredicate: (day) => isSameDay(day, _selectedDate),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDate = selectedDay;
              });
              widget.onDateSelected(selectedDay);
            },
            calendarStyle: const CalendarStyle(
              defaultTextStyle: TextStyle(color: Colors.black, fontSize: 16),
              weekendTextStyle: TextStyle(color: Colors.red, fontSize: 16),
              selectedDecoration:
                  BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration:
                  BoxDecoration(color: Colors.green, shape: BoxShape.circle),
              todayTextStyle: TextStyle(color: Colors.white),
              outsideTextStyle: TextStyle(color: Colors.grey),
              disabledTextStyle: TextStyle(color: Colors.grey),
            ),
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
              rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
            ),
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              weekendStyle:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class TimePickerScreen extends StatefulWidget {
  final Function(int, int) onTimeSelected;

  const TimePickerScreen({Key? key, required this.onTimeSelected})
      : super(key: key);

  @override
  _TimePickerScreenState createState() => _TimePickerScreenState();
}

class _TimePickerScreenState extends State<TimePickerScreen> {
  int _selectedHour = 1;
  int _selectedMinute = 0;

  final List<int> _hours = List.generate(24, (index) => index);
  final List<int> _minutesSeconds = List.generate(60, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Select Time',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => _showTimePicker(context),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Text(
              '${_selectedHour.toString().padLeft(2, '0')}:${_selectedMinute.toString().padLeft(2, '0')}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  void _showTimePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                // child: Text(
                //   'Select Time',
                //   style: TextStyle(
                //     fontSize: 22,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black,
                //   ),
                // ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CupertinoPicker(
                        itemExtent: 32,
                        onSelectedItemChanged: (int value) {
                          setState(() {
                            _selectedHour = value;
                          });
                          widget.onTimeSelected(value, _selectedMinute);
                        },
                        children: _hours.map((int value) {
                          return Center(
                            child: Text(value.toString().padLeft(2, '0')),
                          );
                        }).toList(),
                      ),
                    ),
                    const Text(':', style: TextStyle(fontSize: 20)),
                    Expanded(
                      child: CupertinoPicker(
                        itemExtent: 32,
                        onSelectedItemChanged: (int value) {
                          setState(() {
                            _selectedMinute = value;
                          });
                          widget.onTimeSelected(_selectedHour, value);
                        },
                        children: _minutesSeconds.map((int value) {
                          return Center(
                            child: Text(value.toString().padLeft(2, '0')),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
