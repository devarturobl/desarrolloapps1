import 'package:authapp/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  // ignore: unused_field
  File? _imageFile;

  //pick image from gallery
  Future pickImage() async {
    //picker
    final ImagePicker picker = ImagePicker();
    
    //pick image from camera
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    //update image preview
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  //upload image to supabase storage
  Future uploadImage() async {
    // Implement image upload functionality here
    if (_imageFile == null) return;

    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final path = 'uploads/$fileName';

    await Supabase.instance.client.storage
        .from('imagenes')
        .upload(path, _imageFile!)
        // ignore: use_build_context_synchronously
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Imagen subida con éxito')),
            ));
  }


  final authService = AuthService();
  void logout() {
    // Implement login functionality or navigation
    authService.singOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text('Welcome to your profile!'),
            SizedBox(height: 5),
            Text(AuthService().getCurrentUserEmail() ?? 'No email found',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
            ),  
            SizedBox(height: 5),
            _imageFile != null
                ? CircleAvatar(
                    radius: 75,
                    backgroundImage: FileImage(_imageFile!),
                    backgroundColor: Colors.transparent,
                  )
                : const Icon(
                    Icons.account_circle,
                    size: 150,
                    color: Colors.grey,
                  ),
            SizedBox(height: 5),
            ElevatedButton(onPressed: pickImage, child: Text("Take a Picture")),
            SizedBox(height: 5),
            ElevatedButton(onPressed: uploadImage, child: Text("Up Picture")),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
              child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      logout();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Cerrar sesión',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
