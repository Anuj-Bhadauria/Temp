public class CreatingNewCampaignMember{
                    
    public final Campaign camp {get;set;}
    public List<CampaignMember> campMembrList {get;set;}
    public String deleteCampMemberId {get;set;}
    public Integer numberOfRow {get; set;}
    
    public CreatingNewCampaignMember(ApexPages.StandardController controller) {
        this.camp = (Campaign)controller.getRecord();
        Id campId = camp.Id;  
        campMembrList = [Select id, Lastname, Firstname, Status, type, title, CompanyOrAccount, contactId, campaignId from CampaignMember where campaignId =:'7016F000001QZfH'];  
        
            
    }
    
    public PageReference DelCampMember(){     
            //if(deleteActivityId != null && deleteActivityId.startsWith('00T')){
                CampaignMember cm = new CampaignMember(id=deleteCampMemberId); 
                Delete cm;
           // }
                    
            
            PageReference pageRef = new PageReference('/'+camp.id);
            pageRef.setRedirect(true);     
            return pageRef;  
        }
}