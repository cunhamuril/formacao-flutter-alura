import 'package:sqflite/sqflite.dart';

import 'package:bytebank_2/database/app_database.dart';
import 'package:bytebank_2/models/contact.dart';

class ContactDao {
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  static const String tableSql =
      'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, name TEXT, account_number INTEGER)';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);

    return db.insert(_tableName, contactMap);
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();

    final List<Map<String, dynamic>> query = await db.query(_tableName);

    List<Contact> contacts = _toList(query);

    return contacts;
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = {};

    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }

  List<Contact> _toList(List<Map<String, dynamic>> query) {
    final List<Contact> contacts = [];

    for (Map<String, dynamic> row in query) {
      final Contact contact = Contact(
        row[_id],
        row[_name],
        row[_accountNumber],
      );

      contacts.add(contact);
    }

    return contacts;
  }
}
