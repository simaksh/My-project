import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/saller-page-controller.dart';

class SellerPageView extends StatelessWidget {
  final SellerPageController controller = Get.put(SellerPageController());
  final TextEditingController _searchController = TextEditingController();

  SellerPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => _showFilterDialog(context),
          icon: const Icon(Icons.filter_list),
          color: Colors.cyan,
        ),
        title: const Text('listProduct'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.cyan),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search_rounded, color: Colors.cyan),
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  // Add your onChanged logic here
                },
              ),
            ),
          ),
          Expanded(
            child: _buildTodoList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.goToAddPage(),
        child: const Icon(
          Icons.add,
          color: Colors.lightGreenAccent,
        ),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    double _minPrice = 1;
    double _maxPrice = 100;
    List<String> selectedColors = [];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('فیلتر قیمت'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('انتخاب محدوده قیمت:'),
                  RangeSlider(
                    values: RangeValues(_minPrice, _maxPrice),
                    min: 0,
                    max: 100,
                    divisions: 100,
                    onChanged: (RangeValues values) {
                      setState(() {
                        _minPrice = values.start;
                        _maxPrice = values.end;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text('انتخاب رنگ‌ها:'),
                  Wrap(
                    spacing: 8,
                    children: _buildColorChips(selectedColors, setState),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Min Price: $_minPrice'),
                      Text('Max Price: $_maxPrice'),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Text('اعمال'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('لغو'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  List<Widget> _buildColorChips(
    List<String> selectedColors,
    Function setState,
  ) {
    final List<String> availableColors = [
      'Red',
      'Blue',
      'Green',
      'Yellow',
      'pinkAccent',
      'greenAccent',
      'teal',
      'deepOrangeAccent'
    ];

    return availableColors.map((color) {
      final bool isSelected = selectedColors.contains(color);
      return InputChip(
        label: Text(color),
        selected: isSelected,
        onPressed: () {
          setState(() {
            if (isSelected) {
              selectedColors.remove(color);
            } else {
              selectedColors.add(color);
            }
          });
        },
        backgroundColor: _getColor(color),
      );
    }).toList();
  }

  Color _getColor(String colorName) {
    switch (colorName) {
      case 'Red':
        return Colors.red;
      case 'Blue':
        return Colors.blue;
      case 'Green':
        return Colors.green;
      case 'Yellow':
        return Colors.yellow;
      case 'pinkAccent':
        return Colors.pinkAccent;
      case 'greenAccent':
        return Colors.greenAccent;
      case 'teal':
        return Colors.teal;
      case 'deepOrangeAccent':
        return Colors.deepOrangeAccent;
      default:
        return Colors.lightGreen;
    }
  }

  Widget _buildTodoList() {
    return RefreshIndicator(
      onRefresh: () => controller.getProduct(),
      child: ListView.builder(
        itemCount: controller.product.length,
        itemBuilder: (context, index) {
          final product = controller.product[index];
          return Card(
            color: Colors.blue.shade100,
            child: ListTile(
              title: Text(product.title),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                  IconButton(
                    onPressed: () => controller.deleteProduct(id: product.id),
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                  IconButton(
                    onPressed: () => controller.goToEditPage(product),
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.orange,
                    ),
                  ),
                  Switch(
                    value: product.isActive,
                    onChanged: (bool newValue) {
                      controller.toggleTodoStatus(product.id, newValue);
                    },
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.red,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
