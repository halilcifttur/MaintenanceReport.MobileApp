import '../anomaly/anomaly_widget.dart';
import '../backend/api_requests/api_calls.dart';
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

class AnomalyUpdateBottomSheetWidget extends StatefulWidget {
  const AnomalyUpdateBottomSheetWidget({
    Key key,
    this.action,
    this.isMaintenanceStartDatePicked,
    this.materialName,
    this.anomalyId,
  }) : super(key: key);

  final String action;
  final bool isMaintenanceStartDatePicked;
  final String materialName;
  final String anomalyId;

  @override
  _AnomalyUpdateBottomSheetWidgetState createState() =>
      _AnomalyUpdateBottomSheetWidgetState();
}

class _AnomalyUpdateBottomSheetWidgetState
    extends State<AnomalyUpdateBottomSheetWidget> {
  ApiCallResponse withSelectEndDate;
  ApiCallResponse withoutSelectEndDate;
  ApiCallResponse withoutPickEndDate;
  ApiCallResponse withSelectStartDate;
  ApiCallResponse withouthSelectStartDate;
  ApiCallResponse withouthPickStartDate;
  DateTime datePicked1;
  TextEditingController textController;
  bool isMaintenanceStartDatePickedValue;
  bool isSolvedValue;
  DateTime datePicked2;
  bool isMaintenanceEndDatePickedValue;

  @override
  void initState() {
    super.initState();
    textController =
        TextEditingController(text: functions.textNullCheck(widget.action));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
        image: DecorationImage(
          fit: BoxFit.cover,
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
        padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  widget.materialName,
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
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Text(
                'Action',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Outfit',
                      color: Color(0xFF03073C),
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
              child: TextFormField(
                controller: textController,
                onChanged: (_) => EasyDebounce.debounce(
                  'textController',
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
                unselectedWidgetColor: Color(0xFF03073C),
              ),
              child: CheckboxListTile(
                value: isMaintenanceStartDatePickedValue ??=
                    widget.isMaintenanceStartDatePicked,
                onChanged: (newValue) => setState(
                    () => isMaintenanceStartDatePickedValue = newValue),
                title: Text(
                  'Choose maintenance start date',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF03073C),
                        fontSize: 15,
                      ),
                ),
                tileColor: Color(0xFF03073C),
                activeColor: Color(0xFFBEDA39),
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
              ),
            ),
            if (isMaintenanceStartDatePickedValue ?? true)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Row(
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
                            setState(() => datePicked1 = date);
                          },
                          currentTime: getCurrentTimestamp,
                          minTime: DateTime(0, 0, 0),
                        );

                        setState(() => FFAppState().maintenanceStartDate =
                            functions.formatDateFromPicked(
                                dateTimeFormat('yMd', datePicked1),
                                dateTimeFormat('Hm', datePicked1)));
                      },
                    ),
                    if ((FFAppState().maintenanceStartDate) != 'null')
                      Text(
                        FFAppState().maintenanceStartDate,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF03073C),
                              fontSize: 18,
                            ),
                      ),
                  ],
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(100, 8, 100, 0),
              child: Theme(
                data: ThemeData(
                  unselectedWidgetColor: Color(0xFF03073C),
                ),
                child: CheckboxListTile(
                  value: isSolvedValue ??= false,
                  onChanged: (newValue) =>
                      setState(() => isSolvedValue = newValue),
                  title: Text(
                    'Is Solved ?',
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF03073C),
                          fontSize: 15,
                        ),
                  ),
                  tileColor: Color(0xFF03073C),
                  activeColor: Color(0xFFBEDA39),
                  dense: false,
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                ),
              ),
            ),
            if (isSolvedValue ?? true)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Color(0xFF03073C),
                      ),
                      child: CheckboxListTile(
                        value: isMaintenanceEndDatePickedValue ??= false,
                        onChanged: (newValue) => setState(
                            () => isMaintenanceEndDatePickedValue = newValue),
                        title: Text(
                          'Choose maintenance end date',
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF03073C),
                                fontSize: 15,
                              ),
                        ),
                        tileColor: Color(0xFF03073C),
                        activeColor: Color(0xFFBEDA39),
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                    if (isMaintenanceEndDatePickedValue ?? true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Row(
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
                                    setState(() => datePicked2 = date);
                                  },
                                  currentTime: getCurrentTimestamp,
                                  minTime: DateTime(0, 0, 0),
                                );
                              },
                            ),
                            if ((datePicked2 != null))
                              Text(
                                dateTimeFormat('M/d h:mm a', datePicked2),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF03073C),
                                      fontSize: 18,
                                    ),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      if (isMaintenanceStartDatePickedValue) {
                        if ((datePicked1 != null)) {
                          if (isSolvedValue) {
                            if (isMaintenanceEndDatePickedValue) {
                              if ((datePicked2 != null)) {
                                withSelectEndDate =
                                    await UpdateAnomalyCall.call(
                                  anomalyId: widget.anomalyId,
                                  status: 2,
                                  action: textController.text,
                                  anomalyEndDate:
                                      functions.formatPickedDateToUpdate(
                                          dateTimeFormat('yMd', datePicked2),
                                          dateTimeFormat('Hm', datePicked2)),
                                  maintenanceStartDate:
                                      functions.formatPickedDateToUpdate(
                                          dateTimeFormat('yMd', datePicked1),
                                          dateTimeFormat('Hm', datePicked1)),
                                  maintenanceEndDate:
                                      functions.formatPickedDateToUpdate(
                                          dateTimeFormat('yMd', datePicked2),
                                          dateTimeFormat('Hm', datePicked2)),
                                );
                                if ((withSelectEndDate?.succeeded ?? true)) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Success'),
                                        content:
                                            Text('Anomaly has been solved.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
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
                                      reverseDuration:
                                          Duration(milliseconds: 0),
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
                                            'A problem has occured. Please try again later.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              } else {
                                withoutSelectEndDate =
                                    await UpdateAnomalyCall.call(
                                  anomalyId: widget.anomalyId,
                                  status: 2,
                                  action: textController.text,
                                  maintenanceStartDate:
                                      functions.formatPickedDateToUpdate(
                                          dateTimeFormat('yMd', datePicked1),
                                          dateTimeFormat('Hm', datePicked1)),
                                );
                                if ((withoutSelectEndDate?.succeeded ?? true)) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Success'),
                                        content:
                                            Text('Anomaly has been solved.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
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
                                      reverseDuration:
                                          Duration(milliseconds: 0),
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
                                            'A problem has occured. Please try again later.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              }
                            } else {
                              withoutPickEndDate = await UpdateAnomalyCall.call(
                                anomalyId: widget.anomalyId,
                                status: 2,
                                action: textController.text,
                                maintenanceStartDate:
                                    functions.formatPickedDateToUpdate(
                                        dateTimeFormat('yMd', datePicked1),
                                        dateTimeFormat('Hm', datePicked1)),
                              );
                              if ((withoutPickEndDate?.succeeded ?? true)) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Success'),
                                      content: Text('Anomaly has been solved.'),
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
                                          'A problem has occured. Please try again later.'),
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
                          } else {
                            withSelectStartDate = await UpdateAnomalyCall.call(
                              anomalyId: widget.anomalyId,
                              status: 1,
                              action: textController.text,
                              maintenanceStartDate:
                                  functions.formatPickedDateToUpdate(
                                      dateTimeFormat('yMd', datePicked1),
                                      dateTimeFormat('Hm', datePicked1)),
                            );
                            if ((withSelectStartDate?.succeeded ?? true)) {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Success'),
                                    content: Text(
                                        'Anomaly action added and maintenance has started  but the anomaly has not yet solved.'),
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
                                        'A problem has occured. Please try again later.'),
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
                        } else {
                          withouthSelectStartDate =
                              await UpdateAnomalyCall.call(
                            anomalyId: widget.anomalyId,
                            status: 1,
                            action: textController.text,
                          );
                          if ((withouthSelectStartDate?.succeeded ?? true)) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Succcess'),
                                  content: Text(
                                      'Anomaly action added and maintenance has started  but the anomaly has not yet solved.'),
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
                                      'A problem has occured. Please try again later.'),
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
                      } else {
                        withouthPickStartDate = await UpdateAnomalyCall.call(
                          anomalyId: widget.anomalyId,
                          status: 1,
                          action: textController.text,
                        );
                        if ((withouthPickStartDate?.succeeded ?? true)) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Succcess'),
                                content: Text(
                                    'Anomaly action added and maintenance has started  but the anomaly has not yet solved.'),
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
                                    'A problem has occured. Please try again later.'),
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
                    text: 'Update Anomaly',
                    options: FFButtonOptions(
                      width: 270,
                      height: 50,
                      color: Color(0xFF03073C),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
