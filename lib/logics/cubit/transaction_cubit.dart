import 'package:bloc/bloc.dart';
import 'package:bwa_airplane/logics/services/transaction_services.dart';
import 'package:bwa_airplane/models/transaction_model.dart';
import 'package:equatable/equatable.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void createTransaction(TransactionModel transaction) async {
    try {
      emit(TransactionLoading());
      await TransactionServices().createTransaction(transaction);
      emit(TransactionSuccess([]));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  void fetchTransaction() async {
    try {
      emit(TransactionLoading());
      List<TransactionModel> transactions =
          await TransactionServices().fetchTransaction();

      emit(TransactionSuccess(transactions));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }
}
