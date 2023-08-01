public class BackupPicklistDynamic {
/*
@AuraEnabled
    public static List<PicklistWrapper> getProductvalues()
    {
        System.debug('new test');
        List<PicklistWrapper> options = new List<PicklistWrapper>();
        Schema.DescribeFieldResult fieldResult = CXG_Community_Products__mdt.All_Products_Community_Dropdown__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry f : ple)
        {
            //options.add(f.getLabel());
            options.add( new PicklistWrapper( f.getValue(), f.getLabel() ) );

        } 
        System.debug('In class =='+options);
        return options;
        
    }
    
    public class PicklistWrapper {
        @AuraEnabled
        public String value;
        @AuraEnabled
        public String label;

        public picklistWrapper( String value, String label ) {
            this.label = label;
            this.value = value;
        }
    }
---------------------------------JS Controller---------------------------------
doInit : function(component, event, helper) {
        
        helper.populatePicklistStaticValues(component);
        var action = component.get("c.getProductvalues");
        action.setCallback(this, function(response){
            component.set("v.prodValue", response.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    
   onProductValueChange : function(component, event, helper) {  
        document.getElementById('lookup').focus();
        var productSelected = component.find("ProductList").get("v.value");
        component.set( "v.valueSelectedFromProduct", productSelected );
        var targetID=component.find("ProductList");
        $A.util.addClass(targetID, 'bckColor');
        var myEvent2 = $A.get("e.c:CXG_ProductSelectedFromGlobalSearch");
        myEvent2.setParams({"selectedProduct": productSelected});
        myEvent2.fire();
    },
 
    
 ---------------------------Component--------------------------------
        <aura:attribute name="prodValue" type="List" default="[]"/>
        <div class="slds-form-element slds-lookup slds-is-open slds-size--1-of-1 slds-medium-size--1-of-1 slds-large-size--2-of-12 Productlistcls">
            <div class="slds-col">
                 <ui:inputSelect aura:id="ProductList" class="bckColor" change="{!c.onProductValueChange}"> 
                    <aura:iteration items="{!v.prodValue}" var="prods">
                        <ui:inputSelectOption text="{!prods.value}" label="{!prods.label}"/>
                    </aura:iteration>
                </ui:inputSelect> 
            </div>
        </div>   
    

*/
}