@isTest
global class AnimalLocatorMock implements HttpCalloutMock {
    global HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animals":[{"id":12345,"name":"majestic badger"},{"id":12346,"name":"fluffy bunny"},{"id":12347,"name":"cheeky Chicken"}]}');
        response.setStatusCode(200);
        return response;
    }
}