/*
Bob is an agent. Its "cognitive" state is composed of
- beliefs (atomic statements, as in Prolog) and
- goals (atomic statements prefixed with '!' or '?').

Bob crawls (a subset of) the Web by dereferencing the given URI and
by following only certain links. Here, it only follows links between systems
(as Web resources) and their subsystems. In other words, it is only interested
in resources likely to contain a description of the manufacturing line.

Similar to Alice's, it is provided other goals to handle reading and writing
properties, and invoking actions. There is a significant difference between
the two, though: Bob does not consider the actual names of Things or
property/action affordances. Instead, it only considers classes, so as to 
behave identically if two Things have the same interface.

The following line initializes the agent's state with a belief that gives what 
credentials it should use to interact with the simulated manufacturing line.

TODO: replace N with your group number to obtain, e.g. "simu1", or "simu2", or etc.
*/
credentials("simu2", "simu2") .



/* *************************
   BELIEFS

Belief : type(Indidual, Class)
Description : The Individual is of type Class.

Belief : system(Individual)
Description : The Individual is of type System ("http://www.w3.org/ns/ssn/System").

Belief : thing(Individual)
Description : The Individual is of type Thing ("https://www.w3.org/2019/wot/td#Thing").

Belief : automated_storage_and_retrieval_system(Individual)
Description : The Individual is of type Automated_storage_and_retrieval_system ("http://www.productontology.org/id/Automated_storage_and_retrieval_system").

Belief : type(Individual, automated_storage_and_retrieval_system)
Description : The Individual is of type Automated_storage_and_retrieval_system ("http://www.productontology.org/id/Automated_storage_and_retrieval_system").

Belief : conveyorSpeed(Individual)
Description : The Individual is of type ConveyorSpeed ("https://ci.mines-stetienne.fr/kg/ontology#ConveyorSpeed").

Belief : type(Individual, conveyorSpeed)
Description : The Individual is of type ConveyorSpeed ("https://ci.mines-stetienne.fr/kg/ontology#ConveyorSpeed").

Belief : moveFromToAction(Individual)
Description : The Individual is of type MoveFromToAction ("https://ci.mines-stetienne.fr/kg/ontology#MoveFromToAction").

Belief : type(Individual, moveFromToAction)
Description : The Individual is of type MoveFromToAction ("https://ci.mines-stetienne.fr/kg/ontology#MoveFromToAction").

Belief : hasSubSystem(Individual1, Individual2)
Description : Individual1 has subsystem Individual2.

Belief : hasPropertyAffordance(Individual1, Individual2)
Description : Individual1 has property affordance Individual2.

Belief : hasActionAffordance(Individual1, Individual2)
Description : Individual1 has action affordance Individual2.

Belief : name(Individual1, Individual2)
Description : Individual1 has name Individual2.

Belief : hasForm(Individual1, Individual2)
Description : Individual1 has form Individual2.

Belief : hasTarget(Individual1, Individual2)
Description : Individual1 has target Individual2.
**************************** */
{ include("beliefs.asl") }



/* *************************
   GOALS

Goal : crawl(URI)
Description : Crawl (a subset of) the Web by dereferencing the given URI and
by following only certain links.

Goal : listThings
Description : Display all the things.

Goal : listPropertyAffordances(TType)
Description : Read and display the value of the property affordances of the
Thing TType.

Goal : readProperty(TType, PType)
Description : Read and display the value of the Property PType in the Thing TType.

Goal : writeProperty(TType, PType, Val)
Description : Write the value Val to the Property PType in the Thing TType.

Goal : invokeAction(TType, AType, In)
Description : Invoke Action AType in the Thing TType with the Input value In
in JSON format.

Goal : prepareForm(F)
Description : Prepare an authentication Form F used to act on the Thing.
**************************** */
{ include("goals.asl") }



/* *************************
   EXERCISES
   
1. Add instructions to the 'start' plan below to crawl the IT'm Factory KG, starting
from its entry point. Then, while the program is running, open the Jason inspector
at http://127.0.1.1:3272/ and select bob. What do you see? How are RDF triples
represented in Jason? Read the documentation of Hypermedea to fully understand 
the mapping between RDF triples and Jason logical formulas:
https://hypermedea.github.io/javadoc/latest/org/hypermedea/ct/rdf/package-summary.html

2. The plan for crawling resources (starting with +!crawl(URI) <- ...) calls an
operation provided by Hypermedea: `h.target`. On the Semantic Web, it is
important to distinguish between information resources (an HTML page, a Turtle
document, an image, etc.) and non-information or "semantic" resources (a 
person, an event, a factory workshop, etc.). It is common to identify semantic 
URIs with hash URIs, i.e., URIs with a fragment. However, HTTP requests must 
always target URIs without fragments. In which case it is useful to know the 
target URI of a request when crawling resources? Find an example in the IT'm 
Factory KG.

3. Reproduce the behavior of Alice (get the TD of the VL10 workshop, set its
conveyor speed to 0.5 m/s and pick an item) with Bob's plans. Remember to use
classes instead of actual names to identify Things and affordances.

Now that your agent has dynamically discovered WoT affordances, it can select
the ones relevant to reach its goals and act on the factory workshops in an
adaptive fashion. It is the purpose of autonomous agents in a multi-agent
system, the next part of the summer school.
*/
+!start
    <-
    !crawl("https://ci.mines-stetienne.fr/kg/itmfactory/vl10#this");
    //!listPropertyAffordances(TType);
    !readProperty(TType, conveyorSpeed);
    !writeProperty(TType, conveyorSpeed, 0.1);
    !readProperty(TType, conveyorSpeed).
    //!listPropertyAffordances(TType);
    //!listThings;
    //!readProperty(TType, magneticValveStatus);
    //!readProperty(TType, opticalSensorStatus).



!start . // entry point of the agent's reasoning cycle

{ include("$jacamoJar/templates/common-cartago.asl") }