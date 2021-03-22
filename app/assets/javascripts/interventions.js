jQuery(function(){
    $("#building_id").attr("class", "hidden");
    $("#battery_id").attr("class", "hidden");
    $("#column_id").attr("class", "hidden");
    $("#customer_id").change(function(){
        var customer = $(this).val();
        if(customer == ''){
            $("#building_id").attr("class", "hidden");
        }else{
            $("#building_id").attr("class", "form-control");
        }
        $.ajax({
            url: "/get_buildings",
            method: "GET",  
            dataType: "json",
            data: {customer: customer},
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                console.log(response);
                var buildings = response["buildings"];
                $("#building_id").empty();

                $("#building_id").append('<option>Select Building</option>');
                for(var i = 0; i < buildings.length; i++){
                    $("#building_id").append('<option value="' + buildings[i]["id"] + '">' +buildings[i]["building_address"] + '</option>');
                }
            }
        });
    });
    $("#building_id").change(function(){
        var building = $(this).val();
        if(building == ''){
            $("#battery_id").attr("class", "hidden");
        }else{
            $("#battery_id").attr("class", "form-control");
        }
        $.ajax({
            url: "/get_batteries",
            method: "GET",  
            dataType: "json",
            data: {building: building},
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                console.log(response);
                var batteries = response["batteries"];
                $("#battery_id").empty();
                $("#battery_id").append('<option>Select Battery</option>');
                for(var i = 0; i < batteries.length; i++){
                    $("#battery_id").append('<option value="' + batteries[i]["id"] + '">' +batteries[i]["id"] +" "  +batteries[i]["status"] + '</option>');
                }
            }
        });
    });
    $("#battery_id").change(function(){
        var battery = $(this).val();
        if(battery == ''){
            $("#column_id").attr("class", "hidden");
        }else{
            $("#column_id").attr("class", "form-control");
        }
        $.ajax({
            url: "/get_columns",
            method: "GET",  
            dataType: "json",
            data: {battery: battery},
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                console.log(response);
                var columns = response["columns"];
                $("#column_id").empty();
                $("#column_id").append('<option value="None">Select Column</option>');
                $("#column_id").append('<option value="None">None</option>');
                for(var i = 0; i < columns.length; i++){
                    $("#column_id").append('<option value="' + columns[i]["id"] + '">' +columns[i]["id"] +" "  +columns[i]["status"] + '</option>');
                }
            }
        });
    });
});