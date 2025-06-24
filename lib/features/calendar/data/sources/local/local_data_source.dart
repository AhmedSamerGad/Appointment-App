// ignore_for_file: avoid_print

import 'package:appointments/core/database/database_helper.dart';
import 'package:appointments/features/calendar/data/models/local/local_model.dart';

class LocalDataSource {
  final  DatabaseHelper _databaseHelper ;

  LocalDataSource(this._databaseHelper);

  Future<List<LocalAppointmentModel>> getAllAppointmentsForMonth(DateTime month) async {
    final db = await _databaseHelper.database;
    final startOfMonth = DateTime(month.year, month.month, 1).toIso8601String();
    final endOfMonth = DateTime(month.year, month.month + 1, 1)
        .subtract(const Duration(days: 1))
        .toIso8601String();

    final rows = await db.query(
      DatabaseHelper.appointmentTable,
      where: 'startingDate BETWEEN ? AND ?',
      whereArgs: [startOfMonth, endOfMonth],
    );

    return rows.map((e) => LocalAppointmentModel.fromJson(e)).toList();
  }

Future<void> createAppointment(LocalAppointmentModel apt) async {
  try {
    final db = await _databaseHelper.database;
    final map = apt.toJson(); // Use direct conversion
    
    // Remove appointmentId for new entries
    map.remove('appointmentId');
    
    // Debug log
    print('Creating appointment with data: $map');
    
    // Validate required fields
    if (map['title'] == null || 
        map['startingTime'] == null || 
        map['startingDate'] == null) {
      throw Exception('Required fields missing');
    }
    
    final id = await db.insert(DatabaseHelper.appointmentTable, map);
    print('Created appointment with ID: $id');
    
  } catch (e) {
    print('Error creating appointment: $e');
    rethrow;
  }
}
  Future<List<LocalAppointmentModel>> fetchAppointmentsForDay(DateTime day)async{
    final db = await _databaseHelper.database;
    final isDate = DateTime(day.year , day.month , day.day).toIso8601String().split('T').first;

   final rows = await db.query(
  DatabaseHelper.appointmentTable,
  where: 'startingDate LIKE ?',
  whereArgs: ['%$isDate%'],
);

    return rows.map((e)=>LocalAppointmentModel.fromJson(e)).toList();
  }

  Future<void> updateAppointment(LocalAppointmentModel apt)async{
      print('[LOCAL] Updating appointment: ${apt.toJson()}'); // Debug print

    final db = await _databaseHelper.database;
   final result =  await db.update(DatabaseHelper.appointmentTable,apt.toJson() 
    ,where: 'appointmentId = ?',
    whereArgs: [apt.appointmentId]
    );
  print('[LOCAL] Update result (rows affected): $result'); // Debug print

  }

  Future<void> deleteAppointment (int id) async{
    final db =await _databaseHelper.database;
    await db.delete(DatabaseHelper.appointmentTable,
   where: 'appointmentId = ?',
    whereArgs: [id]  );
  }
  
}