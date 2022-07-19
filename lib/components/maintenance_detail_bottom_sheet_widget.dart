import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaintenanceDetailBottomSheetWidget extends StatefulWidget {
  const MaintenanceDetailBottomSheetWidget({
    Key key,
    this.maintenance,
    this.maintenanceId,
  }) : super(key: key);

  final dynamic maintenance;
  final String maintenanceId;

  @override
  _MaintenanceDetailBottomSheetWidgetState createState() =>
      _MaintenanceDetailBottomSheetWidgetState();
}

class _MaintenanceDetailBottomSheetWidgetState
    extends State<MaintenanceDetailBottomSheetWidget> {
  String isYesValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: Image.asset(
            'assets/images/background.avif',
          ).image,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        border: Border.all(
          color: Color(0xFFBEDA39),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 8, 10, 8),
                child: Container(
                  width: double.infinity,
                  height: 600,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(0xFFBEDA39),
                    ),
                  ),
                  alignment: AlignmentDirectional(-0.9, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 8, 5, 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Material :',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF03073C),
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Text(
                              getJsonField(
                                widget.maintenance,
                                r'''$.materialName''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF03073C),
                                  ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 20,
                          thickness: 2,
                          indent: 16,
                          endIndent: 16,
                          color: Color(0xFFBEDA39),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Checked By : ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF03073C),
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Text(
                              'Sedat Çifttur',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF03073C),
                                  ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 20,
                          thickness: 2,
                          indent: 16,
                          endIndent: 16,
                          color: Color(0xFFBEDA39),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Checked At :',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF03073C),
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Text(
                              functions.formatDateFromData(getJsonField(
                                widget.maintenance,
                                r'''$.checkedTime''',
                              ).toString()),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF03073C),
                                  ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 20,
                          thickness: 2,
                          indent: 16,
                          endIndent: 16,
                          color: Color(0xFFBEDA39),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 5, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Is in Good Condition?',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                  Container(
                                    width: 150,
                                    height: 0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                      border: Border.all(
                                        color: Color(0xFFBEDA39),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 400,
                          decoration: BoxDecoration(),
                          child: FutureBuilder<ApiCallResponse>(
                            future: GetMaintenanceCall.call(
                              id: widget.maintenanceId,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              final columnGetMaintenanceResponse =
                                  snapshot.data;
                              return Builder(
                                builder: (context) {
                                  final listEnt = GetMaintenanceCall.entities(
                                        (columnGetMaintenanceResponse
                                                ?.jsonBody ??
                                            ''),
                                      )?.toList() ??
                                      [];
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(listEnt.length,
                                          (listEntIndex) {
                                        final listEntItem =
                                            listEnt[listEntIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 10, 0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 130,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        getJsonField(
                                                          listEntItem,
                                                          r'''$.checkinName''',
                                                        ).toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                FlutterFlowRadioButton(
                                                  options:
                                                      ['Yes', 'No'].toList(),
                                                  initialValue: 'Yes',
                                                  onChanged: (value) {
                                                    setState(() =>
                                                        isYesValue = value);
                                                  },
                                                  optionHeight: 25,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                      ),
                                                  buttonPosition:
                                                      RadioButtonPosition.left,
                                                  direction: Axis.horizontal,
                                                  radioButtonColor:
                                                      Color(0xFFBEDA39),
                                                  inactiveRadioButtonColor:
                                                      Color(0x8A000000),
                                                  toggleable: false,
                                                  horizontalAlignment:
                                                      WrapAlignment.start,
                                                  verticalAlignment:
                                                      WrapCrossAlignment.start,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
