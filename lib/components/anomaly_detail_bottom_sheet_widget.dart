import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnomalyDetailBottomSheetWidget extends StatefulWidget {
  const AnomalyDetailBottomSheetWidget({
    Key key,
    this.materialName,
    this.cause,
    this.anomalyStartDate,
    this.action,
    this.maintenanceStartDate,
    this.maintenanceEndDate,
    this.anomalyEndDate,
  }) : super(key: key);

  final String materialName;
  final String cause;
  final String anomalyStartDate;
  final String action;
  final String maintenanceStartDate;
  final String maintenanceEndDate;
  final String anomalyEndDate;

  @override
  _AnomalyDetailBottomSheetWidgetState createState() =>
      _AnomalyDetailBottomSheetWidgetState();
}

class _AnomalyDetailBottomSheetWidgetState
    extends State<AnomalyDetailBottomSheetWidget> {
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
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F4F8),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF464646),
                      )
                    ],
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
                              widget.materialName,
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                          child: Text(
                            'Anomaly Cause :',
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF03073C),
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            AutoSizeText(
                              widget.cause,
                              textAlign: TextAlign.center,
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
                              'Opened By : ',
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
                              'Anomaly Start Date :',
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
                              functions
                                  .formatDateFromData(widget.anomalyStartDate),
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                          child: Text(
                            'Action :',
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF03073C),
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              widget.action,
                              textAlign: TextAlign.center,
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
                              'Solved By :',
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
                              'Maintenance Start Date :',
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
                              functions.formatDateFromData(
                                  widget.maintenanceStartDate),
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
                              'Anomaly End Date :',
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
                              functions
                                  .formatDateFromData(widget.anomalyEndDate),
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
                              'Maintenance End Date :',
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
                              functions.formatDateFromData(
                                  widget.maintenanceEndDate),
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
                              'Total Anomaly Time :',
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
                              '-',
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
                              'Total Maintenance Time :',
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
                              '-',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF03073C),
                                  ),
                            ),
                          ],
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
