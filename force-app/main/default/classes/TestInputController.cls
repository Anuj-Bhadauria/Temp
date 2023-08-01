public class TestInputController {
    public String testvalue {get; set;}
    
    public String testValueData(){
        String test = testvalue;
        System.debug('===Test==='+test);
        return null;
    }
}