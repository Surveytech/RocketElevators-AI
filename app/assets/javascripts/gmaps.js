let map1;

function initMap() {
  map1 = new google.maps.Map(document.getElementById("map"), {
    center: { lat: -34.397, lng: 150.644 },
    zoom: 8,
  });
}

// const script = document.createElement('script');
//       script.defer = true;
//       script.async = true;
//       script.src = `https://maps.googleapis.com/maps/api/js?key=${process.env.API_KEY}&callback=initMap`;
//       document.appendChild(script);
