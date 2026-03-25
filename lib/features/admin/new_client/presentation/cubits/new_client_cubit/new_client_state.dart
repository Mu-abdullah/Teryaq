part of 'new_client_cubit.dart';

class NewClientState extends Equatable {
  final int currentPage;

  const NewClientState({required this.currentPage});

  factory NewClientState.initial() => const NewClientState(currentPage: 0);

  NewClientState copyWith({int? currentPage}) {
    return NewClientState(currentPage: currentPage ?? this.currentPage);
  }

  @override
  List<Object> get props => [currentPage];
}
