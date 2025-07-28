/* 
xy10_agent controlling the Packaging Workshop 
It acts on a thing described by: https://ci.mines-stetienne.fr/kg/itmfactory/xy10
It has:
- the following action affordances:
-- pressEmergencyStop
- the following property affordances
-- stackLightStatus
-- conveyorSpeed
-- packageBuffer
-- opticalSensorPackage
-- opticalSensorContainer1
-- opticalSensorContainer2
-- conveyorHeadStatus

@author Olivier Boissier (Mines Saint-Etienne)
*/

/* Initial beliefs and rules */

thing(packagingWorkshop,Thing) :-
    thing(Thing)
    // TODO include signature from the Product Ontology
    & rdf(Thing, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/ns/sosa/Platform" )
    & rdf(Thing, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.productontology.org/id/Packaging_machinery")
    & has_action_affordance(Thing, PressEmergencyStop)
    & stop_in_emergency_action(PressEmergencyStop)
    & has_property_affordance(Thing,OpticalSensorContainer2)
    & optical_sensor_status(OpticalSensorContainer2)
    & name(OpticalSensorContainer2,"opticalSensorContainer2")
    & has_property_affordance(Thing,StackLightStatus)
    & stack_light_status(StackLightStatus)
    & has_property_affordance(Thing,PackageBuffer)
    & count(PackageBuffer)
    & has_property_affordance(Thing,ConveyorHeadStatus)
    & optical_sensor_status(ConveyorHeadStatus)
    & name(ConveyorHeadStatus,"conveyorHeadStatus")
    & has_property_affordance(Thing,ConveyorSpeed)
    & conveyor_speed(ConveyorSpeed)
    & has_property_affordance(Thing,OpticalSensorContainer1)
    & optical_sensor_status(OpticalSensorContainer1)
    & name(OpticalSensorContainer1,"opticalSensorContainer1")
    & has_property_affordance(Thing,OpticalSensorPackage)
    & optical_sensor_status(OpticalSensorPackage)
    & name(OpticalSensorPackage,"opticalSensorPackage")
  .


/* Initial goals */

/* Plans */

+!start :
    name(Name)
    <-
    .println("Belief base is under initialization");
    !!run(Name);
  .

+!run(Name) : thing(Name,Thing) <-
    .print("Found suitable Packaging : ", Thing) ;

    ?locationOfInputMaterial(Name,CIX,CIY,CIZ);
    ?locationOfOutputProduct(Name,COX,COY,COZ);
    !getDescription(Name);
    !testStatus(Name);

    // Not necessary to get all of them regularly. 
    // Choose and comment, otherwise there is a risk of
    // consuming all the computing resources
   // !observeStackLightStatus(Name);
   // !observeConveyorSpeed(Name); 
  //  !observePackageBuffer(Name);
  //  !observeOpticalSensorPackage(Name);
  //  !observeOpticalSensorContainer1(Name);
  //  !observeOpticalSensorContainer2(Name);
  //  !observeConveyorHeadStatus(Name);

    ?conveyorSpeed(Name,IS);
    if (IS == 0) {
      !changeConveyorSpeed(Name,IS+0.5);
    }
    !packageItems(Name);

    !testStatus(Name);
  .

+!run(Name) : 
    true 
    <- 
    .wait(100); 
    !!run(Name);
  .

// Fake plan. Adapt.
+!packageItems(Name) :
    thing(Name,Thing)
    <-
    .println("is packaging Item.");
    .wait(1000);
  .

// TO BE COMPLETED ....

{ include("inc/xy10_skills.asl") }
{ include("inc/common.asl") }
{ include("inc/owl-signature.asl") }

{ include("$jacamoJar/templates/common-cartago.asl") }
