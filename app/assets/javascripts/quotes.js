

//Global Var
var type;
//////

$('document').ready(function () {
  $("select").change(function () {
    getBuildingType();
  });
});

function hideQuestions() {
  /////// Hide the questions
  $("#number_of_floors").attr("class", "hidden");
  $("#number_of_basements").attr("class", "hidden");
  $("#number_of_companies").attr("class", "hidden");
  $("#number_of_parking_spots").attr("class", "hidden");
  $("#maximum_occupancy").attr("class", "hidden");
  $("#number_of_apartments").attr("class", "hidden");
  $("#number_of_corporations").attr("class", "hidden");
  $("#number_of_elevators").attr("class", "hidden");
  $("#business_hours").attr("class", "hidden");
 /////// Reset the values
  $(':input[id="quote_number_of_apartments"]').val("");
  $(':input[id="quote_number_of_basements"]').val("");
  $(':input[id="quote_number_of_elevatores"]').val("");
  $(':input[id="quote_number_of_floors"]').val("");
  $(':input[id="quote_number_of_companies"]').val("");
  $(':input[id="quote_number_of_parking_spots"]').val("");
  $(':input[id="quote_maximum_occupancy"]').val("");
  $(':input[id="quote_number_of_corporations"]').val("");
  $(':input[id="quote_business_hours"]').val("");
////// reset the estimated price
  $("#estimatedElevators").val("");
  $("#estimatedColumns").val("");
  $("#quote_elevator_unit_price").val("");
  $("#quote_elevator_price").val("");
  $("#quote_installation_price").val("");
  $("#quote_total_price").val("");
/////////// reset the product line button
  $("#lineSelection input[type=radio]:checked").prop('checked', false);
 return;
}

function getBuildingType() {
  type = document.getElementById("quote_building_type").value;
  hideQuestions();

  switch (type) {
    case "residential":
      residentialQuestions();
      break;
    case "commercial":
      commercialQuestions();
      break;
    case "corporate":
      corporateQuestions();
      break;
    case "hybrid":
      hybridQuestions();
      break;
    default:
      hideQuestions();
      break;
  }
  return type;
}

function residentialQuestions() {
//Show the ResidentialQuestions
  $("#number_of_apartments").attr("class", "visible");
  $("#number_of_floors").attr("class", "visible");
  $("#number_of_basements").attr("class", "visible");
}

function commercialQuestions() {
  //Show the Commercial Questions
  $("#number_of_floors").attr("class", "visible");
  $("#number_of_basements").attr("class", "visible");
  $("#number_of_companies").attr("class", "visible");
  $("#number_of_parking-spots").attr("class", "visible");
  $("#number_of_elevators").attr("class", "visible");
}

function corporateQuestions() {
//Show the Corporate Questions
  $("#number_of_floors").attr("class", "visible");
  $("#number_of_basements").attr("class", "visible");
  $("#number_of_parking-spots").attr("class", "visible");
  $("#number_of_corporations").attr("class", "visible");
  $("#maximum_occupancy").attr("class", "visible");
}

function hybridQuestions() {
//Show the HybridQuestions
  $("#number_of_floors").attr("class", "visible");
  $("#number_of_basements").attr("class", "visible");
  $("#number_of_companies").attr("class", "visible");
  $("#number_of_parking-spots").attr("class", "visible");
  $("#maximum_occupancy").attr("class", "visible");
  $("#business_hours").attr("class", "visible");
}

function calcCommercial(elevatorInput) {
  //Commercial Calc 
  var elevatorInput
  $("#estimatedElevators").val(elevators);
  // $("#estimatedColumns").val(elevators);
}

function calcResidential(apts, floors) {
  //Residential Calc
  var elevators, column, floors, avgD, apts; 
  // Really advanced complicated maths
  avgD = Math.ceil(apts / floors);
  elevators = Math.ceil(avgD / 6);
  column = Math.ceil(floors / 20);
  elevators = elevators * column;
  //set the values
  $("#estimatedElevators").val(elevators);
  // $("#estimatedColumns").val(column);
}

function calcCorpoHybrid(maxOccupancy, floors, basements) {
  //Corporation and Hybrid Calc
  var maxOccupancy,floors,basements,totalOccupants,elevators,column,elevatorsPerC,totalElevators;
  // Really advanced complicated maths
  totalOccupants = maxOccupancy * (floors + basements);
  elevators = Math.ceil(totalOccupants / 1000);
  column = Math.ceil((floors + basements) / 20);
  elevatorsPerC = Math.ceil(elevators / column);
  totalElevators = elevatorsPerC * column;
  //set the values
  $("#estimatedElevators").val(totalElevators);
  // $("#estimatedColumns").val(column);
}

