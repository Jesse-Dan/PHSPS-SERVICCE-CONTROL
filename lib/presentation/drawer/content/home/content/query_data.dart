import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsps_api_work/logic/bloc/home_page_bloc/home_event.dart';
import 'package:phsps_api_work/presentation/widgets/overlay_manager.dart';

import '../../../../../logic/bloc/home_page_bloc/home_bloc.dart';
import '../../../../../logic/repository/repository.dart';
import '../../../../widgets/aligin_icon_with_text.dart';

class QueryData {
  static final searchParamValController = TextEditingController();
  static const shp_4 = 'Query by Id';
  static const shp_1 = 'Query by Business Name';
  static const shp_2 = 'Query by Month';
  static const shp_3 = 'Query by Sum';

  static showOptions({Widget? icon, required BuildContext context}) {
    OverlayService.showAlert(
        onCancel: () {
          searchParamValController.clear();
          OverlayService.closeAlert();
        },
        onDone: () {
          BlocProvider.of<HomeBloc>(context).add(SingleCostumerEvent(
              RepositoryProvider.of<Repository>(context),
              query: searchParamValController.text));
          searchParamValController.clear();
          OverlayService.closeAlert();
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CurvyListTile(
              icon: Icons.perm_identity,
              subtitle: '',
              title: shp_4,
              onTap: () {
                OverlayService.showAlert(
                  onCancel: () {
                    searchParamValController.clear();
                    OverlayService.closeAlert();
                  },
                  onDone: () {
                    BlocProvider.of<HomeBloc>(context).add(SingleCostumerEvent(
                        RepositoryProvider.of<Repository>(context),
                        query: searchParamValController.text));
                    searchParamValController.clear();
                    OverlayService.closeAlert();
                  },
                  title: shp_4,
                  child: TextFormField(
                    controller: searchParamValController,
                    obscureText: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a search Param';
                      }
                      // Add additional password validation if needed
                      return null;
                    },
                    decoration: const InputDecoration(labelText: shp_4),
                  ),
                  autoImplyActions: true,
                );
              },
            ),
            CurvyListTile(
              onTap: () => OverlayService.showAlert(
                onCancel: () {
                  searchParamValController.clear();
                  OverlayService.closeAlert();
                },
                onDone: () {
                  searchParamValController.clear();
                  OverlayService.closeAlert();
                },
                title: shp_1,
                child: TextFormField(
                  controller: searchParamValController,
                  obscureText: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a search Param';
                    }
                    // Add additional password validation if needed
                    return null;
                  },
                  decoration: const InputDecoration(labelText: shp_1),
                ),
                autoImplyActions: true,
              ),
              icon: Icons.business_center_sharp,
              subtitle: '',
              title: shp_1,
            ),
            CurvyListTile(
                icon: Icons.calendar_month,
                subtitle: '',
                title: shp_2,
                onTap: () => OverlayService.showAlert(
                      onCancel: () {
                        searchParamValController.clear();
                        OverlayService.closeAlert();
                      },
                      onDone: () {
                        searchParamValController.clear();
                        OverlayService.closeAlert();
                      },
                      title: shp_2,
                      child: TextFormField(
                        controller: searchParamValController,
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a search Param';
                          }
                          // Add additional password validation if needed
                          return null;
                        },
                        decoration: const InputDecoration(labelText: shp_1),
                      ),
                      autoImplyActions: true,
                    )),
            CurvyListTile(
              icon: Icons.summarize_rounded,
              subtitle: '',
              title: shp_3,
              onTap: () => OverlayService.showAlert(
                onCancel: () {
                  searchParamValController.clear();
                  OverlayService.closeAlert();
                },
                onDone: () {
                  searchParamValController.clear();
                  OverlayService.closeAlert();
                },
                title: shp_3,
                child: TextFormField(
                  controller: searchParamValController,
                  obscureText: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a search Param';
                    }
                    // Add additional password validation if needed
                    return null;
                  },
                  decoration: const InputDecoration(labelText: shp_1),
                ),
                autoImplyActions: true,
              ),
            )
          ],
        ),
        title: 'Query Custumer\'s Data');
  }
}

class PopupMenu extends StatelessWidget {
  final List<PopupMenuItemModel> items;
  final Widget icon;

  const PopupMenu({Key? key, required this.items, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<PopupMenuItemModel>(
      icon: icon,
      padding: const EdgeInsets.only(left: 0, right: 120),
      onSelected: (PopupMenuItemModel selectedItem) {
        selectedItem.onTap(); // Invoke the selected item's callback
      },
      itemBuilder: (BuildContext context) {
        return items.map((PopupMenuItemModel item) {
          return PopupMenuItem<PopupMenuItemModel>(
            value: item,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the popup menu
                item.onTap(); // Invoke the selected item's callback
              },
              child: Text(item.title),
            ),
          );
        }).toList();
      },
    );
  }
}

class PopupMenuItemModel {
  final String title;
  final Function onTap;

  PopupMenuItemModel({required this.title, required this.onTap});
}
