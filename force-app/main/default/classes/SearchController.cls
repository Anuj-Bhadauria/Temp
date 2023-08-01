public class SearchController {

    public String searchKey {get;set;}
    public List<Account> accList {get;set;}
    
    public void searchKeyword(){
        if(searchKey.length() > 1){
            String searchStr1 = '*'+searchKey+'*';    
            String searchQuery = 'FIND \'' + searchStr1 + '\' IN ALL FIELDS RETURNING Account (Id,Name,type)';
            List<List <sObject>> searchList = search.query(searchQuery);
            accList = ((List<Account>)searchList[0]);
            if(accList.size() == 0){
                apexPages.addmessage(new apexpages.message(apexpages.severity.Error, 'Sorry, no results returned with matching string..'));
            }
        }
        else{
            apexPages.addmessage(new apexpages.message(apexpages.severity.Error, 'Please enter at least two characters..'));
            
        }
        //return null;
    }
}