function price(productType) {
  var unitPrice,installFees,elevator,column,elevatorPrice,installationPrice,totalPrice,productType;
  // defines the prices depending on the type
  switch (productType) {
    case "standard":
      unitPrice = 7565;
      installFees = 10;
      price(unitPrice, installFees);
      break;
    case "premium":
      unitPrice = 12345;
      installFees = 13;
      price(unitPrice, installFees);
      break;
    case "excelium":
      unitPrice = 15400;
      installFees = 16;
      price(unitPrice, installFees);
      break;
    default:
      return;
  }

  $("#questionInput :input").bind(
    "keypress keydown keyup change",
    function () {
      if (parseFloat($(':input[id="quote_business_hours"]').val(), 10) > 24) {
        $("#quote_business_hours").val(24);
      };
      switch (type) {
        case "residential":
          var apts = parseFloat($(':input[id="quote_number_of_apartments"]').val(),10),
            floors = parseFloat($(':input[id="quote_number_of_floors"]').val(),10),
            basements = parseFloat($(':input[id="quote_number_of_basements"]').val(),10);
          if (!isNaN(apts) && !isNaN(floors)) {
            calcResidential(apts, floors);
          }
          break;

        case "commercial":
          var 									
            floors = parseFloat($(':input[id="quote_number_of_floors"]').val(),10),
            basements = parseFloat($(':input[id="quote_number_of_basements"]').val(),10),
            companies = parseFloat($(':input[id="quote_number_of_companies"]').val(),10),
            parkingSpots = parseFloat($(':input[id="quote_number_of_parking_spots"]').val(),10),
            elevators = parseFloat($(':input[id="quote_number_of_elevators"]').val(),10);									
          if (									 	  
            !isNaN(elevators)
          ) {
            $("#estimatedElevators").val(elevators);
          }
          break;

        case "corporate":
          var maxOccupancy = parseFloat($(':input[id="quote_maximum_occupancy"]').val(),10),
            floors = parseFloat($(':input[id="quote_number_of_floors"]').val(),10),
            basements = parseFloat($(':input[id="quote_number_of_basements"]').val(),10),
            corporations = parseFloat($(':input[id="quote_number_of_corporation"]').val(),10),
            parkingSpots = parseFloat($(':input[id="quote_number_of_parking_spots"]').val(),10);
          if (
            !isNaN(maxOccupancy) &&
            !isNaN(floors) &&
            !isNaN(basements) 
          ) {
            calcCorpoHybrid(maxOccupancy, floors, basements);
          }
          break;

        case "hybrid":
          var maxOccupancy = parseFloat($(':input[id="quote_maximum_occupancy"]').val(),10),
            floors = parseFloat($(':input[id="quote_number_of_floors"]').val(),10),
            basements = parseFloat($(':input[id="quote_number_of_basements"]').val(),10),
            companies = parseFloat($(':input[id="quote_number_of_basements"]').val(),10),
            businessHours = parseFloat($(':input[id="quote_business_hours"]').val(),10),
            parkingSpots = parseFloat($(':input[id="quote_number_of_parking_spots"]').val(),10);
          if (
            !isNaN(maxOccupancy) &&
            !isNaN(floors) &&
            !isNaN(basements) 
          ) {
            calcCorpoHybrid(maxOccupancy, floors, basements);
          }
          break;
        default: hideQuestions();
          break;
      }
      
      price($("#lineSelection input[type=radio]:checked").val());
    }
  );
  // Final calculations
  elevator = $("#estimatedElevators").val();
  // column = $("#estimatedColumns").val();
  /////////
  elevatorPrice = elevator * unitPrice;
  installationPrice = (elevatorPrice * installFees) / 100;
  totalPrice = elevatorPrice + installationPrice;

  $("#quote_elevator_unit_price").val(formatter.format(unitPrice));
  $("#quote_elevator_total_price").val(formatter.format(elevatorPrice));
  $("#quote_installation_price").val(formatter.format(installationPrice));
  $("#quote_total_price").val(formatter.format(totalPrice));
  
}

// I think I'm in love with the person who made 
//  into Js
const formatter = new Intl.NumberFormat('en-US', {
  style: 'currency',
  currency: 'USD',
  minimumFractionDigits: 2
})




			