import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Responsive breakpoints
            final isDesktop = constraints.maxWidth > 1024;
            final isTablet =
                constraints.maxWidth > 768 && constraints.maxWidth <= 1024;

            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop
                    ? 120
                    : isTablet
                        ? 60
                        : 24,
                vertical: isDesktop ? 80 : 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  Text(
                    'CONTACT',
                    style: TextStyle(
                      fontSize: isDesktop
                          ? 72
                          : isTablet
                              ? 56
                              : 48,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'For any enquiries, or just to\nsay hello, get in touch\nand contact',
                    style: TextStyle(
                      fontSize: isDesktop
                          ? 32
                          : isTablet
                              ? 28
                              : 24,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: isDesktop ? 80 : 48),

                  // Main Content
                  if (isDesktop)
                    _buildDesktopLayout()
                  else
                    _buildMobileLayout(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Column - Form
        Expanded(
          flex: 2,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSection(
                  title: 'New projects',
                  content: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextField(
                              controller: _nameController,
                              label: 'Your Name',
                              validator: _validateName,
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: _buildTextField(
                              controller: _emailController,
                              label: 'Your Email',
                              validator: _validateEmail,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),
                _buildSection(
                  title: 'General inquiries',
                  content: _buildTextField(
                    controller: _messageController,
                    label: 'Message',
                    maxLines: 5,
                    validator: _validateMessage,
                  ),
                ),
                const SizedBox(height: 32),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
        const SizedBox(width: 80),
        // Right Column - Contact Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildContactInfo(),
              const SizedBox(height: 48),
              // _buildSocialLinks(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection(
            title: 'New projects',
            content: Column(
              children: [
                _buildTextField(
                  controller: _nameController,
                  label: 'Your Name',
                  validator: _validateName,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _emailController,
                  label: 'Your Email',
                  validator: _validateEmail,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          _buildSection(
            title: 'General inquiries',
            content: _buildTextField(
              controller: _messageController,
              label: 'Message',
              maxLines: 5,
              validator: _validateMessage,
            ),
          ),
          const SizedBox(height: 32),
          _buildSubmitButton(),
          const SizedBox(height: 32),
          _buildContactInfo(),
          const SizedBox(height: 32),
          // _buildSocialLinks(),
        ],
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSection(
          title: 'Address',
          content: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '25 Maiti, 6th Cross Rd, Manorayanapalya New Extension, Atmananda Colony, Ganganagar, Bengaluru, Karnataka 560032',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildSection(
          title: 'My Email',
          content: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'adwaithdeva@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: _handleSubmit,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: const Text(
          'Send Message',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required Widget content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 16),
        content,
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
        ),
        labelStyle: const TextStyle(color: Colors.black45),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      style: const TextStyle(fontSize: 16),
      validator: validator,
    );
  }

  Widget _buildSocialLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validateMessage(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your message';
    }
    return null;
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sending message...'),
          backgroundColor: Colors.black,
        ),
      );
    }
  }
}
