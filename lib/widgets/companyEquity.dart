import 'package:assignment_work/model/overview_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class CompEquityInf extends StatelessWidget {
  Overview o;
  CompEquityInf(this.o);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sector'),
              Row(
                children: [
                  Icon(
                    Iconsax.bank,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(o.Sector!),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Industry'),
              Row(
                children: [
                  Icon(Iconsax.bank),
                  SizedBox(
                    width: 10,
                  ),
                  Text(o.Industry!),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Market Cap'),
              Text(
                "₹" + NumberFormat.compact().format(o.MarketCap),
                style: TextStyle(
                    color: o.MarketCap! > 0.0 ? Colors.green : Colors.red),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Enterprise Value (EV)'),
              o.EV != null
                  ? Text(NumberFormat.compact().format(o.EV))
                  : Text('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Book Value/Share'),
              Text(o.BookNavPerShare!.toStringAsFixed(2)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price-Earning Ratio'),
              Text(o.TTMPE!.toStringAsFixed(2)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('PEG Ratio'),
              Text(o.PEGRatio!.toStringAsFixed(2)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dividend Yield'),
              Text(o.Yield!.toStringAsFixed(2)),
            ],
          ),
        ],
      ),
    );
  }
}
