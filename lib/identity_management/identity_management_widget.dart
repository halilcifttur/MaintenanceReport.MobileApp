import '../backend/api_requests/api_calls.dart';
import '../components/role_create_bottom_sheet_widget.dart';
import '../components/role_update_bottom_sheet_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../setttings/setttings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class IdentityManagementWidget extends StatefulWidget {
  const IdentityManagementWidget({Key key}) : super(key: key);

  @override
  _IdentityManagementWidgetState createState() =>
      _IdentityManagementWidgetState();
}

class _IdentityManagementWidgetState extends State<IdentityManagementWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFF3F3F3),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF03073C),
            size: 30,
          ),
          onPressed: () async {
            await Navigator.pushAndRemoveUntil(
              context,
              PageTransition(
                type: PageTransitionType.leftToRight,
                duration: Duration(milliseconds: 300),
                reverseDuration: Duration(milliseconds: 300),
                child: SetttingsWidget(),
              ),
              (r) => false,
            );
          },
        ),
        title: Text(
          'Identity Management',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Color(0xFF03073C),
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: Color(0xFFF4F4F4),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
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
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: Color(0xFFBEDA39),
                        unselectedLabelColor: Color(0xFF03073C),
                        labelStyle:
                            FlutterFlowTheme.of(context).subtitle1.override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF1D2429),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                        indicatorColor: Color(0xFFBEDA39),
                        tabs: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    40, 0, 20, 0),
                                child: Icon(
                                  Icons.person,
                                ),
                              ),
                              Tab(
                                text: 'Users',
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    40, 0, 20, 0),
                                child: Icon(
                                  Icons.rule,
                                ),
                              ),
                              Tab(
                                text: 'Roles',
                              ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 580,
                                  decoration: BoxDecoration(),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 12, 16, 0),
                                          child: FutureBuilder<ApiCallResponse>(
                                            future: GetUsersCall.call(),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final containerGetUsersResponse =
                                                  snapshot.data;
                                              return Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF1F4F8),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4,
                                                      color: Color(0xFF868686),
                                                      offset: Offset(5, 5),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: Color(0xFFBEDA39),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 8, 12, 8),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              (containerGetUsersResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.items[0].name''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle1
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF03073C),
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 0, 12, 8),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Title',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFFBEDA39),
                                                                ),
                                                          ),
                                                          Text(
                                                            getJsonField(
                                                              (containerGetUsersResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.items[0].phoneNumber''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF03073C),
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      285, 10, 0, 0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Color(0xFFBEDA39),
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 60,
                                    fillColor: Color(0xFFBEDA39),
                                    icon: Icon(
                                      Icons.add,
                                      color: Color(0xFF03073C),
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 580,
                                  decoration: BoxDecoration(),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: GetRolesCall.call(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      final listViewGetRolesResponse =
                                          snapshot.data;
                                      return Builder(
                                        builder: (context) {
                                          final roleItems = getJsonField(
                                                (listViewGetRolesResponse
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.items''',
                                              )?.toList() ??
                                              [];
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.vertical,
                                            itemCount: roleItems.length,
                                            itemBuilder:
                                                (context, roleItemsIndex) {
                                              final roleItemsItem =
                                                  roleItems[roleItemsIndex];
                                              return Slidable(
                                                actionPane:
                                                    const SlidableScrollActionPane(),
                                                secondaryActions: [
                                                  IconSlideAction(
                                                    caption: 'Edit',
                                                    color: Color(0xFFBEDA39),
                                                    icon: Icons.construction,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                            child: Container(
                                                              height: 400,
                                                              child:
                                                                  RoleUpdateBottomSheetWidget(
                                                                roleName:
                                                                    getJsonField(
                                                                  roleItemsItem,
                                                                  r'''$.name''',
                                                                ).toString(),
                                                                isDefault:
                                                                    getJsonField(
                                                                  roleItemsItem,
                                                                  r'''$.isDefault''',
                                                                ),
                                                                isPublic:
                                                                    getJsonField(
                                                                  roleItemsItem,
                                                                  r'''$.isPublic''',
                                                                ),
                                                                id: getJsonField(
                                                                  roleItemsItem,
                                                                  r'''$.id''',
                                                                ).toString(),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  IconSlideAction(
                                                    caption: 'Permissions',
                                                    color: Color(0xFFBEDA39),
                                                    icon: Icons.vpn_key,
                                                    onTap: () {
                                                      print(
                                                          'SlidableActionWidget pressed ...');
                                                    },
                                                  ),
                                                ],
                                                child: ListTile(
                                                  title: Text(
                                                    getJsonField(
                                                      roleItemsItem,
                                                      r'''$.name''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF03073C),
                                                        ),
                                                  ),
                                                  trailing: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Color(0xFF03073C),
                                                    size: 20,
                                                  ),
                                                  tileColor: Color(0xFFF5F5F5),
                                                  dense: false,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      285, 10, 0, 0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Color(0xFFBEDA39),
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 60,
                                    fillColor: Color(0xFFBEDA39),
                                    icon: Icon(
                                      Icons.add,
                                      color: Color(0xFF03073C),
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.of(context)
                                                .viewInsets,
                                            child: Container(
                                              height: 400,
                                              child:
                                                  RoleCreateBottomSheetWidget(),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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
