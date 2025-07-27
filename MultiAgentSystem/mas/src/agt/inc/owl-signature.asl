/*

@author Victor Charpenay (Mines Saint-Etienne)
*/

vocabulary(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://purl.org/vocommons/voaf#Vocabulary") .
temporal_entity(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/2006/time#TemporalEntity") .
actuatable_property(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/ns/sosa/ActuatableProperty") .
actuation(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/ns/sosa/Actuation") .
actuator(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/ns/sosa/Actuator") .
feature_of_interest(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/ns/sosa/FeatureOfInterest") .
observable_property(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/ns/sosa/ObservableProperty") .
observation(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/ns/sosa/Observation") .
platform(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/ns/sosa/Platform") .
procedure(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/ns/sosa/Procedure") .
result(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/ns/sosa/Result") .
sample(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/ns/sosa/Sample") .
sampler(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/ns/sosa/Sampler") .
sampling(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/ns/sosa/Sampling") .
sensor(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/ns/sosa/Sensor") .
deployment(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/ns/ssn/Deployment") .
input(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/ns/ssn/Input") .
output(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/ns/ssn/Output") .
property(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/ns/ssn/Property") .
stimulus(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/ns/ssn/Stimulus") .
system(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/ns/ssn/System") .
agent(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://xmlns.com/foaf/0.1/Agent") .
expected_response(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/hypermedia#ExpectedResponse") .
form(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/hypermedia#Form") .
link(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/hypermedia#Link") .
array_schema(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/json-schema#ArraySchema") .
boolean_schema(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/json-schema#BooleanSchema") .
data_schema(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/json-schema#DataSchema") .
integer_schema(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/json-schema#IntegerSchema") .
null_schema(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/json-schema#NullSchema") .
number_schema(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/json-schema#NumberSchema") .
object_schema(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/json-schema#ObjectSchema") .
string_schema(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/json-schema#StringSchema") .
apikey_security_scheme(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/security#APIKeySecurityScheme") .
basic_security_scheme(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/security#BasicSecurityScheme") .
bearer_security_scheme(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/security#BearerSecurityScheme") .
cert_security_scheme(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/security#CertSecurityScheme") .
digest_security_scheme(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/security#DigestSecurityScheme") .
no_security_scheme(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/security#NoSecurityScheme") .
oauth2_security_scheme(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/security#OAuth2SecurityScheme") .
psksecurity_scheme(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/security#PSKSecurityScheme") .
po_psecurity_scheme(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/security#PoPSecurityScheme") .
public_security_scheme(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/security#PublicSecurityScheme") .
security_scheme(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/security#SecurityScheme") .
action_affordance(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/td#ActionAffordance") .
event_affordance(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/td#EventAffordance") .
interaction_affordance(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/td#InteractionAffordance") .
operation_type(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/td#OperationType") .
property_affordance(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/td#PropertyAffordance") .
thing(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://www.w3.org/2019/wot/td#Thing") .
point(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/2003/01/geo/wgs84_pos#Point") .
spatial_thing(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "http://www.w3.org/2003/01/geo/wgs84_pos#SpatialThing") .

activity_status(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://ci.mines-stetienne.fr/kg/ontology#ActivityStatus") .
bosch_apas(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://ci.mines-stetienne.fr/kg/ontology#Bosch-APAS") .
conveyor_speed(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://ci.mines-stetienne.fr/kg/ontology#ConveyorSpeed") .
count(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://ci.mines-stetienne.fr/kg/ontology#Count") .
factory_floor_position(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://ci.mines-stetienne.fr/kg/ontology#FactoryFloorPosition") .
grasp_action(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://ci.mines-stetienne.fr/kg/ontology#GraspAction") .
liquid_volume(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://ci.mines-stetienne.fr/kg/ontology#LiquidVolume") .
maximum_count(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://ci.mines-stetienne.fr/kg/ontology#MaximumCount") .
move_from_to_action(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://ci.mines-stetienne.fr/kg/ontology#MoveFromToAction") .
optical_sensor_status(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://ci.mines-stetienne.fr/kg/ontology#OpticalSensorStatus") .
release_action(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://ci.mines-stetienne.fr/kg/ontology#ReleaseAction") .
stack_light_status(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://ci.mines-stetienne.fr/kg/ontology#StackLightStatus") .
stop_in_emergency_action(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://ci.mines-stetienne.fr/kg/ontology#StopInEmergencyAction") .
valve_status(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://ci.mines-stetienne.fr/kg/ontology#ValveStatus") .
x_coordinate(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://ci.mines-stetienne.fr/kg/ontology#XCoordinate") .
y_coordinate(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://ci.mines-stetienne.fr/kg/ontology#YCoordinate") .
z_coordinate(Individual) :- rdf(Individual, "http://www.w3.org/1999/02/22-rdf-syntax-ns#type", "https://ci.mines-stetienne.fr/kg/ontology#ZCoordinate") .

acts_on_property(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/actsOnProperty", Individual2) .
has_feature_of_interest(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/hasFeatureOfInterest", Individual2) .
has_result(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/hasResult", Individual2) .
has_sample(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/hasSample", Individual2) .
hosts(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/hosts", Individual2) .
is_acted_on_by(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/isActedOnBy", Individual2) .
is_feature_of_interest_of(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/isFeatureOfInterestOf", Individual2) .
is_hosted_by(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/isHostedBy", Individual2) .
is_observed_by(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/isObservedBy", Individual2) .
is_result_of(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/isResultOf", Individual2) .
is_sample_of(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/isSampleOf", Individual2) .
made_actuation(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/madeActuation", Individual2) .
made_by_actuator(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/madeByActuator", Individual2) .
made_by_sampler(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/madeBySampler", Individual2) .
made_by_sensor(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/madeBySensor", Individual2) .
made_observation(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/madeObservation", Individual2) .
made_sampling(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/madeSampling", Individual2) .
observed_property(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/observedProperty", Individual2) .
observes(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/observes", Individual2) .
phenomenon_time(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/phenomenonTime", Individual2) .
used_procedure(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/usedProcedure", Individual2) .
deployed_on_platform(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/ssn/deployedOnPlatform", Individual2) .
deployed_system(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/ssn/deployedSystem", Individual2) .
detects(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/ssn/detects", Individual2) .
for_property(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/ssn/forProperty", Individual2) .
has_deployment(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/ssn/hasDeployment", Individual2) .
has_input(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/ssn/hasInput", Individual2) .
has_output(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/ssn/hasOutput", Individual2) .
has_property(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/ssn/hasProperty", Individual2) .
has_subsystem(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/ssn/hasSubSystem", Individual2) .
implemented_by(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/ssn/implementedBy", Individual2) .
implements(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/ssn/implements", Individual2) .
in_deployment(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/ssn/inDeployment", Individual2) .
is_property_of(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/ssn/isPropertyOf", Individual2) .
is_proxy_for(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/ssn/isProxyFor", Individual2) .
was_originated_by(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/ssn/wasOriginatedBy", Individual2) .
has_anchor(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/hypermedia#hasAnchor", Individual2) .
has_operation_type(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/hypermedia#hasOperationType", Individual2) .
has_relation_type(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/hypermedia#hasRelationType", Individual2) .
has_target(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/hypermedia#hasTarget", Individual2) .
returns(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/hypermedia#returns", Individual2) .
all_of(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/json-schema#allOf", Individual2) .
any_of(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/json-schema#anyOf", Individual2) .
items(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/json-schema#items", Individual2) .
one_of(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/json-schema#oneOf", Individual2) .
properties(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/json-schema#properties", Individual2) .
authorization(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/security#authorization", Individual2) .
proxy(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/security#proxy", Individual2) .
refresh(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/security#refresh", Individual2) .
token(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/security#token", Individual2) .
has_action_affordance(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/td#hasActionAffordance", Individual2) .
has_cancellation_schema(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/td#hasCancellationSchema", Individual2) .
has_event_affordance(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/td#hasEventAffordance", Individual2) .
has_form(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/td#hasForm", Individual2) .
has_input_schema(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/td#hasInputSchema", Individual2) .
has_interaction_affordance(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/td#hasInteractionAffordance", Individual2) .
has_link(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/td#hasLink", Individual2) .
has_notification_schema(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/td#hasNotificationSchema", Individual2) .
has_output_schema(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/td#hasOutputSchema", Individual2) .
has_property_affordance(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/td#hasPropertyAffordance", Individual2) .
has_security_configuration(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/td#hasSecurityConfiguration", Individual2) .
has_subscription_schema(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/td#hasSubscriptionSchema", Individual2) .
has_uri_template_schema(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/td#hasUriTemplateSchema", Individual2) .
has_simple_result(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/hasSimpleResult", Individual2) .
result_time(Individual1, Individual2) :- rdf(Individual1, "http://www.w3.org/ns/sosa/resultTime", Individual2) .
for_content_coding(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/hypermedia#forContentCoding", Individual2) .
for_content_type(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/hypermedia#forContentType", Individual2) .
for_sub_protocol(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/hypermedia#forSubProtocol", Individual2) .
hints_at_media_type(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/hypermedia#hintsAtMediaType", Individual2) .
const(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/json-schema#const", Individual2) .
enum(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/json-schema#enum", Individual2) .
format(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/json-schema#format", Individual2) .
max_items(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/json-schema#maxItems", Individual2) .
maximum(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/json-schema#maximum", Individual2) .
min_items(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/json-schema#minItems", Individual2) .
minimum(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/json-schema#minimum", Individual2) .
property_name(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/json-schema#propertyName", Individual2) .
read_only(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/json-schema#readOnly", Individual2) .
required(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/json-schema#required", Individual2) .
write_only(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/json-schema#writeOnly", Individual2) .
alg(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/security#alg", Individual2) .
flow(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/security#flow", Individual2) .
format(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/security#format", Individual2) .
identity(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/security#identity", Individual2) .
in(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/security#in", Individual2) .
name(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/security#name", Individual2) .
qop(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/security#qop", Individual2) .
scopes(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/security#scopes", Individual2) .
is_idempotent(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/td#isIdempotent", Individual2) .
is_observable(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/td#isObservable", Individual2) .
is_safe(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/td#isSafe", Individual2) .
name(Individual1, Individual2) :- rdf(Individual1, "https://www.w3.org/2019/wot/td#name", Individual2) .
