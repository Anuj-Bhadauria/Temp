({
    onLoad : function(component, event) {
        
        
        //call apex class method
        var action = component.get('c.fetchAccount');
        action.setCallback(this, function(response) {
            //store state of response
            var state = response.getState();
            if (state === "SUCCESS") {
                //set response value in ListOfAccount attribute on component.
                component.set('v.ListOfAccount', response.getReturnValue());
                // set deafult count and select all checkbox value to false on load 
                component.set("v.selectedCount", 0);
                component.find("box3").set("v.value", false);
            }
        });
        $A.enqueueAction(action);
        
    },
    
    updateSelectedHelper: function(component, event, updateRecordsIds) {
        //call apex class method
        var action = component.get('c.updateRecords');
        // pass the all selected record's Id's to apex method 
        action.setParams({
            "lstRecordId": updateRecordsIds
        });
        
        action.setCallback(this, function(response) {
            
            this.onLoad(component, event);
            
        });
        $A.enqueueAction(action);
    }
})