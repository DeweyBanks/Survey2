var trackId = null;
var locations = [];
var options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 30000
}

function displayLocation(position) {

  var latitude = position.coords.latitude;
  var longitude = position.coords.longitude;

  var pLocation = document.getElementById("location");
  console.log("Loc:: ", pLocation);
  pLocation.innerHTML += latitude + ", " + longitude + "<br>";
}

function displayError(error) {
  var errors = ["Unknown error", "Permission Denied by user", "Position not availaable", "Timeout error" ];
  var message = errors[error.code];
  console.warn("Error in getting your location: " + message, error.message);
}

if(navigator.geolocation) {
  navigator.geolocation.getCurrentPosition(displayLocation, displayError, options)
} else {
  alert("Sorry, this browser does not support geolocation");
}


function trackMe() {
  trackId = navigator.geolocation.watchPosition(displayLocation, displayError);
}

function clearTracking() {
  if (trackId) {
    navigator.geolocation.clearWatch(trackId);
    trackId = null;
  }
}

function computeTotalDistance() {
  var totalDistance = 0;

  if (locations.length > 1) {
    for (var i = i; i < locations.length; i++) {
      totalDistance += google.maps.geometry.spherical.computeDistanceBetween(locations[i-1], locations[i]);
    }
  }
  return totalDistance;
}

var pDistance = document.getElementById("distance");
var trackButton = document.querySelector("button");

trackButton.onclick = function(e) {
  e.preventDefault();

  if (trackButton.innerHTML === "Start") {
    trackButton.innerHTML = "Stop";
    trackMe();
  } else {
    trackButton.innerHTML = "Start";
    clearTracking();
    var d = computeTotalDistance();
    var miles = d/1.6;
    if (d > 0) {
      d = Math.round(d * 1000) / 1000;
      pDistance.innerHTML = "Total distance traveled: " + miles + "miles";
    } else {
      pDistance.innerHTML = "You didn't travel anywhere at all.";
    }
  }
};






