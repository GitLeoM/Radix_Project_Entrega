import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:radix_entrega_project/Utils/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<String> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();

    final staticMapImageUrl = LocationGoogle.generateLocationPreviewImage(
      latitude: locData.latitude,
      longitude: locData.longitude,
    );

    return staticMapImageUrl;
  }

  @override
  Widget build(BuildContext context) {
    // _getCurrentUserLocation().then(
    //   (value) {
    //     setState(() {
    //       _previewImageUrl = value;
    //     });
    //   },
    // );
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _previewImageUrl == null
              ? const Text('Localização não informada!')
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.map),
              label: const Text('Ver no Mapa'),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
