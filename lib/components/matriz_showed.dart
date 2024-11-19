import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'package:braille_app/models/ball.dart';
import 'package:braille_app/models/cells_list.dart';

class MatrizShowed extends StatefulWidget {
  const MatrizShowed({super.key});

  @override
  State<MatrizShowed> createState() => _MatrizShowedState();
}

class _MatrizShowedState extends State<MatrizShowed> {
  Future<void> _generateBraillePdf(List<Ball> brailleCells) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Center(
          child: pw.GridView(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            children: brailleCells.map((cell) {
              return pw.Padding(
                padding: const pw.EdgeInsets.all(2),
                child: pw.Text(
                  "●",
                  style: pw.TextStyle(fontSize: 24),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/braille.pdf');
    await file.writeAsBytes(await pdf.save());

    await Printing.sharePdf(bytes: await pdf.save(), filename: 'braille.pdf');
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CellsList>(context);
    final List<Ball> loadedCells = provider.items;
    final ballt = Provider.of<Ball>(context);

    return Column(
      children: [
        // Botão para gerar PDF
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ElevatedButton(
            onPressed: () => _generateBraillePdf(loadedCells),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF208B52),
            ),
            child: const Text(
              "Gerar PDF",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        // Container que exibe a matriz de Braille
        Container(
          height: 200,
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: loadedCells.length,
            itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: loadedCells[i],
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        color: Colors.black,
                        size: 6,
                        ballt.balls1[i] == 1
                            ? Icons.circle
                            : (ballt.balls1[i] == 2 ? null : null),
                      ),
                      Icon(
                        color: Colors.black,
                        size: 6,
                        ballt.balls4[i] == 1
                            ? Icons.circle
                            : (ballt.balls4[i] == 2 ? null : null),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        color: Colors.black,
                        size: 6,
                        ballt.balls2[i] == 1
                            ? Icons.circle
                            : (ballt.balls2[i] == 2 ? null : null),
                      ),
                      Icon(
                        color: Colors.black,
                        size: 6,
                        ballt.balls5[i] == 1
                            ? Icons.circle
                            : (ballt.balls5[i] == 2 ? null : null),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        color: Colors.black,
                        size: 6,
                        ballt.balls3[i] == 1
                            ? Icons.circle
                            : (ballt.balls3[i] == 2 ? null : null),
                      ),
                      Icon(
                        color: Colors.black,
                        size: 6,
                        ballt.balls6[i] == 1
                            ? Icons.circle
                            : (ballt.balls6[i] == 2 ? null : null),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 12.0,
              childAspectRatio: 0.6,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 7.0,
            ),
          ),
        ),
      ],
    );
  }
}
