import '../anomaly/anomaly_widget.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AnomalyCreateBottomSheetWidget extends StatefulWidget {
  const AnomalyCreateBottomSheetWidget({Key key}) : super(key: key);

  @override
  _AnomalyCreateBottomSheetWidgetState createState() =>
      _AnomalyCreateBottomSheetWidgetState();
}

class _AnomalyCreateBottomSheetWidgetState
    extends State<AnomalyCreateBottomSheetWidget> {
  ApiCallResponse withSelectDate;
  ApiCallResponse wtihoutSelectDate;
  DateTime datePicked;
  String materialListValue;
  TextEditingController anomalyCauseController;
  bool checkboxListTileValue;

  @override
  void initState() {
    super.initState();
    anomalyCauseController = TextEditingController();
  }

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
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Color(0xFFBEDA39),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFFF1F4F8),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color(0xFF464646),
                      offset: Offset(0, 5),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Color(0xFFBEDA39),
                  ),
                ),
                alignment: AlignmentDirectional(-0.9, 0),
                child: Text(
                  'Select a Material',
                  style: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF03073C),
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 20),
              child: FutureBuilder<ApiCallResponse>(
                future: GetMaterialListCall.call(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  final materialListGetMaterialListResponse = snapshot.data;
                  return FlutterFlowDropDown(
                    options: (getJsonField(
                      (materialListGetMaterialListResponse?.jsonBody ?? ''),
                      r'''$.items..name''',
                    ) as List)
                        .map<String>((s) => s.toString())
                        .toList()
                        .toList(),
                    onChanged: (val) => setState(() => materialListValue = val),
                    width: double.infinity,
                    height: 50,
                    textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF03073C),
                          fontSize: 16,
                        ),
                    fillColor: FlutterFlowTheme.of(context).primaryBtnText,
                    elevation: 2,
                    borderColor: Color(0xFFBEDA39),
                    borderWidth: 0,
                    borderRadius: 12,
                    margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                    hidesUnderline: true,
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 8),
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFFF1F4F8),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color(0xFF464646),
                      offset: Offset(0, 5),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Color(0xFFBEDA39),
                  ),
                ),
                alignment: AlignmentDirectional(-0.9, 0),
                child: Text(
                  'Cause',
                  style: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF03073C),
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
              child: TextFormField(
                controller: anomalyCauseController,
                onChanged: (_) => EasyDebounce.debounce(
                  'anomalyCauseController',
                  Duration(milliseconds: 2000),
                  () => setState(() {}),
                ),
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFBEDA39),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFBEDA39),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF03073C),
                      fontSize: 16,
                    ),
                maxLines: 4,
              ),
            ),
            Theme(
              data: ThemeData(
                unselectedWidgetColor: Color(0xFF95A1AC),
              ),
              child: CheckboxListTile(
                value: checkboxListTileValue ??= false,
                onChanged: (newValue) =>
                    setState(() => checkboxListTileValue = newValue),
                title: Text(
                  'Choose anomaly start date',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                      ),
                ),
                tileColor: Color(0xFFF5F5F5),
                activeColor: FlutterFlowTheme.of(context).primaryColor,
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
              ),
            ),
            if (checkboxListTileValue ?? true)
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Color(0xFFB5D937),
                    borderRadius: 30,
                    borderWidth: 3,
                    buttonSize: 60,
                    icon: FaIcon(
                      FontAwesomeIcons.calendar,
                      color: Color(0xFFBEDA39),
                      size: 30,
                    ),
                    onPressed: () async {
                      await DatePicker.showDateTimePicker(
                        context,
                        showTitleActions: true,
                        onConfirm: (date) {
                          setState(() => datePicked = date);
                        },
                        currentTime: getCurrentTimestamp,
                        minTime: DateTime(0, 0, 0),
                      );
                    },
                  ),
                  if ((datePicked != null))
                    Text(
                      dateTimeFormat('M/d h:mm a', datePicked),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF03073C),
                            fontSize: 18,
                          ),
                    ),
                ],
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  if ((datePicked != null)) {
                    withSelectDate = await AddAnomalyCall.call(
                      cause: anomalyCauseController.text,
                      anomalyStartDate: functions.formatPickedDateToUpdate(
                          dateTimeFormat('yMd', datePicked),
                          dateTimeFormat('Hm', datePicked)),
                      materialName: materialListValue,
                    );
                    if ((withSelectDate?.succeeded ?? true)) {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Success'),
                            content: Text('The anomaly successfully added.'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                      await Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                          reverseDuration: Duration(milliseconds: 0),
                          child: AnomalyWidget(),
                        ),
                        (r) => false,
                      );
                    } else {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Warning'),
                            content: Text(
                                'The anomaly couldn\'t be added. Please try again.'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  } else {
                    wtihoutSelectDate = await AddAnomalyCall.call(
                      materialName: materialListValue,
                      cause: anomalyCauseController.text,
                    );
                    if ((wtihoutSelectDate?.succeeded ?? true)) {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Success'),
                            content: Text('The anomaly successfully added.'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                      await Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                          reverseDuration: Duration(milliseconds: 0),
                          child: AnomalyWidget(),
                        ),
                        (r) => false,
                      );
                    } else {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Warning'),
                            content: Text(
                                'The anomaly couldn\'t be added. Please try again.'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }

                  setState(() {});
                },
                text: 'Add Anomaly',
                options: FFButtonOptions(
                  width: 270,
                  height: 50,
                  color: Color(0xFF03073C),
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 3,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
