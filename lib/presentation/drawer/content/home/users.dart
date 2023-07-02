// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsps_api_work/global/constants.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        // bloc: widget._homeBloc,
        builder: (BuildContext context, HomeState currentState) =>
            _loadedStateView(state: currentState));
  }

  void _load() {
    BlocProvider.of<HomeBloc>(context)
        .add(LoadMainEvent(RepositoryProvider.of<Repository>(context)));
  }

  Widget _loadedStateView({required HomeState state}) {
    bool fetched = state is HomeDoneState;
    bool loading = state is HomeLoadingState;
    bool initial = state is HomeInitState;
    bool error = state is ErrorHomeState;

    if (fetched) {
      return TableWidget(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: Constants.kdefaultpadding),
            child: TextButton.icon(
              onPressed: () {},
              label: const Text('Query'),
              icon: const Icon(Icons.search_rounded),
            ),
          )
        ],
        title: 'All Custumers',
        row: List.generate(state.user!.length,
            (index) => recentFileDataRow(user: state.user![index])),
        columns: [
          DataColumn(label: Text('id'.toUpperCase())),
          DataColumn(label: Text('Organization Name'.toUpperCase())),
          DataColumn(label: Text('Deployment officer'.toUpperCase()))
        ],
      );
    }

    return TableWidget(
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

  DataRow recentFileDataRow({required CustomerDataModel user}) {
    return DataRow(
      onLongPress: () {},
      cells: [
        DataCell(Text(user.id.toString())),
        DataCell(Text(user.bname!)),
        DataCell(Text(user.oname!)),
      ],
    );
  }
}
