import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class GoogleMapScreen extends StatefulWidget{

  @override
  _GoogleMapsScreenState createState()=> _GoogleMapsScreenState();
}

class _GoogleMapsScreenState  extends State<GoogleMapScreen>{
Completer<GoogleMapController> _controller =Completer();
List<Marker> markers =[];

  @override
   void initState(){

    intilize();
    super.initState();
  }

  intilize(){
      Marker etiquetauno=Marker(
          markerId: MarkerId('equiqueta1'),
        position:LatLng( 13.98963227246124, -89.67701764016482 ),
        infoWindow: InfoWindow(title: 'Domicilios SV chalchuapa'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueBlue
        ),
      );


      Marker etiquetados=Marker(
        markerId: MarkerId('equiqueta2'),
        position:LatLng( 13.905209430364646, -89.49985877826892 ),
        infoWindow: InfoWindow(title: 'Domicilios SV Congo'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueBlue
        ),
      );




      setState(() {
      markers.add(etiquetauno);
      markers.add(etiquetados);



      });
  }








  @override
  Widget build(BuildContext context){
     return Scaffold(
       body: SafeArea(
         child: Container(
           height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.height,
           child: GoogleMap(
             mapType: MapType.normal,
             onTap: (latlang){
               /// agragr contenido men 
             },
             myLocationEnabled: true,
             myLocationButtonEnabled: true,
             initialCameraPosition: 
             CameraPosition(target: LatLng(13.977960625277834, -89.56256457754438),zoom: 10),
             onMapCreated: (GoogleMapController controller){

               _controller.complete(controller);

               //////////////////
             },

             markers: markers.map((e) => e).toSet(),

             ///////////////////////
             //////////////////////
             
           ),
         ),
       ),
     );
  }





}