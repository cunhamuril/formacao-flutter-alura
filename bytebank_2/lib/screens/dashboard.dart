import 'package:bytebank_2/components/feature_item.dart';
import 'package:bytebank_2/screens/contacts_list.dart';
import 'package:bytebank_2/screens/transactions_list.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _handleNavigate(Widget page) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                FeatureItem(
                  name: 'Transfer',
                  icon: Icons.monetization_on,
                  onTap: () => _handleNavigate(const ContactsListPage()),
                ),
                FeatureItem(
                  name: 'Transaction Feed',
                  icon: Icons.description,
                  onTap: () => _handleNavigate(TransactionsListPage()),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
