public class BackupLightning{
    
    
    //Displaying Data in table form with edit functionality
    /*
    ------------------------------------------Component----------------------------------------
    
    <aura:component controller="CapexCostController" implements="force:appHostable,flexipage:availableForAllPageTypes,flexipage:availableForRecordHome,force:hasRecordId" access="global" >
    <aura:attribute name="recordId" type="Id" />
    <aura:attribute name="editAccId" type="id"/>
    <aura:attribute name="Capex" type="CAPEX__c" />
    <aura:attribute name="CapexCost" type="CAPEX_Cost__c[]" />
    <aura:attribute name="Columns" type="List" />
    <aura:attribute name="isEdit" type="boolean"/>
    <aura:handler name="init" value="{!this}" action="{!c.myAction}" />
    
    <div class="body">   
        <force:recordData aura:id="capexRecord"
                          recordId="{!v.recordId}"
                          targetFields="{!v.Capex}"
                          layoutType="FULL"
                          />
        <lightning:card iconName="standard:contact" title="{! 'Capex Cost for ' + v.Capex.Name}">
            <table class="slds-table slds-table--bordered slds-table--striped" width="50%" >
                <tbody>
                <tr>
                    <th rowspan="2" >Action</th>
                    <th bgcolor="#5D7B9D" color="#FFFFFF" scope="col" rowspan="2"><span class="slds-truncate">Name</span></th>
                    <th colspan="2" >Total</th>
                    <th colspan="2" class="color">2018</th>
                    <th colspan="2" >2019</th>
                    <th colspan="2" class="color">2020</th>
                    <th colspan="2">Thereafter</th>
                </tr>
                <tr>
                    
                    <th bgcolor="#5D7B9D" color="#FFFFFF" scope="col"><span class="slds-truncate">Per CAR</span></th>
                    <th bgcolor="#5D7B9D" color="#FFFFFF" scope="col"><span class="slds-truncate">Budget</span></th>
                    <th bgcolor="#5D7B9D" color="#FFFFFF" scope="col"><span class="slds-truncate">Per CAR</span></th>
                    <th bgcolor="#5D7B9D" color="#FFFFFF" scope="col"><span class="slds-truncate">Budget</span></th>
                    <th bgcolor="#5D7B9D" color="#FFFFFF" scope="col"><span class="slds-truncate">Per CAR</span></th>
                    <th bgcolor="#5D7B9D" color="#FFFFFF" scope="col"><span class="slds-truncate">Budget</span></th>
                    <th bgcolor="#5D7B9D" color="#FFFFFF" scope="col"><span class="slds-truncate">Per CAR</span></th>
                    <th bgcolor="#5D7B9D" color="#FFFFFF" scope="col"><span class="slds-truncate">Budget</span></th>
                    <th bgcolor="#5D7B9D" color="#FFFFFF" scope="col"><span class="slds-truncate">Per CAR</span></th>
                    <th bgcolor="#5D7B9D" color="#FFFFFF" scope="col"><span class="slds-truncate">Budget</span></th>
                 </tr>
                    
               
                    
                    <aura:iteration items="{!v.CapexCost}" var="rec">
                        <tr>
                            <td><button type="button" onclick="{!c.edit}" id="{!rec.Id}">Edit</button></td>
                            <td><span class="slds-truncate"> {!rec.Name} </span></td>
                            <td><span class="slds-truncate"> {!rec.Per_CAR_Total_1__c} </span></td>
                            <td><span class="slds-truncate"> {!rec.Budget_Total_1__c} </span></td>
                            <td><span class="slds-truncate"> {!rec.Per_CAR_2018__c} </span></td>
                            <td><span class="slds-truncate"> {!rec.Budget_2018__c} </span></td>
                            <td><span class="slds-truncate"> {!rec.Per_CAR_2019__c} </span></td>
                            <td><span class="slds-truncate"> {!rec.Budget_2019__c} </span></td>
                            <td><span class="slds-truncate"> {!rec.Per_Car_2020__c} </span></td>
                            <td><span class="slds-truncate"> {!rec.Budget_2020__c} </span></td>
                            <td><span class="slds-truncate"> {!rec.Per_CAR_Thereafter__c} </span></td>
                            <td><span class="slds-truncate"> {!rec.Budget_Thereafter__c} </span></td>
                            
                        </tr>
                    </aura:iteration>
                </tbody>
            </table> 
            <br/>
            <aura:renderIf isTrue="{!v.isEdit}">
                <center><ui:button label="Save" press="{!c.save}"/></center>
                <force:recordEdit aura:id="edit" recordId="{!v.editAccId}"/>
            </aura:renderIf>
        </lightning:card> 
        
        <!--    
<lightning:card iconName="standard:contact" title="{! 'Capex Cost for ' + v.Capex.Name}">
     Contact list goes here 
    <lightning:datatable data="{! v.CapexCost}" columns="{! v.Columns }" keyField="Id" hideCheckboxColumn="true"/>

</lightning:card>-->
        
        <div class="slds-m-top_x-large" />
    </div>
</aura:component>



----------------------------------------------JS Controller-------------------------------------------
    ({
    myAction : function(component, event, helper) {
        
        var action = component.get("c.getCapexCostRecords");
        //console.log('rcordid == '+component.get("v.recordId"));
        action.setParams({
            
            capexId: component.get("v.recordId")
            
        });
        action.setCallback(this, function(data) {
            component.set("v.CapexCost", data.getReturnValue());
            console.log('DataReturn === '+data.getReturnValue());
        });
        $A.enqueueAction(action);
        
    },
    edit : function(component, event, helper) {
        
        component.set("v.isEdit",true);
        component.set("v.editAccId",event.target.id);
        
    },
    save : function(component, event, helper) {
        try {
        component.find("edit").get("e.recordSave").fire();
            console.log('Save Record ==='+component.find("edit").get("e.recordSave"));
            
        }catch (e) {
            console.log(e);
            }
        location.reload();// This will refresh the app to get the latest updated data.        
    }
})

---------------------------------------------Apex Controller--------------------------------------------

    public class CapexCostController {
        
        @AuraEnabled
        public static List<CAPEX_Cost__c> getCapexCostRecords(Id capexId) {
            return [SELECT Id, Name, Per_CAR_2018__c, Per_CAR_2019__c, Per_Car_2020__c, Per_CAR_Thereafter__c,
               Per_CAR_Total_1__c, Budget_2018__c, Budget_2019__c , Budget_2020__c, Budget_Thereafter__c,
               Budget_Total_1__c From CAPEX_Cost__c WHERE CAPEX__c =: capexId];
            
        }
    }
    
    */
    

}