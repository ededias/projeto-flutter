
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:curso_adm/home/home.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<ToPage>(_onChanged);
  }

  void _onChanged(ToPage event, Emitter emit) {
    print('test');
    emit(state);
  }
}
