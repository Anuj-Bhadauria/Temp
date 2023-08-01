({
	doInit : function(component, event, helper) {        
         var action = component.get("c.fetchAccount");
        
        action.setCallback(this, function(response) {
            component.set("v.accResult", response.getReturnValue());
             });
        $A.enqueueAction(action);
    },
    
    openModal: function(component, event, helper) {
        component.set("v.isModalOpen", true);
        
    },
    
    closeModel: function(component, event, helper) {
        component.set("v.isModalOpen", false);
    },
})