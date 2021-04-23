

jQuery(function(){

    $("#filePicker").change(function(){
        var filename = $(this).val();
        if($("#filePickerPlayer").length){$("#filePickerPlayer").remove()};
        const player = `<div id="filePickerPlayer"><audio controls='controls' src="./assets/${filename}"></audio></div>`
        $("#lefilePickerPlayerContainer").append(player);
    });

    $("#apiTest").click(function(){
        $.ajax({
            url: "/speech/identifySpeaker",
            method: "GET",  
            data: {file: $("#filePicker").val()},
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                console.log(response); 
            }
        });
    });
    

});