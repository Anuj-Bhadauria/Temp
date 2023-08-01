({
	handlerSaveContact : function(component, event, helper) {
		//prepare the action to create the new contact
        var saveContactAction = component.get("c.createContact");//here c.createContact referene our controller and createContact is a method  	
        saveContactAction.setParams({
            "contact" : component.get("v.newContact")
        });
        
        // configure the response handler for the action
        saveContactAction.setCallback(this, function(response){
        	var state = response.getState();
        if(state="SUCCESS"){
            component.set("v.confirmTrue", false);
            component.set("v.confirmDisplayMessage", true);
        }
        });
        //Send the request to create the new contact
    	$A.enqueueAction(saveContactAction);
	},
})