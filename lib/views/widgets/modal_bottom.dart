import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:threads/constants/gaps.dart';
import 'package:threads/features/utils.dart';
import 'package:threads/features/view_models/darkmode_config_vm.dart';
import 'package:threads/views/widgets/reporting_thread.dart';

class ModalBottom extends ConsumerStatefulWidget {
  const ModalBottom({super.key});

  @override
  MyWidgetState createState() => MyWidgetState();
}

class MyWidgetState extends ConsumerState {
  bool _showReportScreen = false;
  void _onToggleToReport() {
    setState(() {
      print(_showReportScreen);
      _showReportScreen = !_showReportScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isdark = ref.watch(darkmodeConfigProvider).isdark;
    return Container(
      padding: const EdgeInsets.all(10),
      child: _showReportScreen
          ? const ReportingThread()
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: isdark ? Colors.grey.shade800 : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Unfollow',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(height: 1, color: Colors.grey),
                      ListTile(
                        title: Text(
                          'Mute',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: isdark ? Colors.grey.shade800 : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const ListTile(
                        title: Text(
                          'Hide',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Divider(height: 1, color: Colors.grey),
                      ListTile(
                        title: const Text(
                          'Report',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        onTap: _onToggleToReport,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}