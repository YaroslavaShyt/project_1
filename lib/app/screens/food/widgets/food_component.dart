import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_1/app/common/widgets/cached_network_image.dart';
import 'package:project_1/domain/food/ifood.dart';

class FoodComponent extends StatelessWidget {
  final IFood model;
  const FoodComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return kIsWeb ? _buildWeb(context) : _builMobile(context);
  }

  Widget _builMobile(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).canvasColor.withOpacity(0.5),
            spreadRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: [
          Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Row(
                children: [
                  Hero(
                    tag: model.title,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: SizedBox(
                        height: kIsWeb ? 200 : 100,
                        width: kIsWeb ? 200 : 100,
                        child: MainCachedNetworkImage(
                          url: model.picture,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        model.area,
                        style: const TextStyle(fontSize: 15.0),
                      )
                    ],
                  ),
                ],
              )),
          Expanded(
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            RotatedBox(
                quarterTurns: 1,
                child: Container(
                    width: 120,
                    height: 50,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Center(
                        child: Text(
                      model.category,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColorLight),
                    ))))
          ]))
        ],
      ),
    );
  }

  Widget _buildWeb(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).canvasColor.withOpacity(0.5),
            spreadRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Hero(
            tag: model.title,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: SizedBox(
                height: kIsWeb ? 200 : 100,
                width: kIsWeb ? 200 : 100,
                child: MainCachedNetworkImage(
                  url: model.picture,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Text(
            model.title,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
          ),
          Text(
            model.area,
            style: const TextStyle(fontSize: 15.0),
          ),
          Expanded(
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
                width: 120,
                height: 30,
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(25.0)),
                child: Center(
                    child: Text(
                  model.category,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColorLight),
                )))
          ]))
        ],
      ),
    );
  }
}
