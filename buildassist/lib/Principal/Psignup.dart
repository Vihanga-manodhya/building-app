import 'package:flutter/material.dart';

void main() {
  runApp(const PrincipalSignupApp());
}

class PrincipalSignupApp extends StatelessWidget {
  const PrincipalSignupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Principal Signup UI',
      theme: ThemeData(
        // Set a default background color for the scaffold
        scaffoldBackgroundColor: Colors.black,
        // Define a light blue primary color for consistency
        primaryColor: const Color(0xFF6dd5ed),
      ),
      home: const SignupScreen(),
    );
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // State variables for the functional dropdowns
  String? _selectedRoll;
  String? _selectedSchoolType;

  // Dropdown options
  final List<String> userRoles = [
    'Principal',
    'Technical Officer',
    'District Eng.',
    'Chief Eng.',
  ];
  final List<String> schoolTypes = [
    'Government',
    'Provincial',
  ];

  // Define the light blue color for icons and accents
  static const Color lightBlueIconColor = Color(0xFF6dd5ed);
  // Define the main blue color for links and primary elements
  static const Color primaryBlueColor = Color(0xFF2196F3);


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Signup (principal)',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            // Set a max width for large screens for better readability
            width: screenWidth > 600 ? 400 : screenWidth * 0.9, 
            decoration: BoxDecoration(
              color: const Color(0xFF222222), // Dark background for the card holder
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.05),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // White/light grey form background
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // --- User Type Dropdown (Functional) ---
                      _buildRollDropdown(),
                      const SizedBox(height: 15.0),

                      // --- NIC Number Field (Icon: Camera) ---
                      _buildTextField(
                        hintText: 'Enter Your NIC',
                        label: 'NIC Number',
                        suffixIcon: Icons.camera_alt_outlined,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15.0),

                      // --- School Name Field (Icon: Home) ---
                      _buildTextField(
                        hintText: 'Enter Your School name',
                        label: 'School Name',
                        suffixIcon: Icons.home_outlined,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15.0),

                      // --- School Type Dropdown (Functional - Government/Provincial) ---
                      _buildSchoolTypeDropdown(),
                      const SizedBox(height: 15.0),

                      // --- School Email Field (Icon: Email) ---
                      _buildTextField(
                        hintText: 'Enter Your Email Adress',
                        label: 'School Email',
                        suffixIcon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 15.0),

                      // --- School Phone Number Field (Icon: Phone/Mobile) ---
                      _buildTextField(
                        hintText: 'Enter Your School Phone Number',
                        label: 'School Phone Number',
                        // Icon changed to match the UI better (phone/mobile)
                        suffixIcon: Icons.phone_android_outlined, 
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 15.0),

                      // --- Principal Name Field (Icon: Person) ---
                      _buildTextField(
                        hintText: 'Enter Principal Name',
                        label: 'Principal Name',
                        suffixIcon: Icons.person_outline,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15.0),

                      // --- Principal's Mobile Number Field (Icon: Call) ---
                      _buildTextField(
                        hintText: "Enter Principal's Mobile Number",
                        label: "Principal's Mobile Number",
                        suffixIcon: Icons.call_outlined,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 15.0),

                      // --- First Pet Name Field (No Icon in UI) ---
                      _buildTextField(
                        hintText: 'Enter Your First Pet Name',
                        label: 'First Pet Name',
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15.0),

                      // --- Childhood nickname Field (No Icon in UI) ---
                      _buildTextField(
                        hintText: 'Enter Your Childhood nickname',
                        label: 'Childhood nickname',
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15.0),

                      // --- Principal's Password Field (Icon: Eye) ---
                      _buildTextField(
                        hintText: '**********',
                        label: "Principal's Password",
                        suffixIcon: Icons.remove_red_eye_outlined,
                        isPassword: true,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 15.0),

                      // --- Enter Password Again Field (Icon: Eye) ---
                      _buildTextField(
                        hintText: '**********',
                        label: 'Enter Password Again',
                        suffixIcon: Icons.remove_red_eye_outlined,
                        isPassword: true,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 30.0),

                      // --- Sign Up Button ---
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          // Gradient from light blue to slightly darker blue
                          gradient: const LinearGradient(
                            colors: [lightBlueIconColor, primaryBlueColor],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              color: primaryBlueColor.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Add signup logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
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
                      const SizedBox(height: 15.0),

                      // --- Already Registered? Sign In link ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Already Registered? ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Add navigation to sign in screen
                            },
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                color: primaryBlueColor, // Blue color for the link
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Helper Widget Functions ---

  // Helper function for standard TextFields
  Widget _buildTextField({
    required String hintText,
    required String label,
    IconData? suffixIcon,
    bool isPassword = false,
    required TextInputType keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5.0),
        TextField(
          keyboardType: keyboardType,
          obscureText: isPassword,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[400]),
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: lightBlueIconColor, width: 2.0),
            ),
            // Icon color is set to light blue
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Icon(
                      suffixIcon,
                      color: lightBlueIconColor,
                    ),
                  )
                : null,
            suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
          ),
        ),
      ],
    );
  }

  // Functional Dropdown Widget for User Type (Select Roll)
  Widget _buildRollDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'User Type',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey[300]!, width: 1.0),
          ),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            hint: Text(
              'Select Your Roll',
              style: TextStyle(color: Colors.grey[400]),
            ),
            value: _selectedRoll,
            icon: const Icon(
              Icons.arrow_drop_down, // Icon from UI
              color: lightBlueIconColor,
              size: 30,
            ),
            style: const TextStyle(color: Colors.black),
            isExpanded: true,
            onChanged: (String? newValue) {
              setState(() {
                _selectedRoll = newValue;
              });
            },
            items: userRoles.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
  
  // Functional Dropdown Widget for School Type (Government/Provincial)
  Widget _buildSchoolTypeDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'School Type',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey[300]!, width: 1.0),
          ),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            hint: Text(
              'Select a school type',
              style: TextStyle(color: Colors.grey[400]),
            ),
            value: _selectedSchoolType,
            icon: const Icon(
              Icons.unfold_more, // Icon that resembles the UI's icon for this field
              color: lightBlueIconColor,
              size: 24,
            ),
            style: const TextStyle(color: Colors.black),
            isExpanded: true,
            onChanged: (String? newValue) {
              setState(() {
                _selectedSchoolType = newValue;
              });
            },
            items: schoolTypes.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}