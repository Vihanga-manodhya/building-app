import 'package:flutter/material.dart';

// --- Main App Widget (Standard Flutter setup) ---
void main() {
  runApp(const ProvEngApp());
}

class ProvEngApp extends StatelessWidget {
  const ProvEngApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProvEng Signup',
      theme: ThemeData(
        brightness: Brightness.dark, // Matches the dark theme in the image
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[800], // Lighter fill for text fields
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0), // Rounded pill shape for button
            ),
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: const SignupScreen(),
    );
  }
}

// ------------------- Signup Screen Widget -------------------
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Global key to uniquely identify the Form widget and enable validation
  final _formKey = GlobalKey<FormState>();

  // Dropdown options
  final List<String> userTypes = ['Principal', 'Technical Officer', 'District Eng.', 'Chief Eng.', 'Provincial Engineer'];
  final List<String> offices = ['Galle', 'Matara', 'Hambantota'];

  // Current selections
  String? selectedUserType = 'Provincial Engineer'; // Default value from image
  String? selectedOffice = 'Matara'; // Default value from image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 50),
              // --- Title ---
              const Center(
                child: Text(
                  'Signup (ProvEng.)',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // --- Signup Form ---
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.grey[900], // Darker background for the form container
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      // --- User Type (Dropdown) ---
                      _buildDropdownField(
                        label: 'User Type',
                        value: selectedUserType,
                        items: userTypes,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedUserType = newValue;
                          });
                        },
                      ),
                      const SizedBox(height: 15),

                      // --- Engineer's Name ---
                      _buildTextField(
                        label: "engineer's Name",
                        hint: "Enter Your Name",
                        icon: Icons.person_outline,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 15),

                      // --- NIC Number ---
                      _buildTextField(
                        label: "NIC Number",
                        hint: "Enter Your NIC",
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 15),

                      // --- Select Your Office (Dropdown) ---
                      _buildDropdownField(
                        label: 'Select Your Office',
                        value: selectedOffice,
                        items: offices,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedOffice = newValue;
                          });
                        },
                      ),
                      const SizedBox(height: 15),

                      // --- Email ---
                      _buildTextField(
                        label: "Email",
                        hint: "Enter Your Email Adress",
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 15),

                      // --- Office Phone Number ---
                      _buildTextField(
                        label: "Office Phone Number",
                        hint: "Enter Your Office Phone Number",
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 15),

                      // --- Mobile Number ---
                      _buildTextField(
                        label: "Mobile Number",
                        hint: "Enter Your Mobile Number",
                        icon: Icons.phone_android_outlined,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 15),

                      // --- First Pet Name ---
                      _buildTextField(
                        label: "First Pet Name",
                        hint: "Enter Your First Pet Name",
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),

                      // --- Childhood nickname ---
                      _buildTextField(
                        label: "Childhood nickname",
                        hint: "Enter Your Childhood nickname",
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),

                      // --- Password ---
                      _buildPasswordField(
                        label: "Enter Your Password",
                        hint: "Enter Your Password",
                      ),
                      const SizedBox(height: 15),

                      // --- Enter Password Again ---
                      _buildPasswordField(
                        label: "Enter Password Again",
                        hint: "Re-Enter Your Password",
                      ),
                      const SizedBox(height: 25),

                      // --- Sign Up Button (Gradient) ---
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 108, 194, 255), // Light blue
                              Color.fromARGB(255, 66, 133, 244), // Darker blue
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Process data, e.g., submit to API
                              print('Form Validated and Submitted');
                            }
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- Already Registered Link ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already Registered ? ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Handle Sign In navigation
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Helper Widget for Standard Text Fields ---
  Widget _buildTextField({
    required String label,
    required String hint,
    IconData? icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label above the text field
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your $label';
            }
            return null;
          },
        ),
      ],
    );
  }

  // --- Helper Widget for Password Fields ---
  Widget _buildPasswordField({
    required String label,
    required String hint,
  }) {
    // State is managed locally within the widget for simplicity, but in a real app,
    // you'd typically manage it using a state management solution or a dedicated stateful widget.
    bool _isObscure = true;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 5),
        StatefulBuilder(
          builder: (context, setState) {
            return TextFormField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                hintText: hint,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
            );
          },
        ),
      ],
    );
  }

  // --- Helper Widget for Dropdown Fields ---
  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: value,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.white), // Custom icon color
          decoration: const InputDecoration(
            // Reuses the styling defined in ThemeData
            contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
          ),
          dropdownColor: Colors.grey[850], // Background color of the dropdown list
          style: const TextStyle(color: Colors.white), // Text color for selected item
          items: items.map<DropdownMenuItem<String>>((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item, style: const TextStyle(color: Colors.white)),
            );
          }).toList(),
          onChanged: onChanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a value for $label';
            }
            return null;
          },
        ),
      ],
    );
  }
}