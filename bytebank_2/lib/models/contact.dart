class Contact {
  final int id;
  final String name;
  final int accountNumber;

  Contact(
    this.id,
    this.name,
    this.accountNumber,
  );

  Contact.fromJson(Map<String, dynamic> json)
      : id = 0,
        name = json['name'],
        accountNumber = json['accountNumber'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'accountNumber': accountNumber,
    };
  }

  @override
  String toString() {
    return 'Contact: { id: $id, name: $name, accountNumber: $accountNumber }';
  }
}
