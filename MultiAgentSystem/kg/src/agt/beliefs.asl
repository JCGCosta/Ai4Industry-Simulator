/*
All rules below translate RDF statements into shorter beliefs.

It is common to translate RDFS classes to unary predicates (such as 'thing') 
and RDFS properties to binary predicates (such as 'hasPropertyAffordance'). By
doing so, we may introduce name conflicts though. For instance,
- https://www.w3.org/2019/wot/td#Thing and
- http://www.w3.org/2002/07/owl#Thing
are quite different from each other. The latter is more general than the former.
That is why everything is a URI, in RDF.
*/
type(Individual, Class)
    :-
    rdf(
        Individual,
        "http://www.w3.org/1999/02/22-rdf-syntax-ns#type",
        Class
    ) .

system(Individual) :- type(Individual, "http://www.w3.org/ns/ssn/System") .
thing(Individual) :- type(Individual, "https://www.w3.org/2019/wot/td#Thing") .

automated_storage_and_retrieval_system(Individual)
    :-
    type(
        Individual,
        "http://www.productontology.org/id/Automated_storage_and_retrieval_system"
    ) .

type(Individual, automated_storage_and_retrieval_system)
    :-
    automated_storage_and_retrieval_system(Individual) .

conveyorSpeed(Individual)
    :-
    type(
        Individual,
        "https://ci.mines-stetienne.fr/kg/ontology#ConveyorSpeed"
    ) .

opticalSensorStatus(Individual)
    :-
    type(
        Individual,
        "https://ci.mines-stetienne.fr/kg/ontology#OpticalSensorStatus"
    ) .

magneticValveStatus(Individual)
    :-
    type(
        Individual,
        "https://ci.mines-stetienne.fr/kg/ontology#ValveStatus"
    ) .


type(Individual, conveyorSpeed) :- conveyorSpeed(Individual) .

type(Individual, opticalSensorStatus) :- opticalSensorStatus(Individual) .

type(Individual, magneticValveStatus) :- magneticValveStatus(Individual) .

moveFromToAction(Individual)
    :-
    type(
        Individual,
        "https://ci.mines-stetienne.fr/kg/ontology#MoveFromToAction"
    ) .

type(Individual, moveFromToAction) :- moveFromToAction(Individual) .

hasSubSystem(Individual1, Individual2)
    :-
    rdf(Individual1, "http://www.w3.org/ns/ssn/hasSubSystem", Individual2) .

hasPropertyAffordance(Individual1, Individual2)
    :-
    rdf(
        Individual1,
        "https://www.w3.org/2019/wot/td#hasPropertyAffordance",
        Individual2
    ) .

hasActionAffordance(Individual1, Individual2)
    :-
    rdf(
        Individual1,
        "https://www.w3.org/2019/wot/td#hasActionAffordance",
        Individual2
    ) .

name(Individual1, Individual2)
    :-
    rdf(Individual1, "https://www.w3.org/2019/wot/td#name", Individual2) .
    
hasForm(Individual1, Individual2)
    :-
    rdf(Individual1, "https://www.w3.org/2019/wot/td#hasForm", Individual2) .

hasTarget(Individual1, Individual2)
    :-
    rdf(
        Individual1,
        "https://www.w3.org/2019/wot/hypermedia#hasTarget",
        Individual2
    ) .