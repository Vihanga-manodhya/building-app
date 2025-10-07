import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Building Care Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Set the base font for the entire app using the google_fonts package
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      // Set the LoginPage as the home screen of the app
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // A state variable to toggle password visibility
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to make the layout responsive
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      
      body: SafeArea(
        child: ClipRRect(
          // Apply rounded corners to the main content area
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Main Illustration
                    Center(
                      child: Image.network(
                        // A placeholder image that resembles the one in the screenshot
                        'https://scontent.fcmb1-2.fna.fbcdn.net/v/t39.30808-1/506638615_122155613840429126_1163971712497134535_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=107&ccb=1-7&_nc_sid=e99d92&_nc_eui2=AeHs3M87N78RpMHtAiuD3ErpjKMikRwAzjyMoyKRHADOPI_88U0PoB2jA68F6jhuEHDQI42F5_jq95rmcX92_TNo&_nc_ohc=msxAkeIQIroQ7kNvwFhLExy&_nc_oc=AdlOGoDyrT2hDMXbHFFTdcUkVuMnqoBjfKKpGSbQGdAA9pq70M6VZ_by6gz_-QVFOUU&_nc_zt=24&_nc_ht=scontent.fcmb1-2.fna&_nc_gid=L2ZfnwmHlnQ4GibKFWlThg&oh=00_AfcbHpNJQLKpF1xQ-arHFKjvumaB_dhvTq3-fyN0YNGiaA&oe=68EA6B1C',
                        height: screenHeight * 0.22,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.error, size: screenHeight * 0.22),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Login Title
                    Center(
                      child: Text(
                        'Login In Now',
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Login Subtitle
                    Center(
                      child: Text(
                        'please login to continue using the app',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // NIC Input Field
                    Text(
                      'Enter Your NIC',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'V87XXXXXXXXXXX',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Icon(Icons.badge_outlined, color: Colors.grey[500]),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Password Input Field
                    Row(
                      children: [
                        Text(
                          'Enter Your Password',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(Icons.info_outline, color: Colors.grey[500], size: 16),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      obscureText: !_isPasswordVisible, // Use state variable here
                      decoration: InputDecoration(
                        hintText: '••••••••••••••••',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        // IconButton to toggle password visibility
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Colors.grey[500],
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Forgot Password Link
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // TODO: Implement forgot password functionality
                        },
                        child: Text(
                          'Forgot Password?',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Implement login logic
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF42A5F5), // Bright blue
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 5,
                          shadowColor: Colors.blue.withOpacity(0.4),
                        ),
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Sign Up Link  bjhjn b n nbnbnb
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: GoogleFonts.poppins(color: Colors.grey[700]),
                        ),
                        TextButton(
                          onPressed: () {
                            // TODO: Implement navigation to Sign Up page
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(50, 30),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Sign up',
                            style: GoogleFonts.poppins(
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
          ),
        ),
      ),
    );
  }
}

