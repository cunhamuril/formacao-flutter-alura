import 'package:bytebank_2/components/progress.dart';
import 'package:bytebank_2/screens/transaction_form.dart';
import 'package:flutter/material.dart';

import 'package:bytebank_2/models/contact.dart';
import 'package:bytebank_2/screens/contact_form.dart';
import 'package:bytebank_2/database/dao/contact_dao.dart';

class ContactsListPage extends StatefulWidget {
  const ContactsListPage({Key? key}) : super(key: key);

  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  final ContactDao _dao = ContactDao();

  void _handleNavigate() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ContactFormPage()))
        .then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: const [],
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none: // quando não tem future
              break;

            case ConnectionState.waiting: // loading
              return const Progress();

            case ConnectionState
                .active: // tem dado disponível, mas ainda não foi finalizado o future. Tipo um download
              break;

            case ConnectionState.done: // finalizado
              final List<Contact> contacts = snapshot.data!;

              return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];

                  return _ContactItem(
                    contact,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TransactionForm(contact),
                        ),
                      );
                    },
                  );
                },
              );
          }

          return const Text('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleNavigate,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;
  final VoidCallback onTap;

  const _ContactItem(
    this.contact, {
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(
          contact.name,
          style: const TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
