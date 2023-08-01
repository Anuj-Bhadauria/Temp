({
	helperMethod : function(component) {		     
    // get the selected Account from list  
      var getSelectAccount = component.get("v.oAccount");
    // call the event   
      var compEvent = component.getEvent("oSelectedAccountEvent");
    // set the Selected Account to the event attribute.  
         compEvent.setParams({"accountByEvent" : getSelectAccount });  
    // fire the event  
         compEvent.fire();
       
      // enqueue the Action  
        $A.enqueueAction(compEvent);
    }
	
})