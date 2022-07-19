import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../maintenance_check/maintenance_check_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaintenanceCreateBottomSheetWidget extends StatefulWidget {
  const MaintenanceCreateBottomSheetWidget({
    Key key,
    this.maintenanceType,
  }) : super(key: key);

  final int maintenanceType;

  @override
  _MaintenanceCreateBottomSheetWidgetState createState() =>
      _MaintenanceCreateBottomSheetWidgetState();
}

class _MaintenanceCreateBottomSheetWidgetState
    extends State<MaintenanceCreateBottomSheetWidget> {
  ApiCallResponse addedMaintenance;
  String materialNameValue;

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
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 25),
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
                  final materialNameGetMaterialListResponse = snapshot.data;
                  return FlutterFlowDropDown(
                    options: (GetMaterialListCall.itemNames(
                      (materialNameGetMaterialListResponse?.jsonBody ?? ''),
                    ) as List)
                        .map<String>((s) => s.toString())
                        .toList()
                        .toList(),
                    onChanged: (val) => setState(() => materialNameValue = val),
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
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  addedMaintenance = await AddMaintenanceCall.call(
                    materialName: materialNameValue,
                    maintenanceType: widget.maintenanceType,
                  );
                  if ((addedMaintenance?.succeeded ?? true)) {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Success'),
                          content:
                              Text('Maintenance check will begin shortly.'),
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
                        type: PageTransitionType.bottomToTop,
                        duration: Duration(milliseconds: 300),
                        reverseDuration: Duration(milliseconds: 300),
                        child: MaintenanceCheckWidget(
                          maintenanceId: getJsonField(
                            (addedMaintenance?.jsonBody ?? ''),
                            r'''$.id''',
                          ).toString(),
                          materialName: getJsonField(
                            (addedMaintenance?.jsonBody ?? ''),
                            r'''$.materialName''',
                          ).toString(),
                        ),
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
                              'Something went wrong. Please try again later.'),
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

                  setState(() {});
                },
                text: 'Add Maintenance',
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
