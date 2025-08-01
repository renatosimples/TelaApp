import 'package:flutter/material.dart';

class ContainerOptions extends StatefulWidget {
  const ContainerOptions({super.key});

  @override
  State<ContainerOptions> createState() => _ContainerOptionsState();
}

class _ContainerOptionsState extends State<ContainerOptions> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.event_seat, color: Colors.black54),
                  const SizedBox(width: 8),
                  const Text(
                    '01',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gabriel Quaquio',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Casaroto',
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ],
          ),

          if (_isExpanded) ...[
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nº bilhete: 43785163'),
                    Text('Linha: RJ x BH'),
                    Text('Serviço: qwertz89'),
                    Text('Data e hora: 15/01/25 - 10:25'),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '01',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildOptionButton(Icons.luggage, Colors.blue, Icons.add),
                const SizedBox(width: 12),
                _buildOptionButton(Icons.luggage, Colors.purple, Icons.add),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildOptionButton(IconData icon, Color color, IconData iconInside) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
      decoration: BoxDecoration(
        color: color.withAlpha(100),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 6),
          Icon(iconInside, color: color),
        ],
      ),
    );
  }
}
