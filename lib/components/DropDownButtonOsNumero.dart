import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DropDownButtonOsNumero extends StatefulWidget {
  const DropDownButtonOsNumero({Key? key}) : super(key: key);

  @override
  State<DropDownButtonOsNumero> createState() => _DropDownButtonOsNumeroState();
}

class _DropDownButtonOsNumeroState extends State<DropDownButtonOsNumero> {
  List categoryItemList = [];
  Future getServiceOrders() async {
    const url = 'http://www.relatoriofacil.kinghost.net/api/ordem_servico';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        categoryItemList = jsonData;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getServiceOrders();
  }

  var dropdownvalue;

  String selectedValue(String value) {
    return dropdownvalue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: const Text('Selecione uma OS'),
      items: categoryItemList.map((item) {
        return DropdownMenuItem(
          value: item['osNumero'].toString(),
          child: Text(item['osNumero'].toString()),
        );
      }).toList(),
      onChanged: (newVal) {
        setState(() {
          dropdownvalue = newVal;
          selectedValue(dropdownvalue);
        });
      },
      value: dropdownvalue,
    );
  }
}
