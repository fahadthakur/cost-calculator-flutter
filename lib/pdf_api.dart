import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import 'cost_review.dart';

class ReviewQuestions {
  String question;
  String option;

  ReviewQuestions(this.question, this.option);
}

class PdfApi {
  static Future<File> generateDocument() async {
    final pdf = Document();

    pdf.addPage(
      MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => <Widget>[
          buildCustomHeadline(),
          SizedBox(height: 20.0),
          buildTable(),
          SizedBox(height: 20.0),
          displayCost(),
        ],
      ),
    );

    return saveDocument(
        name: 'Cost Review ${CostReview.industry}.pdf', pdf: pdf);
  }

  static Widget buildCustomHeadline() => Center(
          child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(border: Border.all(color: PdfColors.indigo)),
        child: Text('Cost Review - ${CostReview.industry}',
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
      ));

  static Widget buildTable() {
    final headers = ['Question', 'Option Chosen'];

    final questions = [];
    CostReview.optionsChosen
        .forEach((k, v) => questions.add(ReviewQuestions(k, v)));
    final data = questions.map((e) => [e.question, e.option]).toList();
    return Table.fromTextArray(
        headers: headers,
        data: data,
        headerStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        cellStyle: TextStyle(fontSize: 14.0));
  }

  static Widget displayCost() {
    final cost = CostReview.estimatedCost;

    return new Text('Total estimated cost: \$$cost',
        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold));
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
