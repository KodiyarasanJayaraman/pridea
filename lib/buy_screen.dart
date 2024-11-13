import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pridea/widgets.dart';

class ByeTabView extends StatefulWidget {
  const ByeTabView({super.key});

  @override
  State<ByeTabView> createState() => _ByeTabViewState();
}

class _ByeTabViewState extends State<ByeTabView> {
  TextEditingController searchRadiusController = TextEditingController();
  TextEditingController searchLocationController = TextEditingController();
  bool checkboxValue = false;
  String? selectedPrototype;
  String? selectedAddedToSite;
  String? selectedRadius;
  int? selectBhk;
  int? selectButton;
  RangeValues sliderValue = const RangeValues(0, 100000000);
  List bhkTypeList = [
    '1 RK',
    for (var i = 0; i < 4; i++) '${i + 1} BHK',
    '4+ BHK'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextFieldWidget(
                controller: searchRadiusController,
                hintText: 'Search radius',
              ),
            ),
            searchSelectButton(InkWell(
              onTap: () async {
                final selectValue = await showMenu(
                  context: context,
                  position: const RelativeRect.fromLTRB(100, 100, 30, 100),
                  items: [for (var i = 10; i <= 100; i += 10) '${i}km radius']
                      .map((String value) {
                    return PopupMenuItem(value: value, child: Text(value));
                  }).toList(),
                );
                if (selectValue != null) {
                  setState(() {
                    selectedRadius = selectValue;
                    searchRadiusController.text = selectValue;
                  });
                }
              },
              child: const Icon(
                Icons.arrow_drop_down_outlined,
                color: Colors.white,
              ),
            ))
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Expanded(
              child: TextFieldWidget(
                controller: searchLocationController,
                hintText: 'Search up to 2 Localities or Landmarks',
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: AppColor.iconColor,
                  size: 17,
                ),
              ),
            ),
            searchSelectButton(const Icon(
              Icons.location_searching_outlined,
              color: Colors.white,
              size: 15,
            ))
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Checkbox(
              value: checkboxValue,
              onChanged: (value) {
                setState(() {
                  checkboxValue = value!;
                });
              },
              activeColor: AppColor.primaryBlue,
            ),
            Expanded(
                child: TextWidget(
              text: "Include nearby properties",
              fontSize: 12,
              color: HexColor('#474747'),
            ))
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        TextWidget(
          text: 'Property type',
          color: AppColor.titleColor,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        const SizedBox(
          height: 14,
        ),
        dropDownField(
            selectedPrototype, 'Select ProtoType', ['Detached', 'Attached']),
        const SizedBox(
          height: 25,
        ),
        TextWidget(
          text: 'Added to site',
          color: AppColor.titleColor,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        const SizedBox(
          height: 14,
        ),
        dropDownField(
            selectedAddedToSite, "Select Site", ['Any Time', 'Selected Time']),
        const SizedBox(
          height: 25,
        ),
        TextWidget(
          text: 'BHK Type',
          color: AppColor.titleColor,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        const SizedBox(
          height: 14,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(right: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 17,
              crossAxisSpacing: 36,
              mainAxisExtent: 23),
          itemCount: bhkTypeList.length,
          itemBuilder: (BuildContext context, int index) {
            return ElevatedButton(
              onPressed: () {
                setState(() {
                  selectBhk = index;
                });
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  elevation: 3,
                  backgroundColor: selectBhk == index
                      ? AppColor.primaryBlue
                      : HexColor('#F7F7F7')),
              child: TextWidget(
                  text: bhkTypeList[index],
                  fontSize: 10,
                  color:
                      selectBhk == index ? Colors.white : HexColor("#000000")),
            );
          },
        ),
        const SizedBox(
          height: 25,
        ),
        TextWidget(
          text:
              'Price Range: £${sliderValue.start.round()} - £${sliderValue.end.round()}',
          color: AppColor.titleColor,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        const SizedBox(
          height: 14,
        ),
        RangeSlider(
          values: sliderValue,
          min: 0,
          max: 1000000000,
          labels: RangeLabels(
            sliderValue.start.round().toString(),
            sliderValue.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              sliderValue = values;
            });
          },
          activeColor: AppColor.primaryBlue,
          inactiveColor: Colors.grey[300],
        ),
        const SizedBox(
          height: 25,
        ),
        TextWidget(
          text: 'Looking for “ReadytoMove” properties? ',
          color: AppColor.titleBlack0000,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        const SizedBox(
          height: 14,
        ),
        Row(
          children: List.generate(2, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      print("ggggg$selectButton");
                      selectButton = index;
                      print(selectButton);
                    });
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: selectButton == index
                          ? HexColor('#72B9C333')
                          : Colors.transparent,
                      side: BorderSide(
                          color: selectButton == index
                              ? HexColor('#3EBAABE3').withOpacity(.8)
                              : HexColor('#D8D8D8'))),
                  child: TextWidget(
                    text: index == 0 ? 'Yes' : 'No',
                  )),
            );
          }),
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Container(
                height: 25,
                width: 25,
                padding: EdgeInsets.only(top: 6),
                decoration: BoxDecoration(
                    color: HexColor('#72B9C333'), shape: BoxShape.circle),
                child: SvgPicture.asset(
                  'assets/light_icon.svg',
                  height: 17,
                )),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: 'Looking for something specific?',
                  color: AppColor.titleBlack0000,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(
                  text: 'Add More Filters',
                  color: HexColor('#404466'),
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  dropDownField(String? value, String hintText, List<String> dataList) {
    return DropdownButtonFormField<String>(
      icon: Icon(
        Icons.keyboard_arrow_down_sharp,
        color: AppColor.iconColor,
      ),
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please select one';
        }
        return null;
      },
      value: value,
      items: dataList.map((String value) {
        return DropdownMenuItem(value: value, child: Text(value));
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          value = newValue;
        });
      },
    );
  }
}
