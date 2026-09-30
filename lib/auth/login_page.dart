import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:natham_college/auth/reset_password_page.dart';
import 'package:natham_college/constant/bottom_nav_bar.dart';
import 'package:natham_college/features/auth/presentation/provider/auth_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Column(
              children: [
                NATHMPortalHeader(),
                SizedBox(height: 15),

                NATHMLoginForm(
                  onLogin: (email, password) async {
                    try {
                      await ref
                          .read(authControllerProvider.notifier)
                          .login(email, password);

                      if (!mounted) return false;

                      final authState = ref.read(authControllerProvider);

                      debugPrint(
                        'AUTH STATE: isAuthenticated=${authState.isAuthenticated}, error=${authState.error}',
                      );

                      if (authState.isAuthenticated) {
                        ref.invalidate(currentUserProvider);  
                        Get.to(() => BottomNavbar());
                        return true;
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              authState.error ??
                                  "Login failed. Please try again.",
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                        return false;
                      }
                    } catch (e, stack) {
                      debugPrint('ONLOGIN CALLBACK ERROR: $e');
                      debugPrint('STACK: $stack');
                      rethrow;
                    }
                  },
                ),

                SizedBox(height: 20),

                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.apartment_outlined,
                          size: 14,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "National Academy of Tourism & Hotel Management",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Rabi Bhawan, Kalimati, Kathmandu, Nepal",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NATHMPortalHeader extends StatelessWidget {
  final VoidCallback? onSignInTap;
  final double logoSize;

  const NATHMPortalHeader({super.key, this.onSignInTap, this.logoSize = 60});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(painter: _BackgroundLinesPainter()),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFFE8D0D0),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Text(
                      "GOVT. OF NEPAL  •  ESTD. 1972",
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.6,
                        color: Color(0xFF8B5A5A),
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),

                  Container(
                    width: logoSize,
                    height: logoSize,
                    decoration: BoxDecoration(
                      color: const Color(0xFF8B1E1E),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xFF8B1E1E,
                          ).withValues(alpha: 0.25),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.landscape_rounded,
                          size: logoSize * 0.42,
                          color: Colors.white,
                        ),

                        const SizedBox(height: 4),

                        Container(
                          width: logoSize * 0.22,
                          height: logoSize * 0.22,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFFD4A017),
                              width: 1.5,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "N",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF8B1E1E),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Title
                  const Text(
                    "NATHM Portal",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFC41E3A),
                      letterSpacing: -0.5,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Sign in to continue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackgroundLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE8C0C0).withValues(alpha: 0.45)
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    final path = Path();

    path.moveTo(0, 90);
    path.lineTo(size.width * 0.18, 40);
    path.lineTo(size.width * 0.32, 75);

    path.moveTo(size.width * 0.28, 70);
    path.lineTo(size.width * 0.48, 25);
    path.lineTo(size.width * 0.68, 65);

    path.moveTo(size.width * 0.62, 60);
    path.lineTo(size.width * 0.82, 35);
    path.lineTo(size.width, 80);

    canvas.drawPath(path, paint);

    final paint2 = Paint()
      ..color = const Color(0xFFE8C0C0).withValues(alpha: 0.25)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final path2 = Path();
    path2.moveTo(0, 110);
    path2.lineTo(size.width * 0.22, 55);
    path2.lineTo(size.width * 0.42, 95);
    path2.moveTo(size.width * 0.38, 85);
    path2.lineTo(size.width * 0.58, 40);
    path2.lineTo(size.width * 0.78, 90);
    path2.moveTo(size.width * 0.72, 80);
    path2.lineTo(size.width * 0.90, 50);
    path2.lineTo(size.width, 100);

    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class NATHMLoginForm extends StatefulWidget {
  final Future<bool> Function(String email, String password)? onLogin;

  const NATHMLoginForm({super.key, this.onLogin});

  @override
  State<NATHMLoginForm> createState() => _NATHMLoginFormState();
}

class _NATHMLoginFormState extends State<NATHMLoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _isLoading = false;
  String? _generalError;

  bool _hasTriedSubmit = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    setState(() {
      _hasTriedSubmit = true;
      _generalError = null;
    });

    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text;

      final success = await widget.onLogin?.call(email, password) ?? false;

      if (!success && mounted) {
        setState(() {
          _generalError =
              "Invalid credentials: Please verify your institutional email and password combination.";
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _generalError = "Something went wrong. Please try again.";
        });
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Email Address *",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autovalidateMode: _hasTriedSubmit
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
              decoration: InputDecoration(
                hintText: "student@nathm.edu.np",
                hintStyle: TextStyle(fontSize: 14),
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  size: 20,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xFFC41E3A),
                    width: 1.5,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.red, width: 1.2),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Email is required";
                }
                if (!RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                ).hasMatch(value.trim())) {
                  return "Please enter a valid email address";
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            const Text(
              "Password *",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _handleLogin(),
              autovalidateMode: _hasTriedSubmit
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
              decoration: InputDecoration(
                hintText: "••••••••••••",
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  size: 20,
                  color: Colors.grey,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() => _obscurePassword = !_obscurePassword);
                  },
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xFFC41E3A),
                    width: 1.5,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.red, width: 1.2),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password is required";
                }
                if (value.length < 6) {
                  return "Password must be at least 6 characters";
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            if (_generalError != null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF0F0),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFFFCDD2)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Color(0xFFC62828),
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        _generalError!,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFFC62828),
                          height: 1.35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            if (_generalError != null) const SizedBox(height: 12),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Get.to(() => ResetPasswordPage());
                },
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFFC41E3A),
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w500),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _handleLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC41E3A),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: const Color(
                    0xFFC41E3A,
                  ).withValues(alpha: 0.65),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: _isLoading
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Colors.white,
                        ),
                      )
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign in",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward_ios_rounded, size: 18),
                        ],
                      ),
              ),
            ),

            const SizedBox(height: 28),

            Center(
              child: Column(
                children: [
                  Text(
                    "Accounts are created by your campus administrator. Contact them if you do not have access.",

                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
