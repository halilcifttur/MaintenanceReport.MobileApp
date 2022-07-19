import '../backend/api_requests/api_calls.dart';
import '../components/maintenance_create_bottom_sheet_widget.dart';
import '../components/maintenance_detail_bottom_sheet_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../home/home_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MaintenanceWidget extends StatefulWidget {
  const MaintenanceWidget({Key key}) : super(key: key);

  @override
  _MaintenanceWidgetState createState() => _MaintenanceWidgetState();
}

class _MaintenanceWidgetState extends State<MaintenanceWidget> {
  ApiCallResponse getDailyMaintenance;
  ApiCallResponse getMonthlyMaintenance;
  ApiCallResponse getYearlyMaintenance;
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
                child: HomeWidget(),
              ),
              (r) => false,
            );
          },
        ),
        title: Text(
          'Maintenance',
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
                  length: 3,
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                child: FaIcon(
                                  FontAwesomeIcons.solidCalendar,
                                ),
                              ),
                              Tab(
                                text: 'Daily',
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                child: FaIcon(
                                  FontAwesomeIcons.calendarDay,
                                ),
                              ),
                              Tab(
                                text: 'Monthly',
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                child: FaIcon(
                                  FontAwesomeIcons.calendarWeek,
                                ),
                              ),
                              Tab(
                                text: 'Yearly',
                              ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: GetMaintenanceListCall.call(
                                        maintenanceType: 0,
                                      ),
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
                                        final listViewGetMaintenanceListResponse =
                                            snapshot.data;
                                        return Builder(
                                          builder: (context) {
                                            final dailyMaintenanceList =
                                                GetMaintenanceListCall.items(
                                                      (listViewGetMaintenanceListResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.toList() ??
                                                    [];
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  dailyMaintenanceList.length,
                                              itemBuilder: (context,
                                                  dailyMaintenanceListIndex) {
                                                final dailyMaintenanceListItem =
                                                    dailyMaintenanceList[
                                                        dailyMaintenanceListIndex];
                                                return Slidable(
                                                  actionPane:
                                                      const SlidableScrollActionPane(),
                                                  secondaryActions: [
                                                    IconSlideAction(
                                                      caption: 'Details',
                                                      color: Color(0xFFBEDA39),
                                                      icon: Icons
                                                          .download_done_rounded,
                                                      onTap: () async {
                                                        getDailyMaintenance =
                                                            await GetMaintenanceCall
                                                                .call(
                                                          id: getJsonField(
                                                            dailyMaintenanceListItem,
                                                            r'''$.id''',
                                                          ).toString(),
                                                        );
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child: Container(
                                                                height: 650,
                                                                child:
                                                                    MaintenanceDetailBottomSheetWidget(
                                                                  maintenance:
                                                                      (getDailyMaintenance
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                  maintenanceId:
                                                                      getJsonField(
                                                                    dailyMaintenanceListItem,
                                                                    r'''$.id''',
                                                                  ).toString(),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );

                                                        setState(() {});
                                                      },
                                                    ),
                                                  ],
                                                  child: ListTile(
                                                    title: Text(
                                                      getJsonField(
                                                        dailyMaintenanceListItem,
                                                        r'''$.materialName''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title3,
                                                    ),
                                                    subtitle: Text(
                                                      functions
                                                          .formatDateFromData(
                                                              getJsonField(
                                                        dailyMaintenanceListItem,
                                                        r'''$.checkedTime''',
                                                      ).toString()),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2,
                                                    ),
                                                    trailing: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Color(0xFF303030),
                                                      size: 20,
                                                    ),
                                                    tileColor:
                                                        Color(0xFFF5F5F5),
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
                                        color: Colors.black,
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
                                                height: 600,
                                                child:
                                                    MaintenanceCreateBottomSheetWidget(
                                                  maintenanceType: 0,
                                                ),
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
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: GetMaintenanceListCall.call(
                                        maintenanceType: 1,
                                      ),
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
                                        final listViewGetMaintenanceListResponse =
                                            snapshot.data;
                                        return Builder(
                                          builder: (context) {
                                            final monthlyMaintenanceList =
                                                GetMaintenanceListCall.items(
                                                      (listViewGetMaintenanceListResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.toList() ??
                                                    [];
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  monthlyMaintenanceList.length,
                                              itemBuilder: (context,
                                                  monthlyMaintenanceListIndex) {
                                                final monthlyMaintenanceListItem =
                                                    monthlyMaintenanceList[
                                                        monthlyMaintenanceListIndex];
                                                return Slidable(
                                                  actionPane:
                                                      const SlidableScrollActionPane(),
                                                  secondaryActions: [
                                                    IconSlideAction(
                                                      caption: 'Details',
                                                      color: Color(0xFFBEDA39),
                                                      icon: Icons
                                                          .download_done_rounded,
                                                      onTap: () async {
                                                        getMonthlyMaintenance =
                                                            await GetMaintenanceCall
                                                                .call(
                                                          id: getJsonField(
                                                            monthlyMaintenanceListItem,
                                                            r'''$.id''',
                                                          ).toString(),
                                                        );
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child: Container(
                                                                height: 650,
                                                                child:
                                                                    MaintenanceDetailBottomSheetWidget(
                                                                  maintenance:
                                                                      (getMonthlyMaintenance
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                  maintenanceId:
                                                                      getJsonField(
                                                                    monthlyMaintenanceListItem,
                                                                    r'''$.id''',
                                                                  ).toString(),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );

                                                        setState(() {});
                                                      },
                                                    ),
                                                  ],
                                                  child: ListTile(
                                                    title: Text(
                                                      getJsonField(
                                                        monthlyMaintenanceListItem,
                                                        r'''$.materialName''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title3,
                                                    ),
                                                    subtitle: Text(
                                                      functions
                                                          .formatDateFromData(
                                                              getJsonField(
                                                        monthlyMaintenanceListItem,
                                                        r'''$.checkedTime''',
                                                      ).toString()),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2,
                                                    ),
                                                    trailing: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Color(0xFF303030),
                                                      size: 20,
                                                    ),
                                                    tileColor:
                                                        Color(0xFFF5F5F5),
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
                                        color: Colors.black,
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
                                                height: 600,
                                                child:
                                                    MaintenanceCreateBottomSheetWidget(
                                                  maintenanceType: 1,
                                                ),
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
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: GetMaintenanceListCall.call(
                                        maintenanceType: 2,
                                      ),
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
                                        final listViewGetMaintenanceListResponse =
                                            snapshot.data;
                                        return Builder(
                                          builder: (context) {
                                            final yearlyMaintenanceList =
                                                GetMaintenanceListCall.items(
                                                      (listViewGetMaintenanceListResponse
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.toList() ??
                                                    [];
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  yearlyMaintenanceList.length,
                                              itemBuilder: (context,
                                                  yearlyMaintenanceListIndex) {
                                                final yearlyMaintenanceListItem =
                                                    yearlyMaintenanceList[
                                                        yearlyMaintenanceListIndex];
                                                return Slidable(
                                                  actionPane:
                                                      const SlidableScrollActionPane(),
                                                  secondaryActions: [
                                                    IconSlideAction(
                                                      caption: 'Details',
                                                      color: Color(0xFFBEDA39),
                                                      icon: Icons
                                                          .download_done_rounded,
                                                      onTap: () async {
                                                        getYearlyMaintenance =
                                                            await GetMaintenanceCall
                                                                .call(
                                                          id: getJsonField(
                                                            yearlyMaintenanceListItem,
                                                            r'''$.id''',
                                                          ).toString(),
                                                        );
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child: Container(
                                                                height: 650,
                                                                child:
                                                                    MaintenanceDetailBottomSheetWidget(
                                                                  maintenance:
                                                                      (getYearlyMaintenance
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                  maintenanceId:
                                                                      getJsonField(
                                                                    yearlyMaintenanceListItem,
                                                                    r'''$.id''',
                                                                  ).toString(),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );

                                                        setState(() {});
                                                      },
                                                    ),
                                                  ],
                                                  child: ListTile(
                                                    title: Text(
                                                      getJsonField(
                                                        yearlyMaintenanceListItem,
                                                        r'''$.materialName''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title3,
                                                    ),
                                                    subtitle: Text(
                                                      functions
                                                          .formatDateFromData(
                                                              getJsonField(
                                                        yearlyMaintenanceListItem,
                                                        r'''$.checkedTime''',
                                                      ).toString()),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2,
                                                    ),
                                                    trailing: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Color(0xFF303030),
                                                      size: 20,
                                                    ),
                                                    tileColor:
                                                        Color(0xFFF5F5F5),
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
                                        color: Colors.black,
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
                                                height: 600,
                                                child:
                                                    MaintenanceCreateBottomSheetWidget(
                                                  maintenanceType: 2,
                                                ),
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
