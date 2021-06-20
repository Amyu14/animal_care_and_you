import 'package:flutter/material.dart';
import 'package:dashed_container/dashed_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Models/petStoreAndChemistItem.dart';
import '../Screens/petStoreItemScreen.dart';

class PetStoreItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final petStoreItemData = Provider.of<AmbulanceItem>(context);

    return DashedContainer(
      dashColor: Colors.blueAccent,
      blankLength: 0,
      strokeWidth: 2,
      borderRadius: 9,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 45,
                  child: FittedBox(
                    child: Text(
                      petStoreItemData.name,
                      style: GoogleFonts.oswald(
                        textStyle: Theme.of(context).textTheme.body2,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 6),
                      Text(
                        petStoreItemData.address,
                        style: GoogleFonts.nunito(
                          textStyle: Theme.of(context).textTheme.body2.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.5,
                              ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 6),
                      Text(petStoreItemData.phoneNumber.toString(),
                          style: GoogleFonts.nunito(
                            textStyle:
                                Theme.of(context).textTheme.body2.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.5,
                                    ),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.watch_later),
                      SizedBox(width: 6),
                      Text(
                        petStoreItemData.timings,
                        style: GoogleFonts.nunito(
                          textStyle: Theme.of(context).textTheme.body2.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.5,
                              ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          PetStoreItemScreen(petStoreItemData)));
                },
                child: DashedContainer(
                  dashColor: Colors.blueAccent,
                  blankLength: 0,
                  strokeWidth: 2,
                  borderRadius: 9,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(22))),
                    padding: EdgeInsets.fromLTRB(4, 5, 9, 5),
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        Text(
                          "Learn More",
                          style: GoogleFonts.oswald(
                            textStyle:
                                Theme.of(context).textTheme.body2.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
