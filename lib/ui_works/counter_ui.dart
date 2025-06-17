import 'package:counter/Bloc/counter_bloc.dart';
import 'package:counter/Bloc/counter_event.dart';
import 'package:counter/Bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterUi extends StatefulWidget {
  const CounterUi({super.key});

  @override
  State<CounterUi> createState() => _CounterUiState();
}

class _CounterUiState extends State<CounterUi> {
  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Counter Example with Bloc",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 100),

            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  '${state.count}',
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                );
              },
            ),

            SizedBox(height: 100),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  splashColor: Colors.white,
                  onTap: () => counterBloc.add(IncrementEvent()),
                  child: BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                      return Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          color: state.count >= 5
                              ? Colors.grey
                              : Colors.blueAccent,
                          gradient: LinearGradient(
                            colors: [
                              state.count >= 5
                                  ? Colors.grey
                                  : Colors.blue.shade500,
                              state.count >= 5
                                  ? Colors.grey
                                  : Colors.blue.shade700,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: state.count >= 5
                                  ? Colors.grey
                                  : Colors.blue,
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.add,
                          color: state.count >= 5 ? Colors.black : Colors.white,
                          size: 40,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 50),
                InkWell(
                  splashColor: Colors.white,

                  onTap: () => counterBloc.add(DecrementEvent()),
                  child: BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                      return Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          color: state.count <= 0
                              ? Colors.grey
                              : Colors.blueAccent,
                          gradient: LinearGradient(
                            colors: [
                              state.count <= 0
                                  ? Colors.grey
                                  : Colors.blue.shade500,
                              state.count <= 0
                                  ? Colors.grey
                                  : Colors.blue.shade700,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: state.count <= 0
                                  ? Colors.grey
                                  : Colors.blue,
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.remove,
                          color: state.count <= 0 ? Colors.black : Colors.white,
                          size: 40,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
