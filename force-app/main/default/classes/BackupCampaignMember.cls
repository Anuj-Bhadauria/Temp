public class BackupCampaignMember{

/*

<apex:page standardController="Campaign" extensions="CampaignMemberRelatedListController">
  
    <apex:includeScript value="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" />
    <apex:includeScript value="//cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.17.8/js/jquery.tablesorter.min.js" />
    <apex:stylesheet value="//cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.17.8/css/theme.blue.css" />
    
    <Script>    
        function confirmDelete(){    //it is called by an delete link or button and show alert with ok and cancel button if press ok then it redirects to a method in controller.
            if(confirm('Are you sure?'))
                return true;
                return false;
        };
        $(document).ready(function(){
            $("[id$='campMemberTable']").tablesorter({theme: 'blue', dateFormat : "dd/mm/yyyy"});
        });        
    </Script>
    <style>       
        .actionColumn {
            color: #999;
            padding: 5px 5px 2px;
        }
        .actionLink{
            text-decoration: none;
        }
        a:hover {
            cursor: pointer;
            
        }
    </style>
    
    <apex:form >
    
        <apex:pageBlock >
            <apex:pageblockbuttons location="top">
                <apex:commandButton value="Add New" title="Add New" onclick="window.open('/apex/Create_New_Campaign_Member?campid={!Campaign.id}')"/>                       
            </apex:pageblockbuttons>

            <apex:pageBlockTable value="{!campMemList}" var="campmemb" rendered="{!NOT(campMemList.empty)}" id="campMemberTable" styleclass="tablesorter">
                <apex:column styleClass="actionColumn">
                <apex:facet name="header">Action</apex:facet>
                    <a class="actionLink" href="/{!campmemb.id}/e?retURL=%2F{!campmemb.campaignId}" title="Edit" style=" color:#015ba7" target="_top">Edit</a> | <apex:commandLink styleClass="actionLink" title="Remove" value=" Remove" onclick="return confirm('Are you sure?')" action="{!DelCampMember}" style="cursor: pointer; color:#015ba7" target="_top"><apex:param name="removeMemberId" value="{!campmemb.Id}" assignTo="{!deleteCampMemberId}" /></apex:commandLink>                                                           
                </apex:column>
                <apex:column >
                <apex:facet name="header">Type</apex:facet>
                     <apex:outputPanel > 
                         <a class="Mylinks" href="/{!campmemb.contactId}" style="cursor: pointer" target="_top">{!campmemb.type}</a>
                     </apex:outputPanel>
                </apex:column>      
                <apex:column value="{!campmemb.status}"/>          
                <apex:column > 
                    <apex:facet name="header">First Name</apex:facet>
                     <apex:outputPanel > 
                     <a class="Mylinks" href="/{!campmemb.id}" style="cursor: pointer" target="_top">{!campmemb.firstname}</a>
                     </apex:outputPanel>
                 </apex:column> 
                <apex:column > 
                     <apex:facet name="header">Last Name</apex:facet>
                     <apex:outputPanel > 
                         <a class="Mylinks" href="/{!campmemb.id}" style="cursor: pointer" target="_top">{!campmemb.lastname}</a>
                     </apex:outputPanel>
                 </apex:column>        
                <apex:column value="{!campmemb.title}"/>
                <apex:column > 
                <apex:facet name="header">Company</apex:facet>
                     <apex:outputPanel >
                         {!campmemb.CompanyOrAccount}
                     </apex:outputPanel>
                 </apex:column>
                <apex:column value="{!campmemb.Dietary_Reqs__c}"/>             
                <apex:column value="{!campmemb.Notes__c}" style="overflow: hidden; max-width: 20ch"/> 
             
            </apex:pageBlockTable>

        </apex:pageBlock>
    
    </apex:form>
   
</apex:page>

-----------------------------------Controller of the above vf page---------------------------------------------------
* @author: Anuj Bhadauria | makepositive
* @date: 14 December 2017
* @description: class for CampaignMember RelatedList.

public with sharing class CampaignMemberRelatedListController{
   
    public final Campaign camp {get;set;}
    public campaignmember cm {get;set;}
    public List<CampaignMember> campMemList {get;set;}
    public String campmemberid {get;set;}
    public String deleteCampMemberId {get;set;}
    
    //Fetching the table columns which need to show on campaignmember relatedlist
    public CampaignMemberRelatedListController(ApexPages.StandardController controller){
        campmemberid = ApexPages.currentPage().getParameters().get('campmembid');
        this.camp = (Campaign)controller.getRecord();
        Id campId = camp.Id;   
        
        campMemList = [Select id, contactId, Lastname, Firstname, Type, Status, Title, CompanyOrAccount, campaignId, Dietary_Reqs__c, Notes__c from CampaignMember where campaignId =:campId];
        
    }
    
    //This methods returns to the detail page of campaign after deleting a record 
    public PageReference DelCampMember(){   
        try{
            if(deleteCampMemberId != null){
                cm = new CampaignMember(id=deleteCampMemberId); 
                Delete cm;
            }
                                       
            PageReference pageRef = new PageReference('/'+camp.id);
            pageRef.setRedirect(true);     
            return pageRef;
        }  
        Catch(Exception e){
            System.debug('Exception '+e);
        }
        return null;      
    }  
}


----------------------------------------Second VF page Campaign Member---------------------------------------------
<apex:page controller="InsertCampaignMemberController" tabStyle="CampaignMember">

    <apex:form id="frm">
    <apex:sectionHeader title="Campaign Member Edit" subtitle="Campaign Member" />
     <apex:messages style="color:red"/>
        <apex:pageBlock title="Campaign Member Edit">
            <apex:pageBlockButtons >
                <apex:commandButton action="{!SaveCampMember}" value="Save"  reRender="frm"/>
                <apex:commandButton action="{!SaveAndNewCampMember}" value="Save & New" reRender="frm"/>
                <apex:commandButton action="{!CancelCampMember}" value="Cancel" immediate="true"/>
            </apex:pageBlockButtons>
            <apex:pageBlockSection title="Campaign Member Information" columns="2">
                <apex:inputField value="{!cm.campaignid}" id="cmpid"/>              
                <apex:repeat value="{!$ObjectType.CampaignMember.FieldSets.CampaignMemberFields}" var="field">
                    <apex:inputField value="{!cm[field]}"  required="{!field.Required}" rendered="{!if(field!='Status',true,false)}"/>   
                    <apex:selectList rendered="{!if(field=='Status',true,false)}" label="Status" size="1" value="{!status}" required="{!field.Required}">
                        <apex:selectOptions value="{!statusList}"></apex:selectOptions>
                    </apex:selectList>   
                </apex:repeat>
            </apex:pageBlockSection>  
            
        </apex:pageBlock>
    </apex:form>
</apex:page>

----------------------------------------Controller of the above vf page------------------------------------------------
* @author: Anuj Bhadauria | makepositive
* @date: 14 December 2017
* @description: class for Inserting and Editing new Campaign Member. 

public with sharing class InsertCampaignMemberController{
    
    public final Id campId {get;set;}
    public campaignmember cm {get;set;}
    public String campmemberid {get;set;}
    public list<CampaignMemberStatus> cmStatus {get;set;}
    public list<SelectOption> statusList{get;set;}
    public String status {get;set;}
    
    //Accessing thes which we need to display on the page through fieldset i.e 'CampaignMemberFields'
    public InsertCampaignMemberController() {
        
        statusList = new list<SelectOption>();
        campId = ApexPages.currentPage().getParameters().get('campid');
        campmemberid = ApexPages.currentPage().getParameters().get('campmembid');
        system.debug(campmemberid);
        String queryString = null;
        cmStatus = new list<CampaignMemberStatus>();
        
        if(campId!=null){
        cmStatus = [Select id,label,IsDefault from CampaignMemberStatus where campaignId =:campId];
           if(cmStatus.size()>0){
               for(CampaignMemberStatus c : cmStatus){
                   if(c.isdefault == true){
                       status = c.label;
                   }
                   statusList.add(new SelectOption(c.label,c.label));
               }
           }
        }
        
        if(campmemberid != null){
           queryString = 'Select id,CampaignId ';
           for(Schema.FieldSetMember fld :SObjectType.CampaignMember.FieldSets.CampaignMemberFields.getFields()) {
               queryString += ', ' + fld.getFieldPath();   
           }

           queryString += ' from CampaignMember where id= \''+ campmemberid + '\'' ;
           system.debug(queryString );
           cm = database.query(queryString);
        }
        else {
           cm = new campaignmember ();
           cm.campaignid = campId ;          
        }                   
       
    }
    
    //This methods returns to the new record page of campaign after saving a record   
    public PageReference SaveCampMember(){     
        
        try{
            
            cm.Status = Status;
             
            upsert cm;
            
            PageReference pageRef = new PageReference('/'+campId);
            pageRef.setRedirect(true);     
            return pageRef;
        }
        
        Catch(Exception e){         
            ApexPages.addMessages(e);
        }
                
        return null;  
    } 
    
    
    //This methods returns to the detail page of campaign after saving and editing a record 
    public PageReference SaveAndNewCampMember(){     
        
        try{
            
            cm.Status = Status;
            upsert cm;
            
            PageReference pageRef = new PageReference('/apex/Create_New_Campaign_Member?campid='+campId);
            pageRef.setRedirect(true);     
            return pageRef;
        } 
        Catch(Exception e){         
            ApexPages.addMessages(e);
        }
                
        return null; 
    }
    
    //This methods cancel the record and return to the campaign detail page
    public PageReference CancelCampMember(){     
        
        PageReference pageRef = new PageReference('/'+campId);
        pageRef.setRedirect(true);     
        return pageRef;  
    }
    
    
}
*/
}