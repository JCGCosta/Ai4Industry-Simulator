/* 

@author Olivier Boissier (Mines Saint-Etienne)
*/

// used for concatenating the base url
builder(Arg1,Base,End,Arg2) :-
    .concat(Base,End,Result)
    & rdf(Arg1,Result,Arg2)
  .

location_of_output_product(Name, ValueX, ValueY, ValueZ) :-
      thing(Name, Thing)
      & entryPoint(Base)
      & builder(Thing,Base,"ontology#locationOfOutputProduct",Temp)
      & builder(Temp,Base,"ontology#coordX",ValueX)
      & builder(Temp,Base,"ontology#coordY",ValueY)
      & builder(Temp,Base,"ontology#coordZ",ValueZ)
  .

location_of_input_material(Name,ValueX, ValueY, ValueZ) :-
      thing(Name, Thing)
      & entryPoint(Base)
      & builder(Thing,Base,"ontology#locationOfInputMaterial",Temp)
      & builder(Temp,Base,"ontology#coordX",ValueX)
      & builder(Temp,Base,"ontology#coordY",ValueY)
      & builder(Temp,Base,"ontology#coordZ",ValueZ)
  .

//action_target(Thing,ActionName,Target) :-
action_full_name(Thing,ActionName,Target) :-
    thing(Thing)
    & name(Action1,ActionName)
    & action_affordance(Action1)
    & has_form(Action1,ActionForm)
    & has_target(ActionForm,Target)
  .

/*
action_full_name(Thing,ActionName,Target) :-
    thing(Thing)
    & name(Action1,ActionName)
    & action_affordance(Action1)
    & rdf(Action1,"http://www.w3.org/1999/02/22-rdf-syntax-ns#type",Target)
    & Target \== "https://www.w3.org/2019/wot/td#ActionAffordance"
.
*/

property_full_name(Thing,PName,FName) :-
    thing(Thing)
    & name(Prop,PName)
    & property_affordance(Prop)
    & rdf(Prop,"http://www.w3.org/1999/02/22-rdf-syntax-ns#type",FName)
    & FName \== "https://www.w3.org/2019/wot/td#PropertyAffordance"
.

order_action(Thing, ActionName) :-
    thing(Thing)
    & has_action_affordance(Thing,TAction)
    & name(TAction,ActionName)
    & ActionName == "order"
  .

order_packages_action(Thing, ActionName) :-
    thing(Thing)
    & has_action_affordance(Thing,TAction)
    & name(TAction,ActionName)
    & ActionName == "orderPackages"
  .

move_from_to_action(Thing,ActionName) :-
      thing(Thing)
      & has_action_affordance(Thing, MoveAction)
      & move_from_to_action(MoveAction)
      & name(MoveAction, ActionName)
  .


release_action(Thing, ActionName) :-
      thing(Thing)
      & has_action_affordance(Thing,RAction)
//      & entryPoint(Base)
//      & .concat(Base,"ontology#Release",Result)
//      & rdf(RAction,"http://www.w3.org/1999/02/22-rdf-syntax-ns#type",Result)
      & release_action(RAction)
      & name(RAction, ActionName)
  .

reset_action(Thing,ActionName) :-
      thing(Thing)
      & has_action_affordance(Thing,RAction)
      & entryPoint(Base)
      & .concat(Base,"ontology#Reset",Result)
      & rdf(RAction,"http://www.w3.org/1999/02/22-rdf-syntax-ns#type",Result)
      & name(RAction,ActionName)
  .

grasp_action(Thing, ActionName) :-
      thing(Thing)
      & has_action_affordance(Thing,GAction)
//      & entryPoint(Base)
//      & .concat(Base,"ontology#GraspAction",Result)
//      & .concat(Base,"ontology#Grasp",Result)
//      & rdf(GAction,"http://www.w3.org/1999/02/22-rdf-syntax-ns#type",Result)
      & grasp_action(GAction)
      & name(GAction, ActionName)
  .

move_action(Thing,ActionName) :-
      thing(Thing)
      & has_action_affordance(Thing, MoveAction)
//      & entryPoint(Base)
//      & .concat(Base,"ontology#MoveTo",Result)
//      & .concat(Base,"ontology#MoveFromToAction",Result)
//      & rdf(MoveAction,"http://www.w3.org/1999/02/22-rdf-syntax-ns#type",Result)
      & move_from_to_action(MoveAction)
      & name(MoveAction, ActionName)
  .

stop_in_emergency_action(Thing,ActionName) :-
    thing(Thing)
    & has_action_affordance(Thing, Action)
    & stop_in_emergency_action(Action)
    & name(Action,ActionName)
  .

stack_light_status_property(Thing,PName) :-
    thing(Thing)
    & has_property_affordance(Thing,Property)
    & stack_light_status(Property)
    & name(Property,PName)
  .

position_x_property(Thing,PName) :-
    thing(Thing)
    & has_property_affordance(Thing, Property)
    & x_coordinate(Property)
    & name(Property,PName)
  .

position_z_property(Thing,PName) :-
    thing(Thing)
    & has_property_affordance(Thing, Property)
    & z_coordinate(Property)
    & name(Property,PName)
  .

tank_level_property(Thing,PName):-
    thing(Thing)
    & has_property_affordance(Thing,Property)
    & liquid_volume(Property)
    & name(Property,PName)
  .

conveyor_speed_property(Thing,PName):-
    thing(Thing)
    & has_property_affordance(Thing, Property)
    & conveyor_speed(Property)
    & name(Property,PName)
  .

optical_sensor_status_property(Thing,PName):-
    thing(Thing)
    & has_property_affordance(Thing,Property)
    & optical_sensor_status(Property)
    & name(Property,PName)
  .

