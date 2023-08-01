({
	getList : function(component) {
        var action = component.get("c.getselectOptions");
        
        action.setCallback(this, function(response) {
            
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {   
                
                var myList = response.getReturnValue();
                
                
                component.set('v.acccList',myList);
                
                console.log(myList);
                
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " +
                                    errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
            
        });
        
        $A.enqueueAction(action);
        
		
	},
    
    showContactsList : function(component, event) {
        alert('test');
        //var selected = event.getSource().get("v.text");
        //alert(selected);
        
		
	}
})