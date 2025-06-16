import 'package:counter/Bloc/counter_event.dart';
import 'package:counter/Bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() : super(CounterState(0)){
    on<IncrementEvent>((event, emit){
      emit(CounterState(state.count +1 ));
    });
    on<DecrementEvent>((event, emit) {
      emit(CounterState(state.count -1 ));
    });
  }
}