import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maseeha_2/Assistants/requestAssistant.dart';
import 'package:maseeha_2/DataHandler/AppData.dart';
import 'package:maseeha_2/Models/address.dart';
import 'package:maseeha_2/Models/directionDetails.dart';
import 'package:provider/provider.dart';

class AssistantMethods {
  static Future<String> searchCoordinateAddress(
      Position position, context) async {
    String placeAddress = '';
    String a1, a2, a3, a4;
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyD-yOv-CmxUNv9PQaZaDTAvEiyKVlMY5cE";

    var response = await RequestAssistant.getRequest(url);

    if (response != "Found") {
      a1 = response["results"][0]["address_components"][0]["long_name"];
      a2 = response["results"][0]["address_components"][1]["long_name"];
      a3 = response["results"][0]["address_components"][2]["long_name"];
      a4 = response["results"][0]["address_components"][3]["long_name"];

      placeAddress = a1 + ", " + a2 + ", " + a3 + ", " + a4;
      print("This is your Address" + placeAddress);

      Address userCurrentlocation = new Address();
      userCurrentlocation.longitude = position.longitude;
      userCurrentlocation.latitude = position.latitude;
      userCurrentlocation.placeName = placeAddress;
      Provider.of<AppData>(context, listen: false)
          .updateUserlocation(userCurrentlocation);
    }

    return placeAddress;
  }

  static Future<DirectionDetails> obtainPlacePredictionDetails(
      LatLng intialPosition, LatLng finalPosition) async {
    String directionUrl =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${intialPosition.latitude},${intialPosition.longitude}&destination=${finalPosition.latitude},${finalPosition.longitude}&key=AIzaSyD-yOv-CmxUNv9PQaZaDTAvEiyKVlMY5cE";

    var res = await RequestAssistant.getRequest(directionUrl);

    if (res == "Failed") {
      return null;
    }

    print(res);

    DirectionDetails directionDetails = new DirectionDetails();

    directionDetails.encodePoints =
        res["routes"][0]["overview_polyline"]["points"];

    directionDetails.distanceText =
        res["routes"][0]["legs"][0]["distance"]["text"];
    directionDetails.distanceValue =
        res["routes"][0]["legs"][0]["distance"]["value"];

    directionDetails.durationText =
        res["routes"][0]["legs"][0]["duration"]["text"];
    directionDetails.durationValue =
        res["routes"][0]["legs"][0]["duration"]["value"];

    return directionDetails;
  }
}
