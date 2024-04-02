import 'package:flutter/material.dart';
import 'package:flutter_resource_gallery/controller/supabase_controller.dart';
import 'package:flutter_resource_gallery/res/constants.dart';
import 'package:flutter_resource_gallery/view/home/components/category_dropdown_widget.dart';
import 'package:flutter_resource_gallery/view/home/components/custom_button.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../res/responsive.dart';
import '../../../res/size_helpers.dart';

class SubmissionFrom extends StatefulWidget {
  const SubmissionFrom({Key? key});

  @override
  State<SubmissionFrom> createState() => _SubmissionFromState();
}

class _SubmissionFromState extends State<SubmissionFrom> {
  var controller = Get.find<SupabaseController>();
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  var selectedCategory; // Default selected category
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  TextEditingController _urlController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers when not needed
    _titleController.dispose();
    _contentController.dispose();
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      extraLargeScreen: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: displayHeight(context) * 0.55,
        width: displayWidth(context) * 0.30,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: iconColor, width: 2),
            gradient: LinearGradient(
                colors: [bgColor, cardColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Obx(
          () => controller.isSubmitted.value == false
              ? Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey, // Set form key
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Submit Resources',
                                    style: titleText(24, textColor)),
                                SizedBox(height: 16.0),
                                TextFormField(
                                  controller: _titleController,
                                  decoration: InputDecoration(
                                    hoverColor: textColor,
                                    labelText: "Enter Title",
                                    hintStyle: normalText(16, iconColor),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                      borderSide: BorderSide(color: textColor),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Title cannot be empty';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                  style: normalText(16, textColor),
                                ),
                                SizedBox(height: 16.0),
                                TextFormField(
                                  controller: _contentController,
                                  decoration: InputDecoration(
                                    hoverColor: textColor,
                                    labelText: "Enter content",
                                    fillColor: textColor,
                                    hintStyle: normalText(16, iconColor),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                      borderSide: BorderSide(color: textColor),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Content cannot be empty';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                  style: normalText(16, textColor),
                                ),
                                SizedBox(height: 16.0),
                                TextFormField(
                                  controller: _urlController,
                                  decoration: InputDecoration(
                                    hoverColor: textColor,
                                    labelText: "Enter source url",
                                    fillColor: textColor,
                                    hintStyle: normalText(16, iconColor),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                      borderSide: BorderSide(color: textColor),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'URL cannot be empty';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                  style: normalText(16, textColor),
                                ),
                                SizedBox(height: 16.0),
                                CategoriesDropdown(
                                  selectedCategory: selectedCategory,
                                  onChanged: (String? newVal) {
                                    setState(() {
                                      selectedCategory = newVal;
                                    });
                                  },
                                ),
                                SizedBox(height: 16.0),
                                CustomButton(
                                  textColor: bgColor,
                                  textSize: 24,
                                  text: "Submit Resource",
                                  onPressed: () async {
                                    // Validate form fields
                                    if (_formKey.currentState!.validate()) {
                                      // Form fields are valid, submit the resource
                                      print(
                                          'Form is valid. Submitting resource...');
                                      // You can submit the resource here
                                      await _submitResource(context);
                                    } else {
                                      // Form fields are invalid, show error message
                                      print(
                                          'Form is invalid. Please correct errors.');
                                    }
                                  },
                                  color: textColor,
                                  height: displayHeight(context) * 0.06,
                                  width: displayWidth(context),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Center(child: Lottie.asset("success.json")),
        ),
      ),
      desktop: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: displayHeight(context) * 0.60,
        width: displayWidth(context) * 0.30,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: iconColor, width: 2),
            gradient: LinearGradient(
                colors: [bgColor, cardColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Obx(
          () => controller.isSubmitted.value == false
              ? Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey, // Set form key
                      child: ListView(
                        padding: EdgeInsets.all(16.0),
                        children: [
                          Text('Submit Resources',
                              style: titleText(24, textColor)),
                          SizedBox(height: 16.0),
                          TextFormField(
                            controller: _titleController,
                            decoration: InputDecoration(
                              labelText: "Enter Title",
                              hintStyle: normalText(16, iconColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24.0),
                                borderSide: BorderSide(color: textColor),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Title cannot be empty';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            style: normalText(16, textColor),
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            controller: _contentController,
                            decoration: InputDecoration(
                              labelText: "Enter content",
                              fillColor: textColor,
                              hintStyle: normalText(16, iconColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24.0),
                                borderSide: BorderSide(color: textColor),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Content cannot be empty';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            style: normalText(16, textColor),
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            controller: _urlController,
                            decoration: InputDecoration(
                              labelText: "Enter source url",
                              fillColor: textColor,
                              hintStyle: normalText(16, iconColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24.0),
                                borderSide: BorderSide(color: textColor),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'URL cannot be empty';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            style: normalText(16, textColor),
                          ),
                          SizedBox(height: 16.0),
                          CategoriesDropdown(
                            selectedCategory: selectedCategory,
                            onChanged: (String? newVal) {
                              setState(() {
                                selectedCategory = newVal;
                              });
                            },
                          ),
                          SizedBox(height: 16.0),
                          CustomButton(
                            textColor: bgColor,
                            textSize: 24,
                            text: "Submit Resource",
                            onPressed: () async {
                              // Validate form fields
                              if (_formKey.currentState!.validate()) {
                                // Form fields are valid, submit the resource
                                print('Form is valid. Submitting resource...');
                                // You can submit the resource here
                                await _submitResource(context);
                              } else {
                                // Form fields are invalid, show error message
                                print(
                                    'Form is invalid. Please correct errors.');
                              }
                            },
                            color: textColor,
                            height: displayHeight(context) * 0.06,
                            width: displayWidth(context) * 0.12,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : Center(child: Lottie.asset("success.json")),
        ),
      ),
      tablet: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: displayHeight(context) * 0.54,
        width: displayWidth(context) * 0.50,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: iconColor, width: 2),
            gradient: LinearGradient(
                colors: [bgColor, cardColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Obx(
          () => controller.isSubmitted.value == false
              ? Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey, // Set form key
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(16.0),
                        children: [
                          Text('Submit Resources',
                              style: titleText(24, textColor)),
                          SizedBox(height: 24.0),
                          TextFormField(
                            controller: _titleController,
                            decoration: InputDecoration(
                              labelText: "Enter Title",
                              hintStyle: normalText(16, iconColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24.0),
                                borderSide: BorderSide(color: textColor),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Title cannot be empty';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            style: normalText(16, textColor),
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            controller: _contentController,
                            decoration: InputDecoration(
                              labelText: "Enter content",
                              fillColor: textColor,
                              hintStyle: normalText(16, iconColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24.0),
                                borderSide: BorderSide(color: textColor),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Content cannot be empty';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            style: normalText(16, textColor),
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            controller: _urlController,
                            decoration: InputDecoration(
                              labelText: "Enter source url",
                              fillColor: textColor,
                              hintStyle: normalText(16, iconColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24.0),
                                borderSide: BorderSide(color: textColor),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'URL cannot be empty';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            style: normalText(16, textColor),
                          ),
                          SizedBox(height: 16.0),
                          CategoriesDropdown(
                            selectedCategory: selectedCategory,
                            onChanged: (String? newVal) {
                              setState(() {
                                selectedCategory = newVal;
                              });
                            },
                          ),
                          SizedBox(height: 16.0),
                          CustomButton(
                            textColor: bgColor,
                            textSize: 24,
                            text: "Submit Resource",
                            onPressed: () async {
                              // Validate form fields
                              if (_formKey.currentState!.validate()) {
                                // Form fields are valid, submit the resource
                                print('Form is valid. Submitting resource...');
                                // You can submit the resource here
                                await _submitResource(context);
                              } else {
                                // Form fields are invalid, show error message
                                print(
                                    'Form is invalid. Please correct errors.');
                              }
                            },
                            color: textColor,
                            height: displayHeight(context) * 0.06,
                            width: displayWidth(context) * 0.12,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : Center(child: Lottie.asset("success.json")),
        ),
      ),
      mobile: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: displayHeight(context) * 0.52,
        width: displayWidth(context),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: iconColor, width: 2),
            gradient: LinearGradient(
                colors: [bgColor, cardColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Obx(
          () => controller.isSubmitted.value == false
              ? Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Form(
                      key: _formKey, // Set form key
                      child: Scrollbar(
                        thumbVisibility: true,
                        trackVisibility: true,
                        interactive: true,
                        thickness:
                            8, // Customize the thickness of the scrollbar
                        radius: Radius.circular(
                            10), // Customize the radius of the scrollbar
                        child: ListView(
                          padding: EdgeInsets.all(16.0),
                          children: [
                            Text('Submit Resources',
                                style: titleText(24, textColor)),
                            SizedBox(height: 16.0),
                            TextFormField(
                              controller: _titleController,
                              decoration: InputDecoration(
                                labelText: "Enter Title",
                                hintStyle: normalText(16, iconColor),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide(color: textColor),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Title cannot be empty';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              style: normalText(16, textColor),
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              controller: _contentController,
                              decoration: InputDecoration(
                                labelText: "Enter content",
                                fillColor: textColor,
                                hintStyle: normalText(16, iconColor),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide(color: textColor),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Content cannot be empty';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              style: normalText(16, textColor),
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              controller: _urlController,
                              decoration: InputDecoration(
                                labelText: "Enter source url",
                                fillColor: textColor,
                                hintStyle: normalText(16, iconColor),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide(color: textColor),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'URL cannot be empty';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              style: normalText(16, textColor),
                            ),
                            SizedBox(height: 16.0),
                            CategoriesDropdown(
                              selectedCategory: selectedCategory,
                              onChanged: (String? newVal) {
                                setState(() {
                                  selectedCategory = newVal;
                                });
                              },
                            ),
                            SizedBox(height: 16.0),
                            CustomButton(
                              textColor: bgColor,
                              textSize: 24,
                              text: "Submit Resource",
                              onPressed: () async {
                                // Validate form fields
                                if (_formKey.currentState!.validate()) {
                                  // Form fields are valid, submit the resource
                                  print(
                                      'Form is valid. Submitting resource...');
                                  // You can submit the resource here
                                  await _submitResource(context);
                                } else {
                                  // Form fields are invalid, show error message
                                  print(
                                      'Form is invalid. Please correct errors.');
                                }
                              },
                              color: textColor,
                              height: displayHeight(context) * 0.06,
                              width: displayWidth(context) * 0.12,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Center(
                  child: Lottie.asset(
                  "success.json",
                )),
        ),
      ),
    );
  }

  Future<void> _submitResource(BuildContext context) async {
    try {
      // Set loading to true to display the loader
      controller.isSubmitted.value = true;

      // Submit the resource
      await controller.addResource(
        _titleController.text,
        _contentController.text,
        selectedCategory,
        _urlController.text,
      );

      // Clear form fields after successful submission
      _titleController.clear();
      _contentController.clear();
      _urlController.clear();
      Get.back();

      // Show Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Resource submitted successfully'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      // Handle error if resource submission fails
      print('Error submitting resource: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to submit resource: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      // Set loading to false to hide the loader
      controller.isSubmitted.value = false;
    }
  }
}
