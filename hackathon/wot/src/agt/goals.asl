/*
Below are Alice's plans. Whenever Alice has a goal, she will execute one of the
plans she knows shall achieve this goal. Plans are the core of the agent's
program, they dictate the overall behavior of the agent.

A plan has the following structure:

triggering_event : guard_condition <- action ; action ; ... action .

- tringgering events are the addition/deletion of beliefs and goals to the
agent's state, e.g. the addition of goal !getTD(<URI of a TD document>);
- the guard condition is a logical formula over beliefs;
- an action is a statement that has side effects in the agent's environment
(here, the environment is the Web).

Given the following plans, Alice can retrieve a TD document, list the
properties it contains, read and write those properties, and invoke actions.
That is, it can do what most WoT consumers should be able to do.
*/

+!getTD(TD)
    <-
    !prepareForm(F) ;
    get(TD, F) ;
    ?thing(T) ;
    .print("Found Thing with URI ", T) .

+!listProperties(T) <- for (hasProperty(T, P)) { .print(P) } .

+!readProperty(T, P) : hasForm(T, P, F) & hasTargetURI(F, URI)
    <-
    !prepareForm(Fp) ;
    get(URI, Fp) ;
    ?(json(Val)[source(URI)]) ;
    .print(P, " = ", Val) .

+!writeProperty(T, P, Val) : hasForm(T, P, F) & hasTargetURI(F, URI)
    <-
    !prepareForm(Fp) ;
    put(URI, [json(Val)], Fp) .

+!invokeAction(T, A, In) : hasForm(T, A, F) & hasTargetURI(F, URI)
    <-
    !prepareForm(Fp) ;
    post(URI, [json(In)], Fp) .

+!prepareForm(F) : credentials(User, Pw)
    <-
    h.basic_auth_credentials(User, Pw, H) ;
    F = [kv("urn:hypermedea:http:authorization", H)] .