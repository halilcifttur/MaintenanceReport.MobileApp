import '../backend/api_requests/api_calls.dart';
import '../components/anomaly_create_bottom_sheet_widget.dart';
import '../components/anomaly_detail_bottom_sheet_widget.dart';
import '../components/anomaly_update_bottom_sheet_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../home/home_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class AnomalyWidget extends StatefulWidget {
  const AnomalyWidget({Key key}) : super(key: key);

  @override
  _AnomalyWidgetState createState() => _AnomalyWidgetState();
}

class _AnomalyWidgetState extends State<AnomalyWidget> {
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
          'Anomalies',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  height: 700,
                  child: AnomalyCreateBottomSheetWidget(),
                ),
              );
            },
          );
        },
        backgroundColor: Color(0xFFBEDA39),
        elevation: 8,
        child: Icon(
          Icons.add,
          color: Color(0xFF03073C),
          size: 24,
        ),
      ),
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
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                        indicatorColor: Color(0xFFBEDA39),
                        tabs: [
                          Tab(
                            text: 'Active',
                          ),
                          Tab(
                            text: 'Solved',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 90),
                              child: FutureBuilder<ApiCallResponse>(
                                future: GetAnomalyListCall.call(
                                  anomalyStatus: 0,
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
                                  final listViewGetAnomalyListResponse =
                                      snapshot.data;
                                  return Builder(
                                    builder: (context) {
                                      final activeAnomalyList =
                                          GetAnomalyListCall.items(
                                                (listViewGetAnomalyListResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.toList() ??
                                              [];
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount: activeAnomalyList.length,
                                        itemBuilder:
                                            (context, activeAnomalyListIndex) {
                                          final activeAnomalyListItem =
                                              activeAnomalyList[
                                                  activeAnomalyListIndex];
                                          return Slidable(
                                            actionPane:
                                                const SlidableScrollActionPane(),
                                            secondaryActions: [
                                              IconSlideAction(
                                                caption: 'Update',
                                                color: Color(0xFFBEDA39),
                                                icon: Icons.account_tree_sharp,
                                                onTap: () async {
                                                  showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child: Container(
                                                          height: 700,
                                                          child:
                                                              AnomalyUpdateBottomSheetWidget(
                                                            action:
                                                                getJsonField(
                                                              activeAnomalyListItem,
                                                              r'''$.action''',
                                                            ).toString(),
                                                            isMaintenanceStartDatePicked:
                                                                (getJsonField(
                                                                      activeAnomalyListItem,
                                                                      r'''$.maintenanceStartDate''',
                                                                    ) !=
                                                                    null),
                                                            materialName:
                                                                getJsonField(
                                                              activeAnomalyListItem,
                                                              r'''$.materialName''',
                                                            ).toString(),
                                                            anomalyId:
                                                                getJsonField(
                                                              activeAnomalyListItem,
                                                              r'''$.id''',
                                                            ).toString(),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                  setState(() => FFAppState()
                                                              .maintenanceStartDate =
                                                          functions
                                                              .formatDateFromData(
                                                                  getJsonField(
                                                        activeAnomalyListItem,
                                                        r'''$.maintenanceStartDate''',
                                                      ).toString()));
                                                },
                                              ),
                                            ],
                                            child: ListTile(
                                              title: Text(
                                                getJsonField(
                                                  activeAnomalyListItem,
                                                  r'''$.materialName''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title3,
                                              ),
                                              subtitle: Text(
                                                functions.formatDateFromData(
                                                    getJsonField(
                                                  activeAnomalyListItem,
                                                  r'''$.anomalyStartDate''',
                                                ).toString()),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2,
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Color(0xFF303030),
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 90),
                              child: FutureBuilder<ApiCallResponse>(
                                future: GetAnomalyListCall.call(
                                  anomalyStatus: 2,
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
                                  final listViewGetAnomalyListResponse =
                                      snapshot.data;
                                  return Builder(
                                    builder: (context) {
                                      final solvedAnomalyList =
                                          GetAnomalyListCall.items(
                                                (listViewGetAnomalyListResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.toList() ??
                                              [];
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount: solvedAnomalyList.length,
                                        itemBuilder:
                                            (context, solvedAnomalyListIndex) {
                                          final solvedAnomalyListItem =
                                              solvedAnomalyList[
                                                  solvedAnomalyListIndex];
                                          return Slidable(
                                            actionPane:
                                                const SlidableScrollActionPane(),
                                            secondaryActions: [
                                              IconSlideAction(
                                                caption: 'Details',
                                                color: Color(0xFFBEDA39),
                                                icon:
                                                    Icons.download_done_rounded,
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child: Container(
                                                          height: 600,
                                                          child:
                                                              AnomalyDetailBottomSheetWidget(
                                                            materialName:
                                                                getJsonField(
                                                              solvedAnomalyListItem,
                                                              r'''$.materialName''',
                                                            ).toString(),
                                                            cause: getJsonField(
                                                              solvedAnomalyListItem,
                                                              r'''$.cause''',
                                                            ).toString(),
                                                            anomalyStartDate:
                                                                getJsonField(
                                                              solvedAnomalyListItem,
                                                              r'''$.anomalyStartDate''',
                                                            ).toString(),
                                                            action:
                                                                getJsonField(
                                                              solvedAnomalyListItem,
                                                              r'''$.action''',
                                                            ).toString(),
                                                            maintenanceStartDate:
                                                                getJsonField(
                                                              solvedAnomalyListItem,
                                                              r'''$.maintenanceStartDate''',
                                                            ).toString(),
                                                            maintenanceEndDate:
                                                                getJsonField(
                                                              solvedAnomalyListItem,
                                                              r'''$.maintenanceEndDate''',
                                                            ).toString(),
                                                            anomalyEndDate:
                                                                getJsonField(
                                                              solvedAnomalyListItem,
                                                              r'''$.anomalyEndDate''',
                                                            ).toString(),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                            child: ListTile(
                                              title: Text(
                                                getJsonField(
                                                  solvedAnomalyListItem,
                                                  r'''$.materialName''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title3,
                                              ),
                                              subtitle: Text(
                                                functions.formatDateFromData(
                                                    getJsonField(
                                                  solvedAnomalyListItem,
                                                  r'''$.maintenanceEndDate''',
                                                ).toString()),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2,
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Color(0xFF303030),
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
