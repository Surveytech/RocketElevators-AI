/////////////////////////////////////////////////////////////////////////////
///                                                                       ///
///              Quote Request Script                                     ///
///              Tommy C.                                                 ///
///                                                                       ///
///                                                                       ///
/////////////////////////////////////////////////////////////////////////////

//Global Var
var type;
//////

function hideQuestions() {
  /////// Hide the questions
  $("#number_of_floors").attr("class", "hidden");
  $("#number_of_basements").attr("class", "hidden");
  $("#number_of_companies").attr("class", "hidden");
  $("#number_of_parking-spots").attr("class", "hidden");
  $("#maximum_occupancy").attr("class", "hidden");
  $("#number_of_apartments").attr("class", "hidden");
  $("#number_of_corporations").attr("class", "hidden");
  $("#number_of_elevators").attr("class", "hidden");
  $("#business-hours").attr("class", "hidden");
 /////// Reset the values
  $(':input[id="numberOfApartmentsInput"]').val("");
  $(':input[id="numberOfBasementsInput"]').val("");
  $(':input[id="numberOfElevatorsInput"]').val("");
  $(':input[id="numberOfFloorsInput"]').val("");
  $(':input[id="numberOfCompaniesInput"]').val("");
  $(':input[id="numberOfParkingSpotsInput"]').val("");
  $(':input[id="maximumOccupancyInput"]').val("");
  $(':input[id="numberOfCorporationsInput"]').val("");
  $(':input[id="businessHoursInput"]').val("");
  $(':input[id="numberOfParkingSpotsInput"]').val("");
////// reset the estimated price
  $("#estimatedElevators").val("");
  // $("#estimatedColumns").val("");
  $("#elevatorUnitPrice").val("");
  $("#elevatorPrice").val("");
  $("#installationPrice").val("");
  $("#totalPrice").val("");
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
  $("#business-hours").attr("class", "visible");
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
    case "Standard":
      unitPrice = 7565;
      installFees = 10;
      price(unitPrice, installFees);
      break;
    case "Premium":
      unitPrice = 12345;
      installFees = 13;
      price(unitPrice, installFees);
      break;
    case "Excelium":
      unitPrice = 15400;
      installFees = 16;
      price(unitPrice, installFees);
      break;
    default:
      return;
  }
  // Final calculations
  elevator = $("#estimatedElevators").val();
  // column = $("#estimatedColumns").val();
  /////////
  elevatorPrice = elevator * unitPrice;
  installationPrice = (elevatorPrice * installFees) / 100;
  totalPrice = elevatorPrice + installationPrice;

  $("#elevatorUnitPrice").val(formatter.format(unitPrice));
  $("#elevatorPrice").val(formatter.format(elevatorPrice));
  $("#installationPrice").val(formatter.format(installationPrice));
  $("#totalPrice").val(formatter.format(totalPrice));
  
}

// I think I'm in love with the person who made 
//  into Js
const formatter = new Intl.NumberFormat('en-US', {
  style: 'currency',
  currency: 'USD',
  minimumFractionDigits: 2
})