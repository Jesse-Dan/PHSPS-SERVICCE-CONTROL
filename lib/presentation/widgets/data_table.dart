import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phsps_api_work/global/constants.dart';

class TableWidget extends StatefulWidget {
  final List<DataRow>? row;
  final List<DataColumn>? columns;
  final Widget? actions;
  final String title;
  final Widget? child;

  final int? searchIndex;
  const TableWidget({
    Key? key,
    this.row,
    this.actions,
    this.columns,
    this.searchIndex,
    required this.title,
    this.child,
  }) : super(key: key);

  @override
  State<TableWidget> createState() => TableWidgetState();
}

class TableWidgetState extends State<TableWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.all(Constants.kdefaultpadding),
            padding: const EdgeInsets.all(Constants.kdefaultpadding),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          style: GoogleFonts.dmSans(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: Constants.kdefaultpadding),
                          child: widget.actions??const SizedBox.shrink()
                        ),
                      ),
                    ],
                  ),
                  (widget.child) ??
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          onSelectAll: (all) {},
                          showBottomBorder: true,
                          sortColumnIndex: widget.searchIndex,
                          dataTextStyle: GoogleFonts.dmSans(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          columns: widget.columns!,
                          rows: widget.row!,
                        ),
                      ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
