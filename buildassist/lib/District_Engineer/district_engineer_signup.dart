import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DistrictEngineerSignup(),
  ));
}

class DistrictEngineerSignup extends StatefulWidget {
  const DistrictEngineerSignup({super.key});

  @override
  State<DistrictEngineerSignup> createState() => _DistrictEngineerSignupState();
}

class _DistrictEngineerSignupState extends State<DistrictEngineerSignup> {
  String? selectedRole;
  String? selectedOffice;

  final roles = ['Principal', 'Technical Officer', 'District Eng.', 'Chief Eng.'];
  final offices = ['Galle', 'Matara', 'Hambantota'];

  @override
  Widget build(BuildContext context) {
    // Responsive width & height
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: width * 0.9, // 90% of screen width
            constraints: const BoxConstraints(maxWidth: 450), // prevents too wide on tablets
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            margin: EdgeInsets.symmetric(vertical: height * 0.03),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Signup (District Eng.)",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: width * 0.045, // responsive text size
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),

                // User Type Dropdown
                const Text("User Type", style: TextStyle(fontSize: 12)),
                const SizedBox(height: 5),
                _buildDropdown("Select Your Roll", selectedRole, roles, (value) {
                  setState(() => selectedRole = value);
                }),

                SizedBox(height: height * 0.02),
                _buildTextField("District Engineer Name", "Enter Your Name", Icons.person),
                _buildTextField("NIC Number", "Enter Your NIC", Icons.credit_card),

                const SizedBox(height: 10),
                const Text("Select Your Office", style: TextStyle(fontSize: 12)),
                const SizedBox(height: 5),
                _buildDropdown("Select Your Office", selectedOffice, offices, (value) {
                  setState(() => selectedOffice = value);
                }),

                _buildTextField("Email", "Enter Your Email Address", Icons.email),
                _buildTextField("Office Phone Number", "Enter Your Office Phone Number", Icons.phone),
                _buildTextField("Mobile Number", "Enter Your Mobile Number", Icons.phone_android),
                _buildTextField("First Pet Name", "Enter Your First Pet Name", Icons.pets),
                _buildTextField("Childhood nickname", "Enter Your Childhood nickname", Icons.child_care),
                _buildTextField("Enter Your Password", "Enter Your Password", Icons.visibility_off, obscure: true),
                _buildTextField("Enter Password Again", "Re-Enter Your Password", Icons.visibility_off, obscure: true),

                SizedBox(height: height * 0.03),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF40A6FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.015),
                Center(
                  child: RichText(
                    text: const TextSpan(
                      text: "Already Registered? ",
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                      children: [
                        TextSpan(
                          text: "Sign in",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Custom Widgets ---

  Widget _buildDropdown(String hint, String? value, List<String> items, ValueChanged<String?> onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.blueAccent),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(hint),
          isExpanded: true,
          items: items.map((item) {
            return DropdownMenuItem(value: item, child: Text(item));
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, IconData icon, {bool obscure = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12)),
        const SizedBox(height: 5),
        TextField(
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: Icon(icon, color: Colors.grey),
            filled: true,
            fillColor: const Color(0xFFF5F5F5),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
