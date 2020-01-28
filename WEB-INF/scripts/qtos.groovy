/**
 *
 * @param _request Incoming MasonRequest Object
 * @param {var} Output variable for this script set in <m:script file="test.groovy" var="res" /> tag
 */

//def response = [:];
def params = _request.getParams();

res['message'] = 'Hello ' +  _context.getAttribute('q').rows[2].name;
