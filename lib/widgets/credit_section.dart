import 'package:comic_book/models/comic.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreditSection extends StatelessWidget {
  final String title;
  final List<Credit> credits;
  const CreditSection({super.key, required this.credits, required this.title});

  @override
  Widget build(BuildContext context) {
    if (credits.isEmpty) {
      return Container(); // No hay créditos para mostrar
    }

    Widget buildCredits(List<Credit> creditsList) {
      final items = creditsList.map((credit) => Text(credit.name!)).toList();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
        ),
        const Divider(
          height: 5,
          color: Colors.black,
        ),
        if (credits.length <= 4) ...[buildCredits(credits)],
        if (credits.length > 4) ...[
          SizedBox(
            width: 40.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                (credits.length / 4).ceil(),
                (index) {
                  final start = index * 4;
                  final end = start + 4;
                  return Flexible(
                    fit: FlexFit.tight,
                    child: buildCredits(credits.sublist(
                        start, end > credits.length ? credits.length : end)),
                  );
                },
              ),
            ),
          )
        ],
      ],
    );
  }
}
