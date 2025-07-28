+!testStatus(Name) : true <-
    ?stackLightStatus(Name,LightValue);
    .print("TEST Current light: ", LightValue) ;
    ?capacity(Name,CapacityValue);
    .print("TEST Current capacity: ", CapacityValue) ;
    ?positionX(Name,XValue);
    .print("TEST Current arm X position: ", XValue) ;
    ?positionZ(Name,ZValue);
    .print("TEST Current arm Z position: ", ZValue) ;
    ?clampStatus(Name,ClampStatus);
    .print("TEST Current clamp status: ",ClampStatus);
    ?conveyorSpeed(Name,SpeedValue);
    .print("TEST Current speed: ", SpeedValue) ;
.

+!changeConveyorSpeed(Name,Value) :
    thing(Name,Thing)
    & conveyor_speed_property(Thing,PName)
    <-
    !writeProperty(PName,Value)[artifact_name(Name)];
    .println("Acted on ",Name," to request ",Thing," to change property ", PName, " with value ",Value).

+!pressEmergencyStop(Name) :
    thing(Name,Thing)
    & stop_in_emergency_action(Thing,ActionName)
    <-
    .println("Acting on ",Name," to act on ",Thing," with operation ",ActionName);
    !invokeAction(ActionName)[artifact_name(Name)];
    .println("Acted on ",Name," to act on ",Thing," with operation ",ActionName).

+!pickItem(Name,To) :
    thing(Name,Thing)
    & move_from_to_action(Thing,ActionName)
    <-
    .println("Acting on ",Name," to act on ",Thing," with operation ",ActionName," with parameter ", To);
    !invokeAction(ActionName,To)[artifact_name(Name)];
    .println("Acted on ",Name," to act on ",Thing," with operation ",ActionName," with parameter ", To).

-!pickItem(Name,To) :
    thing(Name,Thing)
    & move_from_to_action(Thing,MActionName)
    & provider(Provider)
    <-
    ?clampStatus(Name,Value);
    .println("Error in picking Item at ",To, " clamp status is ",Value);
    if (Value) {
      .println("A cup is on the cup provider and I am waiting !!!!!!!!!!");
    }
    else {
      .send(Provider,achieve,order(25));
      .println("I have sent an order to the cup provider and I am waiting !!!!!!!!!!");
    }
    .wait(4000).

+?stackLightStatus(Name,Value) :
    thing(Name,Thing)
    & stack_light_status_property(Thing,PName)
    <-
    !readProperty(PName,Value)[artifact_name(Name)];
    .println("Acted on ",Name," to request ",Thing," for current value of ",PName," : ", Value).

+?capacity(Name,Value) :
    thing(Name,Thing)
    & capacity_property(Thing,PName)
    <-
    !readProperty(PName,Value)[artifact_name(Name)];
    .println("Acted on ",Name," to request ",Thing," for current value of ",PName," : ", Value).

+?positionX(Name, Value) :
    thing(Name,Thing)
    & position_x_property(Thing,PName)
    <-
    !readProperty(PName,Value)[artifact_name(Name)];
    .println("Acted on ",Name," to request ",Thing," for current value of ",PName," : ", Value).

+?positionZ(Name, Value) :
    thing(Name,Thing)
    & position_z_property(Thing,PName)
    <-
    !readProperty(PName,Value)[artifact_name(Name)];
    .println("Acted on ",Name," to request ",Thing," for current value of ",PName," : ", Value).

+?clampStatus(Name,Value) :
    thing(Name,Thing)
    & clamp_status_property(Thing,PName)
    <-
    !readProperty(PName,Value)[artifact_name(Name)];
    .println("Acted on ",Name," to request ",Thing," for current value of ",PName," : ", Value).

+?conveyorSpeed(Name,Value) :
    thing(Name,Thing)
    & conveyor_speed_property(Thing,PName)
    <-
    !readProperty(PName,Value)[artifact_name(Name)];
    .println("Acted on ",Name," to request ",Thing," for current value of ",PName," : ", Value).

+!observeStackLightStatus(Name) :
    timer(Timer)
    & thing(Name,Thing)
    & stack_light_status_property(Thing,PName)
    <-
    !observeProperty(Name,PName,Timer);
    .println("Acted on ",Name," to request ",Thing," to observe ",PName).

+!observeCapacity(Name) :
    timer(Timer)
    & thing(Name,Thing)
    & capacity_property(Thing,PName)
    <-
    !observeProperty(Name,PName,Timer);
    .println("Acted on ",Name," to request ",Thing," to observe ",PName).

+!observePositionX(Name) :
    timer(Timer)
    & thing(Name,Thing)
    & position_x_property(Thing,PName)
    <-
    !observeProperty(Name,PName,Timer);
    .println("Acted on ",Name," to request ",Thing," to observe ",PName).

+!observePositionZ(Name) :
    timer(Timer)
    & thing(Name,Thing)
    & position_z_property(Thing,PName)
    <-
    !observeProperty(Name,PName,Timer);
    .println("Acted on ",Name," to request ",Thing," to observe ",PName).

+!observeClampStatus(Name) :
    timer(Timer)
    & thing(Name,Thing)
    & clamp_status_property(Thing,PName)
    <-
    !observeProperty(Name,PName,Timer);
    .println("Acted on ",Name," to request ",Thing," to observe ",PName).

+!observeConveyorSpeed(Name) :
    timer(Timer)
    & thing(Name,Thing)
    & conveyor_speed_property(Thing,PName)
    <-
    !observeProperty(Name,PName,Timer);
    .println("Acted on ",Name," to request ",Thing," to observe ",PName).

+propertyValue("stackLightStatus", X)[artifact_name(_,Name)] :
    thing(Name,Thing)
    <-
    .println("stackLightStatus is now ",X).

+propertyValue("capacity", X)[artifact_name(_,Name)] :
    thing(Name,Thing)
    <-
    .println("capacity is now ",X).

+propertyValue("positionX", X)[artifact_name(_,Name)] :
    thing(Name,Thing)
    <-
    .println("positionX is now ",X).

+propertyValue("positionZ", X)[artifact_name(_,Name)] :
    thing(Name,Thing)
    <-
    .println("positionZ is now ",X).

+propertyValue("clampStatus", X)[artifact_name(_,Name)] :
    thing(Name,Thing)
    <-
    .println("clampStatus is now ",X).

+propertyValue("conveyorSpeed", X)[artifact_name(_,Name)] :
    thing(Name,Thing)
    <-
    .println("conveyorSpeed is now ",X).

{ include("inc/common.asl") }