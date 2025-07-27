/*
Alice is an agent. Its "cognitive" state is composed of
- beliefs (atomic statements, as in Prolog) and
- goals (atomic statements prefixed with '!' or '?').

The following line initializes the agent's state with a belief that gives what 
credentials it should use to interact with the simulated manufacturing line.

TODO: replace N with your group number to obtain, e.g. "simu1", or "simu2", or etc.
*/
credentials("simu2", "simu2") .

/* *************************
   BELIEFS

Belief : thing(T)
Description : Thing T retrieved from the Thing Description.

Belief : hasProperty(T, P)
Description : Thing T has Property P.

Belief : hasForm(T, PAE, F)
Description : Thing T has Form F that defines a Property, Action or Event PAE.

Belief : hasTargetURI(F, URI)
Description : Form F has the Hyperlink Reference URI.
**************************** */
{ include("beliefs.asl") }

/* *************************
   GOALS

Goal : getTD(TD)
Description : Retrieve a Thing Description document in the TD URI and display
the Thing tag.

Goal : listProperties(T)
Description : Display all the properties in the Thing T.

Goal : readProperty(T, P)
Description : Read and display the value of the Property P in the Thing T.

Goal : writeProperty(T, P, Val)
Description : Write the value Val to the Property P in the Thing T.

Goal : invokeAction(T, A, In)
Description : Invoke Action A in the Thing T with the Input value In in JSON format.

Goal : prepareForm(F)
Description : Prepare an authentication Form F used to act on the Thing.
**************************** */
{ include("goals.asl") }


/* *************************
   EXERCISES

1. Edit the '!start' plan below to read the TD of the VL10 workshop and print its
properties to the console.

Look at https://gitlab.emse.fr/ai4industry/hackathon/-/wikis/conveying-workshop
for more details about the VL10 workshop.

2. Re-write the plan so that Alice sets the conveyor speed of the VL10 workshop
to 0.5 (m/s) and then picks an item at position (0,0).

That will be all for now. More details about the Jason language will be given
in the MAS lecture.
**************************** */
+!start
    <-
    !getTD("https://ci.mines-stetienne.fr/simu/storageRack");
    ?thing(T);
    !readProperty(T, conveyorSpeed);
    !writeProperty(T, conveyorSpeed, 0.5);
    !readProperty(T, conveyorSpeed).

!start . // entry point of the agent's reasoning cycle

{ include("$jacamoJar/templates/common-cartago.asl") }