import 'package:counter/Bloc/counter_event.dart';
import 'package:counter/Bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() : super(CounterState(0)){
    on<IncrementEvent>((event, emit){
      if(state.count <5) {
        emit(CounterState(state.count +1 ));
      }
    });
    on<DecrementEvent>((event, emit) {
      if(state.count >0) {
        emit(CounterState(state.count -1 ));
      }
    });
  }
}