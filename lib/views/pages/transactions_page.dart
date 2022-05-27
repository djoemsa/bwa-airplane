import 'package:bwa_airplane/logics/cubit/transaction_cubit.dart';
import 'package:bwa_airplane/preferences/theme.dart';
import 'package:bwa_airplane/views/widgets/custom_transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../preferences/theme.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccess) {
          if (state.transactions.length == 0) {
            return Center(
              child: Text('No Transaction yet'),
            );
          } else {
            return ListView.builder(
              padding: EdgeInsets.only(
                  left: defaultMargin, right: defaultMargin, bottom: 150),
              itemCount: state.transactions.length,
              itemBuilder: (context, index) {
                return CustomTransactionCard(
                  state.transactions[index],
                );
              },
            );
          }
        }
        return SizedBox();
      },
    );
  }
}
