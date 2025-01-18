import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.deepOrange,
        title: Expanded(
          child: Center(
            child: Text(
              'History         ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 27.0,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: HistoryPage(),
        ),
      ),
    );
  }
}

class HistoryPage extends StatefulWidget {
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late Future<List<Map<String, dynamic>>> _orders; // لتخزين الطلبات المسترجعة

  @override
  void initState() {
    super.initState();
    _orders = _fetchOrders(); // استدعاء دالة جلب الطلبات عند بدء الصفحة
  }

  Future<List<Map<String, dynamic>>> _fetchOrders() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('authToken'); // استرجاع التوكن من SharedPreferences

    if (token == null) {
      throw Exception('User not authenticated');
    }

    final url = Uri.parse('http://10.0.2.2:8000/api/GetAllOrders');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token', // إرسال التوكن مع الطلب
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body); // تحويل الـ JSON إلى قائمة
      return data.map((order) => order as Map<String, dynamic>).toList(); // تحويل العناصر إلى خريطة
    } else {
      throw Exception('Failed to load orders');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _orders, // ربط الـ Future مع الدالة التي تسترجع البيانات
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator()); // الانتظار
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}')); // في حالة حدوث خطأ
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No orders found.')); // في حالة عدم وجود بيانات
        } else {
          final orders = snapshot.data!;

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Text('Order ID: ${order['id']}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('State: ${order['state']}'),
                      Text('Total Price: \$${order['total_price']}'),
                      Text('Address: ${order['address']}'),
                      Text('Date: ${order['created_at']}'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      // يمكنك إضافة إجراءات عند الضغط على أي من الطلبات، مثل عرض تفاصيل الطلب
                    },
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
