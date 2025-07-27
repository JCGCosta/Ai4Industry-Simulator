/*
Some beliefs may be derived from others, given logical rules.

Rules are predicate expressions that use logical implication (:-) in a
Prolog-like syntax to describe a relationship among beliefs.

The rules below are mostly there for convenience, to inspect representations
of JSON objects in the language. It is boilerplate code, you do not need to
look at it in details.
*/

thing(T)
    :-
    json(TD) & .list(TD) &
    .member(kv(id, T), TD) .

hasProperty(T, P)
    :-
    json(TD) & .list(TD) &
    .member(kv(id, T), TD) &
    .member(kv(properties, Ps), TD) &
    .member(kv(P, _), Ps) .

hasForm(T, PAE, F)
    :-
    json(TD) & .list(TD) &
    .member(kv(id, T), TD) &
    (
        .member(kv(properties, PAEs),  TD) |
        .member(kv(actions, PAEs),  TD) |
        .member(kv(events, PAEs),  TD)
    ) &
    .member(kv(PAE, Def), PAEs) &
    .member(kv(forms, Fs), Def) &
    .member(F, Fs) .

hasTargetURI(F, URI) :- .member(kv(href, URI), F) .