import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/check_index/check_index_bloc.dart';

const String indexName = 'index';

class CheckInStat {
  void addCheckin(int index) async {
    final prefs = await SharedPreferences.getInstance();
    bool isDone = await prefs.setInt(indexName, index);
  }

  Future<void> removeCheckin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(indexName);
    
  }

  Future<int?> getCheckinIndex(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final int? index = prefs.getInt(indexName);
    context.read<CheckIndexBloc>().add(AddNewIndex(index: index));
  }
}
