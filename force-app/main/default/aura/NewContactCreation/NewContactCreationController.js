({
	
    create : function(component, event, helper) {
        var action = component.get("c.createRecord");
        var newCon = component.get("v.cont.LastName");
        console.log('New COn == '+newCon);
        action.setParams({
            "contact" : newCon
        });
        $A.enqueueAction(action);
    }
})