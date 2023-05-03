import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessage() {
    const messages = <String>[
      'Cargando Peliculas',
      'Comprando pochoclos',
      'Cargando populares',
      'Llamando a mi novia',
      'Ya casi...',
      'Esto está demorando mas de lo esperado :(',
    ];
    return Stream.periodic(
      const Duration(milliseconds: 1200),
      (computationCount) {
        return messages[computationCount];
      },
    ).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Espere por favor'),
        const SizedBox(
          height: 10,
        ),
        const CircularProgressIndicator(
          strokeWidth: 2,
        ),
        const SizedBox(
          height: 10,
        ),
        StreamBuilder(
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Cargando...');
            return Text(snapshot.data!);
          },
          stream: getLoadingMessage(),
        )
      ]),
    );
  }
}
