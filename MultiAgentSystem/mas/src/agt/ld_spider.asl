/* 
ld_spider using the Linked Data artifact to crawl a KG 

@author Olivier Boissier (Mines Saint-Etienne), Victor Charpenay (Mines Saint-Etienne)
*/

entryPoint("https://ci.mines-stetienne.fr/kg/") .

+!start :
    entryPoint(URI)
    <-
    !crawl(URI) ;
    !countRDF ;
  .

+!crawl(URI)
    <-
    get(URI) ;
    +crawled(URI) ;
    for (system(S) & has_subsystem(S, SS)) {
        h.target(SS, TargetURI) ;
        if (not crawled(TargetURI) & not .intend(crawl(TargetURI))) {
            !crawl(TargetURI)
        }
    } .

-!crawl(URI)
    <-
    .print("Couldn't crawl ", URI, ". Giving up.") ;
    +crawled(URI) .

+!countRDF :
    true
    <-
    .count(rdf(_, _, _), Count) ;
    .print("found ", Count, " triples.") ;
  .

{ include("inc/owl-signature.asl") }
{ include("inc/common.asl") }

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
