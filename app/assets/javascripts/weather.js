jQuery(function(){
    console.log("LOADED");
    $("#city_btn").click(function(){
        // $.ajax({
        //     type:'POST',
        //     url:'/getWeather',
        //     data: { id: "demo.html" },
        //     success:function(result){
        //     $("#lesson").html(result);
        //     }
        // }); var customer = $(this).val();

        var city = $("#getWeather_city").val();
        console.log(city)
        $.ajax({
        url: "/getWeather",
        method: "GET",  
        // dataType: "json",
        data: {city: city},
        success: function (response) {
            console.log("heyy");  
            // var weather = response
            $(document)
                .find('#weathertest')
                .append( response )
            console.log(response);            
        }
    });

    });
});