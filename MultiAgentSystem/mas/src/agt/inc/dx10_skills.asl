/*

@author Olivier Boissier (Mines Saint-Etienne)
*/


// plan for testing the status of the Thing by accessing the property affordances
+!testStatus(Name) :
    true
    <-
    ?stackLightStatus(Name,Light);
    .print("TEST Current light: ", Light);
    ?conveyorSpeed(Name,Speed);
    .print("TEST Current conveyor speed: ", Speed) ;
    ?conveyorHeadStatus(Name,CHS);
    .print("TEST Current conveyor head status: ", CHS);
    ?magneticValveStatus(Name,MVS);
    .print("TEST Current magnetic valve status: ", MVS);
    ?opticalSensorStatus(Name,OSS);
    .print("TEST Current optical sensor status: ", OSS);
    ?tankLevel(Name,Tank);
    .print("TEST Current tank level: ", Tank);
    ?positionX(Name,PX);
    .print("TEST Current position X: ", PX);
  .

/***************************************/

// Plan for writing a new value in the conveyorSpeed property
+!changeConveyorSpeed(Name,Value) :
    thing(Name,Thing)
    & conveyor_speed_property(Thing,PName)
    <-
    !writeProperty(PName,Value)[artifact_name(Name)];
    .println("acted on ",Name," to request ",Thing," to change property ", PName, " with value ",Value);
  .


// Plan for calling the emergency stop action affordance
+!pressEmergencyStop(Name) :
    thing(Name,Thing)
    & stop_in_emergency_action(Thing,ActionName)
    <-
    !invokeAction(ActionName)[artifact_name(Name)];
    .println("acted on ",Name," to act on ",Thing," with operation ", ActionName);
  .

/***************************************/

// Plan for requesting the value of the stackLightStatus property affordance
+?stackLightStatus(Name,Value) :
    thing(Name,Thing)
    & stack_light_status_property(Thing,PName)
    <-
    !readProperty(PName,Value)[artifact_name(Name)];
    .println("acted on ",Name," to request ",Thing," for current value of ",PName," : ", Value);
  .

// Plan for requesting the value of the conveyorSpeed property affordance
+?conveyorSpeed(Name,Value) :
    thing(Name,Thing)
    & conveyor_speed_property(Thing,PName)
    <-
    !readProperty(PName,Value)[artifact_name(Name)];
    .println("acted on ",Name," to request ",Thing," for current value of ",PName," : ", Value);
  .

// Plan for requesting the value of the conveyorHeadStatus property affordance
+?conveyorHeadStatus(Name,Value) :
    thing(Name,Thing)
    & conveyor_head_status_property(Thing,PName)
    <-
    !readProperty(PName,Value)[artifact_name(Name)];
    .println("acted on ",Name," to request ",Thing," for current value of ",PName," : ", Value);
  .

// Plan for requesting the value of the magneticValveStatus property affordance
+?magneticValveStatus(Name,Value) :
    thing(Name,Thing)
    & magnetic_valve_status_property(Thing,PName)
    <-
    !readProperty(PName,Value)[artifact_name(Name)];
    .println("acted on ",Name," to request ",Thing," for current value of ",PName," : ", Value);
  .

// Plan for requesting the value of the opticalSensorStatus property affordance
+?opticalSensorStatus(Name,Value) :
    thing(Name,Thing)
    & optical_sensor_status_property(Thing,PName)
    <-
    !readProperty(PName,Value)[artifact_name(Name)];
    .println("acted on ",Name," to request ",Thing," for current value of ",PName," : ", Value);
  .

// Plan for requesting the value of the tankLevel property affordance
+?tankLevel(Name,Value) :
    thing(Name,Thing)
    & tank_level_property(Thing,PName)
    <-
    !readProperty(PName,Value)[artifact_name(Name)];
    .println("acted on ",Name," to request ",Thing," for current value of ",PName," : ", Value);
  .

