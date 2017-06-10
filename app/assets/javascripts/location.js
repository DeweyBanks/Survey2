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
  navigator.geolocation.getCurrentPosition(displayLocation, displayError)
} else {
  alert("Sorry, this browser does not support geolocation");
}
