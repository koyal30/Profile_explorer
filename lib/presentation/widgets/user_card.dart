import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/user_model.dart';
import '../viewmodels/user_provider.dart';
import 'package:provider/provider.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5DC), // Beige card background
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withValues(alpha: 0.15),
            blurRadius: 6,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ✅ Hero for smooth image transition
            Hero(
              tag: user.imageUrl,
              child: Image.network(
                user.imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              color: const Color(0xFFFFF0F5), // Light baby pink background
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    user.name,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.brown[800],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Age: ${user.age}",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.brown[700],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    user.city,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.brown[600],
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(
                  user.isLiked ? Icons.favorite : Icons.favorite_border,
                  color: user.isLiked ? Colors.red : Colors.grey,
                  size: 26,
                ),
                onPressed: () => provider.toggleLike(user),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

