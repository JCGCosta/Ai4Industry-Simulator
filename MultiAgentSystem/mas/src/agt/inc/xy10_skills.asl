/* 

@author Olivier Boissier (Mines Saint-Etienne)
*/

// plan for testing the status of the Thing by accessing the property affordances
+!testStatus(Name) : 
    true 
    <-
    ?stackLightStatus(Name,StackLightStatusValue);
    .println("TEST Stack Ligh Status ",StackLightStatusValue);
    ?conveyorSpeed(Name,ConveyorSpeedValue);
    .println("TEST Conveyor Speed Value ",ConveyorSpeedValue);
    ?packageBuffer(Name,PackageBufferValue);
    .println("TEST Package Buffer Status ",PackageBufferValue);
    ?opticalSensorContainer1(Name,OpticalSensorContainer1Value);
    .println("TEST Optical Sensor Container 1 ",OpticalSensorContainer1Value);
    ?opticalSensorContainer2(Name,OpticalSensorContainer2Value);
    .println("TEST Optical Sensor Container 2 ",OpticalSensorContainer2Value);
    ?opticalSensorPackage(Name,OpticalSensorContainerValue);
    .println("TEST Optical Sensor Status ",OpticalSensorContainerValue);
    ?conveyorHeadStatus(Name,ConveyorHeadStatusValue);
    .println("TEST Conveyor Head Status ",ConveyorHeadStatusValue);
  .


/***************************************/

// Plan for calling the emergency stop action affordance
+!pressEmergencyStop(Name) :
    thing(Name,Thing)
    & stop_in_emergency_action(Thing,ActionName)
    <-
    !invokeAction(ActionName)[artifact_name(Name)];
    .println("acted on ",Name," to act on ",Thing," with operation ",ActionName);
  .

// Plan for writing a new value in the conveyorSpeed property
+!changeConveyorSpeed(Name,Value) :
    thing(Name,Thing)
    & conveyor_speed_property(Thing,PName)
    <-
    !writeProperty(PName,Value)[artifact_name(Name)];
    .println("acted on ",Name," to request ",Thing," to change property ", PName, " with value ",Value);
  .

/*******************/

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

// Plan for requesting the value of the packageBuffer property affordance
+?packageBuffer(Name,Value) :
    thing(Name,Thing)
    & package_buffer_property(Thing,PName)
    <-
    !readProperty(PName,Value)[artifact_name(Name)];
    .println("acted on ",Name," to request ",Thing," for current value of ",PName," : ", Value);
  .
// Plan for requesting the value of the opticalSensorPackage property affordance
+?opticalSensorPackage(Name,Value) :    
    thing(Name,Thing)
    & optical_sensor_status_property(Thing,PName)
    <-
    !readProperty(PName,Value)[artifact_name(Name)];
    .println("acted on ",Name," to request ",Thing," for current value of ",PName," : ", Value);
  .

// Plan for requesting the value of the opticalSensorContainer1 property affordance
+?opticalSensorContainer1(Name,Value) : 
    thing(Name,Thing) &
    optical_sensor_container_1(Thing,PName)
    <-
    !readProperty(PName,Value)[artifact_name(Name)];
    .println("acted on ",Name," to request ",Thing," for current value of ",PName," : ", Value);
  .

// Plan for requesting the value of the opticalSensorContainer2 property affordance
+?opticalSensorContainer2(Name,Value):
    thing(Name,Thing)
    & optical_sensor_container_2(Thing,PName)
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

/***************/

// Plan for observing the value of the stackLightStatus property affordance
+!observeStackLightStatus(Name):
    timer(Timer)
    & thing(Name,Thing)
    & stack_light_status_property(Thing,PName)
    <-
    !observeProperty(Name,PName,Timer);
    .println("acted on ",Name," to request ",Thing," to observe ",PName);
  .

// Plan for observing the value of the conveyorSpeed property affordance
+!observeConveyorSpeed(Name):
    timer(Timer)
    & thing(Name,Thing)
    & conveyor_speed_property(Thing,PName)
    <-
    !observeProperty(Name,PName,Timer);
    .println("acted on ",Name," to request ",Thing," to observe ",PName);
  .

// Plan for observing the value of the packageBuffer property affordance
+!observePackageBuffer(Name) :
    timer(Timer)
    & thing(Name,Thing)
    & package_buffer_property(Thing,PName)
    <-
    !observeProperty(Name,PName,Timer);
    .println("acted on ",Name," to request ",Thing," to observe ",PName);
  .

// Plan for observing the value of the opticalSensorPackage property affordance
+!observeOpticalSensorPackage(Name) :
    timer(Timer)
    & thing(Name,Thing)
    & optical_sensor_status_property(Thing,PName)
    <-
    !observeProperty(Name,PName,Timer);
    .println("acted on ",Name," to request ",Thing," to observe ",PName);
  .

// Plan for observing the value of the opticalSensorContainer1 property affordance
+!observeOpticalSensorContainer1(Name) :
    timer(Timer)
    & thing(Name,Thing)
    & optical_sensor_container_1(Thing,PName)
    <-
    !observeProperty(Name,PName,Timer);
    .println("acted on ",Name," to request ",Thing," to observe ",PName);
  .

// Plan for observing the value of the opticalSensorContainer2 property affordance
+!observeOpticalSensorContainer2(Name) :
    timer(Timer)
    & thing(Name,Thing)
    & optical_sensor_container_2(Thing,PName)
    <-
    !observeProperty(Name,PName,Timer);
    .println("acted on ",Name," to request ",Thing," to observe ",PName);
  .

// Plan for observing the value of the conveyorHeadStatus property affordance
+!observeConveyorHeadStatus(Name):
    timer(Timer)
    & thing(Name,Thing)
    & conveyor_head_status_property(Thing,PName)
    <-
    !observeProperty(Name,PName,Timer);
    .println("acted on ",Name," to request ",Thing," to observe ",PName);
  .

/*******************/

+propertyValue("stackLightStatus", X)[artifact_name(_,Name)] :
    thing(Name,Thing)
    <-
    .println("stack light status is now ", X);
  .

+propertyValue("conveyorSpeed", X)[artifact_name(_,Name)] :
    thing(Name,Thing)
    <-
    .println("conveyor speed is now ", X);
  .

+propertyValue("packageBuffer", X)[artifact_name(_,Name)] :
    thing(Name,Thing)
    <-
    .println("package buffer is now ", X);
  .

+propertyValue("opticalSensorPackage", X)[artifact_name(_,Name)] :
    thing(Name,Thing)
    <-
    .println("optical sensor package is now ", X);
  .

+propertyValue("opticalSensorContainer1", X)[artifact_name(_,Name)] :
    thing(Name,Thing)
    <-
    .println("optical sensor container1 is now ", X);
  .

+propertyValue("opticalSensorContainer2", X)[artifact_name(_,Name)] :
    thing(Name,Thing)
    <-
    .println(" optical sensor container2 is now ", X);
  .

+propertyValue("conveyorHeadStatus", X)[artifact_name(_,Name)] :
    thing(Name,Thing)
    <-
    .println(" conveyor head status is now ", X);
  .


