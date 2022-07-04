import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FibonacciForm extends StatefulWidget {
  const FibonacciForm({Key? key}) : super(key: key);
  @override
  FibonacciFormState createState() {
    return FibonacciFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class FibonacciFormState extends State<FibonacciForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  int _result = -1;
// Create a text controller and use it to retrieve the current value
  // of the TextField.
  final textEditingController = TextEditingController();
  int fibonacci(int n) {
    var result = [0, 1];
    if (n <= 1) {
      return n;
    }
    for (int i = 2; i <= n; i++) {
      result[i % 2] = result[(i - 2) % 2] + result[(i - 1) % 2];
    }
    return result[n % 2];
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    width: 500,
                    child: TextFormField(
                      controller: textEditingController,
                      decoration:
                          const InputDecoration(labelText: "Enter your number"),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a number';
                        }
                        return null;
                      },
                    )),
                Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                        // Placing the Text in a SizedBox and setting its width prevents a discernible “jump” when the text changes between the values of 40 and 41 — a jump would otherwise occur because those values have different widths.
                        width: 500,
                        child: Text('$_result')))
              ]),
          Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          setState(() {
                            _result = fibonacci(
                                int.parse(textEditingController.text));
                          });
                        }
                      },
                      child: const Center(
                        child: Text('Submit'),
                      ),
                    )
                  ]))
        ]));
  }
}
