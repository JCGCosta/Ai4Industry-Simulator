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

    !getDescription(Name);

    !testStatus(Name);

    // Not necessary to get all of them regularly. 
    // Choose and comment, otherwise there is a risk of
    // consuming all the computing resources
   // !observeInMovement(Name);
   // !observeGrasping(Name);

    !potItems(Name);

    !testStatus(Name);
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
    !carry1(Name,Lc,Lp);
    .wait(1000);
    !!potItems(Name);
  .

+!carry1(Name,From,To) :
    true
    <-
    !move(Name,[2.2,0,1]);
    .wait(1000);
    !grasp(Name,At);
    .wait(1000);
    !move(Name,[3.2,0,1]);
    .wait(1000);
    !release(Name,At);
  .

{ include("inc/robot_arm_skills.asl") }
{ include("inc/common.asl") }
{ include("inc/owl-signature.asl") }

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
