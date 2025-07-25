+!crawl(URI)
    <-
    get(URI) ;
    +crawled(URI) ;
    for (system(S) & hasSubSystem(S, SS)) {
        h.target(SS, TargetURI) ;
        if (not crawled(TargetURI) & not .intend(crawl(TargetURI))) {
            !crawl(TargetURI)
        }
    } .

-!crawl(URI)
    <-
    .print("Couldn't crawl ", URI, ". Giving up.") ;
    +crawled(URI) .

+!listThings <- .print("Things:") ; for (thing(T)) { .print("* ", T) } .

+!listPropertyAffordances(TType)
    <-
    .print("Property affordances:") ; 
    for (type(T, TType) & hasPropertyAffordance(T, Af) & name(Af, P)) {
        .print("* ", P)
    } .

+!readProperty(TType, PType)
    : type(T, TType)
    & hasPropertyAffordance(T, Af)
    & type(Af, PType)
    & name(Af, P)
    & hasForm(Af, F)
    & hasTarget(F, URI)
    <-
    !prepareForm(Fp) ;
    get(URI, Fp) ;
    ?(json(Val)[source(URI)]) ;
    .print(P, " = ", Val) .

+!writeProperty(TType, PType, Val)
    : type(T, TType)
    & hasPropertyAffordance(T, Af)
    & type(Af, PType)
    & hasForm(Af, F)
    & hasTarget(F, URI)
    <-
    !prepareForm(Fp) ;
    put(URI, [json(Val)], Fp) .

+!invokeAction(TType, AType, In)
    : type(T, TType)
    & hasActionAffordance(T, Af)
    & type(Af, AType)
    & hasForm(Af, F)
    & hasTarget(F, URI)
    <-
    !prepareForm(Fp) ;
    post(URI, [json(In)], Fp) .

+!prepareForm(F) : credentials(User, Pw)
    <-
    h.basic_auth_credentials(User, Pw, H) ;
    F = [kv("urn:hypermedea:http:authorization", H)] .