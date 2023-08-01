({
	helperAccountList : function(component, event, helper) {
		var action = component.get("c.getAccountData");
        action.setCallback(this, function(a){
            if(a.getState() === "SUCCESS"){
                component.set("v.returnAccList", a.getReturnValue());
            } else if (a.getState() === "ERROR"){
                console.log("Errors", a.getError());
            }
        });
        $A.enqueueAction(action);
	},
})