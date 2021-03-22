jQuery(function(){
    $("#building_label").attr("class", "hidden");
    $("#building_id").attr("class", "hidden");
    $("#battery_label").attr("class", "hidden");
    $("#battery_id").attr("class", "hidden");
    $("#column_label").attr("class", "hidden");
    $("#column_id").attr("class", "hidden");
    $("#elevator_label").attr("class", "hidden");
    $("#elevator_id").attr("class", "hidden");
    
    $("#customer_id").change(function(){
        var customer = $(this).val();
        if(customer == ''){
            $("#building_id").attr("class", "hidden");
            $("#building_label").attr("class", "hidden");
        }else{
            $("#building_id").attr("class", "form-control");
            $("#building_label").attr("class", "");
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
                $("#building_id").append('<option value="None">Select Building</option>');
                if (buildings.length > 0) {
                    for(var i = 0; i < buildings.length; i++){
                        $("#building_id").append('<option value="' + buildings[i]["id"] + '">' +buildings[i]["building_address"] + '</option>');
                    }
                }else{
                    $("#building_id").empty();
                    $("#building_id").append('<option value="None">None</option>')}
            }
        });
    });
    $("#building_id").change(function(){
        $("#battery_label").attr("class", "hidden");
        $("#battery_id").attr("class", "hidden");
        $("#column_label").attr("class", "hidden");
        $("#column_id").attr("class", "hidden");
        $("#elevator_label").attr("class", "hidden");
        $("#elevator_id").attr("class", "hidden");
        $("#battery_id").empty();
        $("#column_id").empty();
        $("#elevator_id").empty();
        var building = $(this).val();
        if(building == ''){
            $("#battery_id").attr("class", "hidden");
            $("#battery_label").attr("class", "hidden");
        }else{
            $("#battery_id").attr("class", "form-control");
            $("#battery_label").attr("class", "");
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
                $("#battery_id").append('<option value="None">Select Battery</option>');
                if (batteries.length > 0) {
                    for(var i = 0; i < batteries.length; i++){
                        $("#battery_id").append('<option value="' + batteries[i]["id"] + '">' +batteries[i]["id"] +" "  +batteries[i]["status"] + '</option>');
                    }
                }else{
                    $("#column_id").empty();
                    $("#column_id").append('<option value="None">None</option>')}
                
            }
        });
    });
    $("#battery_id").change(function(){
        $("#column_id").empty();
        $("#elevator_id").empty();
        $("#column_label").attr("class", "hidden");
        $("#column_id").attr("class", "hidden");
        $("#elevator_label").attr("class", "hidden");
        $("#elevator_id").attr("class", "hidden");
        var battery = $(this).val();
        if(battery == ''){
            $("#column_id").attr("class", "hidden");
            $("#column_label").attr("class", "hidden");
        }else{
            $("#column_id").attr("class", "form-control");
            $("#column_label").attr("class", "");
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
                // $("#column_id").append('<option value="None">Select Column</option>');
                $("#column_id").append('<option value="None">None</option>');
                if (columns.length > 0) {
                    for(var i = 0; i < columns.length; i++){
                        $("#column_id").append('<option value="' + columns[i]["id"] + '">' +columns[i]["id"] +" "  +columns[i]["status"] + '</option>');
                    }
                }else{
                    $("#column_id").empty();
                    $("#column_id").append('<option value="None">None</option>')}
            }
        });
    });
    $("#column_id").change(function(){
        $("#elevator_label").attr("class", "hidden");
        $("#elevator_id").attr("class", "hidden");
        $("#elevator_id").empty();
        var column = $(this).val();
        if(column == ''){
            $("#elevator_id").attr("class", "hidden");
            $("#elevator_label").attr("class", "hidden");
        }else{
            $("#elevator_id").attr("class", "form-control");
            $("#elevator_label").attr("class", "");
        }
        $.ajax({
            url: "/get_elevators",
            method: "GET",  
            dataType: "json",
            data: {column: column},
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                console.log(response);
                var elevators = response["elevators"];
                $("#elevator_id").empty();
                // $("#elevator_id").append('<option value="None">Select Elevator</option>');
                $("#elevator_id").append('<option value="None">None</option>');
                if (elevators.length > 0) {
                    for(var i = 0; i < elevators.length; i++){
                        $("#elevator_id").append('<option value="' + elevators[i]["id"] + '">' +elevators[i]["id"] +" "  +elevators[i]["status"] + '</option>');
                    }
                }else{
                    $("#elevator_id").empty();
                    $("#elevator_id").append('<option value="None">None</option>')}

            }
        });
    });
});