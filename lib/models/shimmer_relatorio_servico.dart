import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerRelatorioServico extends StatelessWidget {
  const ShimmerRelatorioServico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double containerHeight = 30.0;
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 20),
            padding: const EdgeInsets.only(left: 100, right: 100),
            child: Container(
              height: 60,
              width: 80,
              color: Colors.grey,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 200, top: 5, bottom: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.75,
                      )),
                  child: Container(
                    height: containerHeight,
                    width: 80,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 20, top: 5, bottom: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.75,
                      )),
                  child: Container(
                    height: containerHeight,
                    width: 80,
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20, top: 5, bottom: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.75,
                      )),
                  child: Container(
                    height: containerHeight,
                    width: 80,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 20, top: 5, bottom: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.75,
                      )),
                  child: Container(
                    height: containerHeight,
                    width: 80,
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20, top: 5, bottom: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.75,
                      )),
                  child: Container(
                    height: containerHeight,
                    width: 80,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 20, top: 5, bottom: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.75,
                      )),
                  child: Container(
                    height: containerHeight,
                    width: 80,
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20, top: 5, bottom: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.75,
                      )),
                  child: Container(
                    height: containerHeight,
                    width: 80,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 400,
            margin: const EdgeInsets.only(top: 5, bottom: 20),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black,
                  width: 0.75,
                )),
            child: Container(
              height: containerHeight,
              width: 80,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
