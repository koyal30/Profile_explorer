import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../domain/user_model.dart';
import '../viewmodels/user_provider.dart';

class ProfileDetailScreen extends StatelessWidget {
  final User user;
  const ProfileDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC), // Beige
      appBar: AppBar(
        backgroundColor: Colors.pink[100], // Baby pink header
        centerTitle: true,
        title: Text(
          "${user.name}'s Profile",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w800,
            fontSize: 24,
            color: Colors.black87,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: user.imageUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      user.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              _detailLine("Name", user.name),
              const SizedBox(height: 10),
              _detailLine("Age", user.age.toString()),
              const SizedBox(height: 10),
              _detailLine("Location", user.city),
              const SizedBox(height: 30),

              IconButton(
                iconSize: 42,
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    user.isLiked ? Icons.favorite : Icons.favorite_border,
                    key: ValueKey(user.isLiked),
                    color: user.isLiked ? Colors.red : Colors.grey,
                  ),
                ),
                onPressed: () => provider.toggleLike(user),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailLine(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$label: ",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}


