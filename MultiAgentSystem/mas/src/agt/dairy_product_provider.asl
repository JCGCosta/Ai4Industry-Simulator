/*
 Dairy Product Provider agent
 Able to provide dairy product on request
 It acts on a thing that has:
 - the following action affordances:
 -- order
 - has no property affordances
 - has the following event affordances:
 -- delivered

@author Olivier Boissier (Mines Saint-Etienne)
*/

/* Initial beliefs and rules */

thing(dairyProductProvider,Thing) :-
    thing(Thing)
    // TODO include signature from the Product Ontology
    & rdf(Thing,"https://www.w3.org/2019/wot/td#title","dairy-product-provider")
    & has_action_affordance(Thing, OrderDairy)
    & name(OrderDairy,"order")
    & has_event_affordance(Thing,Delivered)
    & name(Delivered,"delivered")
  .

/* Initial goals */

/* Plans */

+!start :
    name(Name)
    <-
    .println("Belief base is under initialization");
    !!run(Name);
  .

+!run(Name) : 
  thing(Name,Thing)
  <-
    .print("found suitable dairy product provider: ", Thing) ;
    !getDescription(Name);
.

+!run(Name) :
    true
    <-
    .wait(100);
    !!run(Name);
  .

+!order(Value)[source(Sender)] :
    true
    <-
    !order(dairyProductProvider,Value);
    .println("processed order and sending message to ",Sender);
    .send(Sender,tell,done(order));
  .

+!order(Name,Value) :
    thing(Name,Thing)
    & order_action(Thing,ActionName)
    <-
    .println("acting on ",Name," to act on ",Thing," with parameter ",Value," on operation ", ActionName);
    !invokeAction(ActionName,Value)[artifact_name(Name)];
    .println("acted on ",Name," to act on ",Thing," with parameter ",Value," on operation ", ActionName);
  .

{ include("inc/common.asl") }
{ include("inc/owl-signature.asl") }

{ include("$jacamoJar/templates/common-cartago.asl") }
