public class AnimalLocator{
    public static String getAnimalNameById(Integer Id){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        if (res.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
            List<Object> animals = (List<Object>) results.get('animals');
            if(animals != null){
                for ( Object animal :  animals){
                   Map<String, Object> animalMap = (Map<String, Object>) animal;
                   if(animalMap.get('id') == Id){
                       return (String) animalMap.get('name');
                   }
                }
            }
        }
        return null;
    }
}