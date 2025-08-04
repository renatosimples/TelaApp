import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tela/components/appbar_theme.dart';
import 'package:tela/components/options_menu.dart';
import 'package:tela/components/container_options.dart';
import 'package:tela/components/class_container.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _appVersion = '';

  @override
  void initState() {
    super.initState();
    _loadAppVersion();
  }

  Future<void> _loadAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = 'v ${packageInfo.version} Android';
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    final passageiros = [
      Passageiro(nome: 'Gabriel Quarquio', numero: '01'),
      Passageiro(nome: 'Daniel Galdino', numero: '02'),
      Passageiro(nome: 'Marcele Cipriano', numero: '03'),
      Passageiro(nome: 'Alan Silva', numero: '04'),
      Passageiro(nome: 'Marcos Paulo', numero: '05'),
    ];

    return Scaffold(
      appBar: const CustomAppBar(userName: 'Gabriel'),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 90),
            child: ListView(
              padding: const EdgeInsets.only(bottom: 16),
              children: [
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: OptionsMenu(),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Seções: Todas', style: TextStyle(fontSize: 16)),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.directions_bus,
                        size: 20,
                        color: Colors.black54,
                      ),
                      SizedBox(width: 8),
                      Text('Embarque', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                ...passageiros.map(
                  (p) => Center(child: ContainerOptions(passageiro: p)),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 70,
              width: double.infinity,
              color: const Color.fromARGB(255, 227, 226, 226),
            ),
          ),
          Positioned(
            bottom: 30,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: const Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Finalizar Embarque',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                _appVersion,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