// Plan for requesting the value of the positionX property affordance
+?positionX(Name,Value) :
    thing(Name,Thing)
    & position_x_property(Thing,PName)
    <-
    !readProperty(PName,Value)[artifact_name(Name)];
    .println("acted on ",Name," to request ",Thing," for current value of ",PName," : ", Value);
  .

/********************************/

// Plan for observing (pulling) the value of the stackLightStatus property affordance
+!observeStackLightStatus(Name) :
    timer(Timer)
    & thing(Name,Thing)
    & stack_light_status_property(Thing,PName)
    <-
    !observeProperty(Name,PName,Timer);
    .println(Name,"---> ",Thing," observing current stack light status for ",PName);
  .

// Plan for observing (pulling) the value of the conveyorSpeed property affordance
+!observeConveyorSpeed(Name) :
    timer(Timer)
    & thing(Name,Thing)
    & conveyor_speed_property(Thing,PName)
    <-
    !observeProperty(Name,PName,Timer);
    .println("acted on ",Name," to request ",Thing," to observe ",PName);
  .

// Plan for observing (pulling) the value of the conveyorHeadStatus property affordance
+!observeConveyorHeadStatus(Name) :
    timer(Timer)
    & thing(Name,Thing)
    & conveyor_head_status_property(Thing,PName)
    <-
    //?property_full_name(Thing,PName,FullName);
    !observeProperty(Name,PName,Timer);
    .println("acted on ",Name," to request ",Thing," to observe ",PName);
  .

// Plan for observing (pulling) the value of the MagneticValveStatus property affordance
+!observeMagneticValveStatus(Name) :
    timer(Timer)
    & thing(Name,Thing)
    & magnetic_valve_status_property(Thing,PName)
    <-
    !observeProperty(Name,PName,Timer);
    .println("acted on ",Name," to request ",Thing," to observe ",PName);
  .

// Plan for observing (pulling) the value of the opticalSensorStatus property affordance
+!observeOpticalSensorStatus(Name) :
    timer(Timer)
    & thing(Name,Thing)
    & optical_sensor_status_property(Thing,PName)
    <-
    //?property_full_name(Thing,PName,FullName);
    !observeProperty(Name,PName,Timer);
    .println("acted on ",Name," to request ",Thing," to observe ",PName);
  .

// Plan for observing (pulling) the value of the tankLevel property affordance
+!observeTankLevel(Name) :
    timer(Timer)
    & thing(Name,Thing)
    & tank_level_property(Thing,PName)
    <-
    !observeProperty(Name,PName,Timer);
    .println("acted on ",Name," to request ",Thing," to observe ",PName);
  .

// Plan for observing (pulling) the value of the positionX property affordance
+!observePositionX(Name) :
    timer(Timer)
    & thing(Name,Thing)
    & position_x_property(Thing,PName)
    <-
    !observeProperty(Name,PName,Timer);
    .println("acted on ",Name," to request ",Thing," to observe ",PName);
  .

/**********************/

+propertyValue("stackLightStatus", X)[artifact_name(_,Name)] :
    thing(Name,Thing)
    <-
    .println("stackLight Status is now ",X);
  .

+propertyValue("conveyorSpeed", Speed)[artifact_name(_,Name)] :
    thing(Name,Thing)
    <-
    .println("current conveyor speed is ", Speed);
  .

+propertyValue("conveyorHeadStatus", X)[artifact_name(_,Name)] :
    thing(Name,Thing)
    <-
    .println("conveyorHead Status is now ",X);
  .

+propertyValue("magneticValveStatus", X)[artifact_name(_,Name)] :
    thing(Name,Thing)
    <-
    .println("magnetic Valve Status is now ",X);
  .

+propertyValue("opticalSensorStatus", X)[artifact_name(_,Name)] :
    thing(Name,Thing)
    <-
    .println("opticalSensor Status is now ",X);
  .
+propertyValue("tankLevel", X)[artifact_name(_,Name)] :
    thing(Name,Thing)
    <-
    .println("tank level is now ", X);
  .

+propertyValue("positionX", X)[artifact_name(_,Name)] :
    thing(Name,Thing)
    <-
    .println("positionX is now ",X);
  .

