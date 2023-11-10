import 'dart:io';
import 'package:customer/components/form_container_widget.dart';
import 'package:customer/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustProfile extends StatefulWidget {
  const CustProfile({super.key});

  @override
  State<CustProfile> createState() => _CustProfileState();
}

class _CustProfileState extends State<CustProfile> {
  File? image;

  Widget buildButton({
    required String title,
    IconData? icon,
    Function()? onClicked,
  }) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          // minimumSize: Size.fromHeight(56),
          primary: kPrimaryColor,
          onPrimary: kPrimaryLightColor,
          // textStyle: TextStyle(fontSize: 20)
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 28,
            ),
            SizedBox(
              width: 16,
            ),
            Text(title),
          ],
        ),
        onPressed: onClicked,
      );

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on Exception catch (e) {
      print('Failed to pick image: $e');
    }
  }

  String dropdownvalue = 'Male';
  List<String> items = ['Male', 'Female', 'Rather not say'];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scrollbar(
      child: SingleChildScrollView(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(children: [
            Text(
              'Customer Profile',
              style: TextStyle(fontSize: defTitleFontSize),
            ),
            image != null
                ? Image.file(
                    image!,
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  )
                : FlutterLogo(size: 160),
            buildButton(
                title: 'Pick from Gallery',
                icon: Icons.image_outlined,
                onClicked: () => pickImage(ImageSource.gallery)),
            SizedBox(height: defaultformspacing),
            buildButton(
                title: 'Pick from Camera',
                icon: Icons.camera_alt_outlined,
                onClicked: () => pickImage(ImageSource.camera)),
            Form(
                child: Column(children: [
              SizedBox(
                height: defaultformspacing,
              ),
              FormContainerWidget(
                hintText: 'First Name',
              ),
              SizedBox(
                height: defaultformspacing,
              ),
              FormContainerWidget(
                hintText: 'Middle Name',
              ),
              SizedBox(
                height: defaultformspacing,
              ),
              FormContainerWidget(
                hintText: 'Last Name',
              ),
              SizedBox(
                height: defaultformspacing,
              ),
              DropdownButtonFormField(
                // dropdownColor: kPrimaryColor.withOpacity(.35),
                hint: Text("Gender"),
                decoration: InputDecoration(
                    fillColor: kPrimaryColor.withOpacity(0.35),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                        width: 1,
                      ),
                    )),

                style: TextStyle(color: Colors.black45),
                value: dropdownvalue,
                icon: Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
              SizedBox(
                height: defaultformspacing,
              ),
              FormContainerWidget(
                hintText: 'Phone Number',
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Address',
                style: TextStyle(fontSize: defTitleFontSize),
              ),
              SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                hintText: 'Province',
              ),
              SizedBox(
                height: defaultformspacing,
              ),
              FormContainerWidget(
                hintText: 'City',
              ),
              SizedBox(
                height: defaultformspacing,
              ),
              FormContainerWidget(
                hintText: 'Baranggay',
              ),
              SizedBox(
                height: defaultformspacing,
              ),
              FormContainerWidget(
                hintText: 'House No.,Street, Subdivision/Village',
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      textStyle: TextStyle(color: kPrimaryLightColor)),
                  child: Text('SUBMIT'))
            ])),
          ])),
    );
  }
}
