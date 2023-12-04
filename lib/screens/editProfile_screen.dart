import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  File? _selectedPhoto;
  File? _selectedBanner;

  Future<void> _pickImage(ImageSource source, bool isBanner) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        if (isBanner) {
          _selectedBanner = File(pickedFile.path);
        } else {
          _selectedPhoto = File(pickedFile.path);
        }
      });
    }
  }

  Widget _buildThumbnail(File? file) {
    return file != null
        ? Image.file(file, height: 50, width: 50)
        : Container(width: 50, height: 50, color: Colors.grey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    _pickImage(ImageSource.gallery, false);
                  },
                  child: Row(
                    children: [
                      _buildThumbnail(_selectedPhoto),
                      const SizedBox(width: 8.0),
                      const Text('Trocar Foto'),
                    ],
                  ),
                ),
              ],
            ),   const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    _pickImage(ImageSource.gallery, true);
                  },
                  child: Row(
                    children: [
                      _buildThumbnail(_selectedBanner),
                      const SizedBox(width: 8.0),
                      const Text('Trocar Banner'),
                    ],
                  ),
                ),
              ],
            ),const SizedBox(height: 10),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(labelText: 'Idade'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: phoneNumberController,
              decoration: const InputDecoration(labelText: 'Número de Telefone'),
            ),
            
            const SizedBox(height: 160.0),

             Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // Adicione aqui a lógica para salvar as configurações.
                  // Pode ser útil usar um serviço de gerenciamento de configurações.
                  // Por exemplo: saveSettings(_notificationsEnabled, _volumeLevel);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Configurações salvas!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'Salvar Configurações',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}