conveyor_head_status_property(Thing,PName) :-
    thing(Thing)
    & has_property_affordance(Thing,Property)
    & optical_sensor_status(Property)
    & name(Property,PName)
    & PName == "conveyorHeadStatus"
  .

magnetic_valve_status_property(Thing,PName) :-
    thing(Thing)
    & has_property_affordance(Thing, Property)
    & valve_status(Property)
    & name(Property,PName)
  .

capacity_property(Thing,PName) :-
    thing(Thing)
    & has_property_affordance(Thing, Property)
    & maximum_count(Property)
    & name(Property,PName)
  .

clamp_status_property(Thing,PName) :-
    thing(Thing)
    & has_property_affordance(Thing, Property)
    & boolean_schema(Property)
    & name(Property,PName)
    & PName == "clampStatus"
  .

package_buffer_property(Thing,PName) :-
    thing(Thing)
    & has_property_affordance(Thing,Property)
    & count(Property)
    & name(Property,PName)
  .

optical_sensor_container_1(Thing,PName) :-
    thing(Thing)
    & has_property_affordance(Thing,Property)
    & optical_sensor_status(Property)
    & name(Property,PName)
    & PName == "opticalSensorContainer1"
  .

optical_sensor_container_2(Thing,PName) :-
    thing(Thing)
    & has_property_affordance(Thing,Property)
    & optical_sensor_status(Property)
    & name(Property,PName)
    & PName == "opticalSensorContainer2"
  .

in_movement_property(Thing,PName) :-
    thing(Thing)
    & has_property_affordance(Thing, Property)
    & activity_status(Property)
    & name(Property,PName)
    & PName == "inMovement"
  .

grasping_property(Thing,PName) :-
    thing(Thing)
    & has_property_affordance(Thing, Property)
    & activity_status(Property)
    & name(Property,PName)
    & PName == "grasping"
  .

//------------------------- Plans ----------------

+?locationOfInputMaterial(Name,CX,CY,CZ) :
    thing(Name,Thing) <-
    ?location_of_input_material(Name,CX,CY,CZ);
    .println(Thing," is getting input material at ",CX," ",CY," ",CZ);
  .

+?locationOfOutputProduct(Name,CX,CY,CZ) :
    thing(Name,Thing) <-
    ?location_of_output_product(Name,CX,CY,CZ);
    .println(Thing," is letting output material at ",CX," ",CY," ",CZ);
  .

+!observeProperty(Name,PName,Timer) :
    thing(Name,Thing) <-
    !readProperty(PName,_)[artifact_name(Name)];
    .wait(Timer) ;
    !!observeProperty(Name,PName,Timer) ;
  .

+!getDescription(Name) : thing(Name,Thing) <-
    .println("----------------------------------------------------");
    .findall(AN,has_action_affordance(Thing, AA) &  name(AA, AN),AL);
    .println(Thing," has the following action affordances ",AL);
    .findall(PN,has_property_affordance(Thing,PA) & name(PA, PN),PL);
    .println(Thing," has the following property affordances ",PL);
    .findall(EN,has_event_affordance(Thing,EA) & name(EA, EN),EL);
    .println(Thing," has the following event affordances ",EL);
    .println("----------------------------------------------------");
  .

+!readProperty(PName, Value)[artifact_name(Name)] :
  thing(Name, Thing)
  & has_property_affordance(Thing, Property)
  & name(Property,PName)
  & has_form(Property, Form)
  & has_target(Form, URI)
  <-
    !prepareForm(F);
    get(URI, F);
    ?(json(Value)[source(URI)]);
    !updatePropertyValue(Name, PName, Value);
  .

+!updatePropertyValue(Name, PName, Value) :
  not propertyValue(PName,_)[artifact_name(_,Name)]
  <-
    // add statement for the first time
    +propertyValue(PName, Value)[artifact_name("",Name)];
  .

+!updatePropertyValue(Name, PName, Value) :
  propertyValue(PName, PreviousValue)[artifact_name(Any,Name)]
  & PreviousValue \== Value
  <-
    // update statement with new value, if changed
    -+propertyValue(PName, Value)[artifact_name(Any,Name)];
  .

+!updatePropertyValue(Name, PName, Value)
  // otherwise, do nothing (statement already there)
  .

+!writeProperty(PName, Value)[artifact_name(Name)] :
  thing(Name, Thing)
  & has_property_affordance(Thing, Property)
  & name(Property,PName)
  & has_form(Property, Form)
  & has_target(Form, URI)
  <-
    !prepareForm(F) ;
    put(URI, [json(Value)], F) ;
  .

+!invokeAction(ActionName)[artifact_name(Name)] :
  thing(Name, Thing)
  & has_action_affordance(Thing, Action)
  & name(Action,ActionName)
  & has_form(Action, Form)
  & has_target(Form, URI)
  <-
    !prepareForm(F) ;
    post(URI, [], F) ;
  .

+!invokeAction(ActionName, Input)[artifact_name(Name)] :
  thing(Name, Thing)
  & has_action_affordance(Thing, Action)
  & name(Action,ActionName)
  & has_form(Action, Form)
  & has_target(Form, URI)
  <-
    !prepareForm(F) ;
    post(URI, [json(Input)], F) ;
  .

+!prepareForm(F) : credentials(User, Pw)
    <-
    h.basic_auth_credentials(User, Pw, H) ;
    F = [kv("urn:hypermedea:http:authorization", H)] .

+!prepareForm([])
    <-
    .print("Warning: interacting with Things requires HTTP basic authentication but no credentials found.") .
