// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:phsps_api_work/global/constants.dart';
import 'package:phsps_api_work/presentation/drawer/content/home/content/query_data.dart';
import 'package:phsps_api_work/presentation/widgets/data_table.dart';

import '../../../../logic/bloc/home_page_bloc/home_bloc.dart';
import '../../../../logic/bloc/home_page_bloc/home_event.dart';
import '../../../../logic/bloc/home_page_bloc/home_state.dart';
import '../../../../logic/repository/repository.dart';
import '../../../../model/dashboard_data_model.dart';

class Users extends StatefulWidget {
  const Users({
    Key? key,
  }) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  String _getDayWithOrdinal(int day) {
    if (day >= 11 && day <= 13) {
      return '${day}th';
    }

    switch (day % 10) {
      case 1:
        return '${day}st';
      case 2:
        return '${day}nd';
      case 3:
        return '${day}rd';
      default:
        return '${day}th';
    }
  }

  String formattedDate(date) {
    return DateFormat("'${_getDayWithOrdinal(date.day)}' 'of' MMMM yyyy")
        .format(date);
  }

  String formattedNumber(number) {
    if (number == '') {
      return '';
    } else {
      return NumberFormat(',###').format(number);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        // bloc: widget._homeBloc,
        builder: (BuildContext context, HomeState currentState) =>
            _loadedStateView(state: currentState));
  }

  void _load() {
    BlocProvider.of<HomeBloc>(context)
        .add(CostumerEvent(RepositoryProvider.of<Repository>(context)));
  }

  Widget _loadedStateView({required HomeState state}) {
    bool fetched = state is CostumerDone;
    bool fetchedSingle = state is SingleCostumerDone;
    bool loading = state is HomeLoadingState;
    bool initial = state is HomeInitState;
    bool error = state is ErrorHomeState;

    if (fetched && (state.user == [])) {
      return TableWidget(
        actions: Row(children: [
          TextButton(
              onPressed: () {
                QueryData.showOptions(context: context);
              },
              child: const Text('Query')),
          TextButton(
              onPressed: () {
                BlocProvider.of<HomeBloc>(context).add(
                    CostumerEvent(RepositoryProvider.of<Repository>(context)));
              },
              child: const Text('Refresh'))
        ]),
        title: 'All Customers',
        child: const Padding(
          padding: EdgeInsets.only(
              top: Constants.kdefaultpadding * 6,
              bottom: Constants.kdefaultpadding * 6),
          child:
              Center(child: Text('No Data Found Corresponding to Query value')),
        ),
      );
    } else if (fetched) {
      return TableWidget(
        actions: Row(children: [
          TextButton(
              onPressed: () {
                QueryData.showOptions(context: context);
              },
              child: const Text('Query')),
        ]),
        title: 'All Custumers',
        row: List.generate(state.user!.length,
            (index) => recentFileDataRow(user: state.user![index])),
        columns: [
          DataColumn(label: Text('id'.toUpperCase())),
          DataColumn(label: Text('Organization Name'.toUpperCase())),
          DataColumn(label: Text('Deployment officer'.toUpperCase())),
          DataColumn(label: Text('Phone 1'.toUpperCase())),
          DataColumn(label: Text('Phone 2'.toUpperCase())),
          DataColumn(label: Text('Location'.toUpperCase())),
          DataColumn(label: Text('Organization Email'.toUpperCase())),
          DataColumn(label: Text('Deployment officer Email'.toUpperCase())),
          DataColumn(label: Text('Project  Status'.toUpperCase())),
          DataColumn(label: Text('Annual Sub (Naira)'.toUpperCase())),
          DataColumn(label: Text('Setup Fee (Naira)'.toUpperCase())),
          DataColumn(label: Text('Renewal Date'.toUpperCase())),
          DataColumn(label: Text('Renewal Month'.toUpperCase())),
          DataColumn(label: Text('Subscription Date'.toUpperCase())),
          DataColumn(label: Text('Created At'.toUpperCase())),
          DataColumn(label: Text('Updated At'.toUpperCase())),
        ],
      );
    } else if (fetchedSingle) {
      return TableWidget(
          actions: Row(children: [
            TextButton(
                onPressed: () {
                  QueryData.showOptions(context: context);
                },
                child: const Text('Query')),
            TextButton(
                onPressed: () {
                  BlocProvider.of<HomeBloc>(context).add(CostumerEvent(
                      RepositoryProvider.of<Repository>(context)));
                },
                child: const Text('Refresh'))
          ]),
          title: 'All Custumers',
          row: List.generate(1, (index) => recentFileDataRow(user: state.user)),
          columns: [
            DataColumn(label: Text('id'.toUpperCase())),
            DataColumn(label: Text('Organization Name'.toUpperCase())),
            DataColumn(label: Text('Deployment officer'.toUpperCase())),
            DataColumn(label: Text('Phone 1'.toUpperCase())),
            DataColumn(label: Text('Phone 2'.toUpperCase())),
            DataColumn(label: Text('Location'.toUpperCase())),
            DataColumn(label: Text('Organization Email'.toUpperCase())),
            DataColumn(label: Text('Deployment officer Email'.toUpperCase())),
            DataColumn(label: Text('Project  Status'.toUpperCase())),
            DataColumn(label: Text('Annual Sub (Naira)'.toUpperCase())),
            DataColumn(label: Text('Setup Fee (Naira)'.toUpperCase())),
            DataColumn(label: Text('Renewal Date'.toUpperCase())),
            DataColumn(label: Text('Renewal Month'.toUpperCase())),
            DataColumn(label: Text('Subscription Date'.toUpperCase())),
            DataColumn(label: Text('Created At'.toUpperCase())),
            DataColumn(label: Text('Updated At'.toUpperCase()))
          ]);
    } else {
      return TableWidget(
        actions: Row(children: [
          TextButton(
              onPressed: () {
                QueryData.showOptions(context: context);
              },
              child: const Text('Query')),
          TextButton(
              onPressed: () {
                BlocProvider.of<HomeBloc>(context).add(
                    CostumerEvent(RepositoryProvider.of<Repository>(context)));
              },
              child: const Text('Refresh'))
        ]),
        title: 'All Customers',
        child: Padding(
          padding: const EdgeInsets.only(
              top: Constants.kdefaultpadding * 6,
              bottom: Constants.kdefaultpadding * 6),
          child: Center(
              child: initial
                  ? const Text('Analyzing System...')
                  : loading
                      ? const CircularProgressIndicator()
                      : error
                          ? Text(state.errorMessage!)
                          : null),
        ),
      );
    }
  }

  DataRow recentFileDataRow({required CustomerDataModel user}) {
    return DataRow(
      onLongPress: () {},
      cells: [
        DataCell(Text(user.id.toString())),
        DataCell(Text(user.bname!)),
        DataCell(Text(user.oname!)),
        DataCell(Text(user.bphone!)),
        DataCell(Text(user.ophone!)),
        DataCell(Text(user.blocation!)),
        DataCell(Text(user.bemail!)),
        DataCell(Text(user.oemail!)),
        DataCell(Text(user.jobStatus!)),
        DataCell(Text((user.annualSub!))),
        DataCell(Text((user.setupFee!))),
        DataCell(Text(user.renewalMonth!)),
        DataCell(Text(user.renewalDate!)),
        DataCell(Text(user.joinDate!)),
        DataCell(Text(formattedDate(user.createdAt))),
        DataCell(Text(formattedDate(user.updatedAt))),
      ],
    );
  }
}
