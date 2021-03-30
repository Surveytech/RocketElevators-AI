function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
        // console.log(navigator.geolocation.getCurrentPosition.coords.latitude);
        // console.log(navigator.geolocation.getCurrentPosition.coords.longitude);
    } else {
        console.log("Geolocation is not supported by this browser.");
    }
}
function showPosition(position) {
    console.log("Latitude: " + position.coords.latitude);
    console.log("Longitude: " + position.coords.longitude);
    $(document)
                .find('#weathertest')
                .empty()
                .append( position.coords.latitude, position.coords.longitude )
}

jQuery(function(){
    $("#city_btn").click(function(){
        var city = $("#getWeather_city").val();
        $.ajax({
            url: "/getWeather",
            method: "GET",  
            data: {city: city},
            success: function (response) {
                $(document)
                    .find('#weather')
                    .empty()
                    .append( response )        
            }
         });
    });
});