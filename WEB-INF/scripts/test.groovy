//@Grab('com.jayway.jsonpath:json-path:2.3.0')
//@Grab('org.slf4j:slf4j-api')
//@Grab('org.slf4j:slf4j-simple')

import com.jayway.jsonpath.JsonPath;
import com.jayway.jsonpath.Configuration;


String json = "{\"user\":\"deepak\"}";
Object document = Configuration.defaultConfiguration().jsonProvider().parse(json);

println JsonPath.read(document, "\$.user");


def makethiswork(request, response){
    return request.param1 + ' ' + response.param1;
}


response.param1 = makethiswork(request, response)

//def process(){
//    return "Yo!"
//}