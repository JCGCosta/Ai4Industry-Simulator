/* 
apas_agent controlling the Robot Arm. 
It acts on a thing described by: https://ci.mines-stetienne.fr/kg/itmfactory/bosch-apas#this
It has:
- the following action affordances:
-- grasp
-- moveTo
-- release
- the following property affordances:
-- inMovement
-- grasping

@author Olivier Boissier (Mines Saint-Etienne)
*/


/* Initial beliefs and rules */

td_name(boschApas). // boch-apas

thing(boschApas,Thing) :-
      thing(Thing)
      & bosch_apas(Thing)
      & has_action_affordance(Thing, MoveAction)
      & move_from_to_action(MoveAction)
      & has_action_affordance(Thing, GraspAction)
      & grasp_action(GraspAction)
      & has_action_affordance(Thing, ReleaseAction)
      & release_action(ReleaseAction)
      & has_property_affordance(Thing, InMovement)
      & activity_status(InMovement)
      & name(InMovement,"inMovement")
      & has_property_affordance(Thing, Grasping)
      & activity_status(Grasping)
      & name(Grasping,"grasping")
  .

+!start :
    name(Name)
    <-
    .print("Belief base is under initialization");
    !!run(Name);
  .

+!run(Name) : 
    thing(Name,Thing) 
    <-
    .print("Found suitable RobotArm : ", Thing) ;
    ?has_origin_coordinates(Name,CX,CY,CZ);
    .println(Thing, " has origin coordinates ",CX," ",CY," ",CZ);
  .

+!potItem[source(Sender)] :
    true
    <-
    !potItems(boschApas);
    .println("processed order and sending message to ",Sender);
    .send(Sender,tell,done(order))
  .

+!run(Name) :
    true
    <-
    .wait(100);
    !!run(Name);
  .

+!potItems(Name) :
    location_conveyor(Lc)
    & location_packaging(Lp)
    <-
    !carry(Name,Lc,Lp);
  .

// Fake plan. Adapt.
+!carry(Name,From,To) :
    true
    <-
    .println("carrying a pot from ",From," to ",To);
    !move(Name, From);
    !grasp(Name, From);
    !move(Name, To);
    !release(Name, To)
  .

{ include("inc/robot_arm_skills.asl") }
{ include("inc/common.asl") }
{ include("inc/owl-signature.asl") }

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
