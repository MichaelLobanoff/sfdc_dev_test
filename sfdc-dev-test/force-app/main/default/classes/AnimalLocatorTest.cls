@isTest
private class AnimalLocatorTest {
    @isTest static void testLocaterCallout(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String animalName = AnimalLocator.getAnimalNameById(12345);
        system.assertEquals('majestic badger', animalName);
    } 
    @isTest static void testNullAnimalCallout(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String animalName = AnimalLocator.getAnimalNameById(123433);
        system.assertEquals(NULL, animalName);
      }  
}