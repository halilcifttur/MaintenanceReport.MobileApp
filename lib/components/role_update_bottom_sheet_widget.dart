import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../identity_management/identity_management_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoleUpdateBottomSheetWidget extends StatefulWidget {
  const RoleUpdateBottomSheetWidget({
    Key key,
    this.roleName,
    this.isDefault,
    this.isPublic,
    this.id,
  }) : super(key: key);

  final String roleName;
  final bool isDefault;
  final bool isPublic;
  final String id;

  @override
  _RoleUpdateBottomSheetWidgetState createState() =>
      _RoleUpdateBottomSheetWidgetState();
}

class _RoleUpdateBottomSheetWidgetState
    extends State<RoleUpdateBottomSheetWidget> {
  ApiCallResponse updateRole;
  TextEditingController roleNameController;
  bool isDefaultValue;
  bool isPublicValue;

  @override
  void initState() {
    super.initState();
    roleNameController = TextEditingController(text: widget.roleName);
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Role Name',
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF03073C),
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
              child: TextFormField(
                controller: roleNameController,
                onChanged: (_) => EasyDebounce.debounce(
                  'roleNameController',
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
              ),
            ),
            Theme(
              data: ThemeData(
                unselectedWidgetColor: Color(0xFFBEDA39),
              ),
              child: CheckboxListTile(
                value: isDefaultValue ??= widget.isDefault,
                onChanged: (newValue) =>
                    setState(() => isDefaultValue = newValue),
                title: Text(
                  'Is Default',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF03073C),
                        fontSize: 15,
                      ),
                ),
                tileColor: Color(0xFFF5F5F5),
                activeColor: Color(0xFFBEDA39),
                checkColor: Color(0xFF03073C),
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
              ),
            ),
            Theme(
              data: ThemeData(
                unselectedWidgetColor: Color(0xFFBEDA39),
              ),
              child: CheckboxListTile(
                value: isPublicValue ??= widget.isPublic,
                onChanged: (newValue) =>
                    setState(() => isPublicValue = newValue),
                title: Text(
                  'Is Public',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF03073C),
                        fontSize: 15,
                      ),
                ),
                tileColor: Color(0xFFF5F5F5),
                activeColor: Color(0xFFBEDA39),
                checkColor: Color(0xFF03073C),
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  updateRole = await UpdateRoleCall.call(
                    roleId: widget.id,
                    name: roleNameController.text,
                    isDefault: isDefaultValue,
                    isPublic: widget.isPublic,
                  );
                  if ((updateRole?.succeeded ?? true)) {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Success'),
                          content: Text('The role has been updated.'),
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
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                        reverseDuration: Duration(milliseconds: 0),
                        child: IdentityManagementWidget(),
                      ),
                    );
                  } else {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Warning'),
                          content: Text(
                              'The role couldn\'t been updated. Please try again.'),
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
                text: 'Update Role',
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: 'Dismiss',
                options: FFButtonOptions(
                  width: 270,
                  height: 50,
                  color: Color(0x0003073C),
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFFBEDA39),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
