({
	myAction : function(component, event, helper) {
		var action = component.get("c.getSobjectList");
        action.setCallback(this, function(a){
            if(a.getState() === "SUCCESS"){
                component.set("v.options", a.getReturnValue());
            } else if (a.getState() === "ERROR"){
                console.log("Errors", a.getError());
            }
        });
        $A.enqueueAction(action); 
	},
    
    fetchObjectRecords : function(cmp) {
      
        var fetchObjectLabels = cmp.get("c.getObjectRecords");//here c.getObjectRecords referene our controller and getObjectRecords is a method  	
        fetchObjectLabels.setParams({
            "objName" : cmp.find("levels").get("v.value")
        });
        //alert('outside');
        fetchObjectLabels.setCallback(this, function(a){
            //alert('inside');
            //alert(a.getReturnValue());
            if(a.getState() === "SUCCESS"){
                alert('SUCCESS LABELS == ' + a.getReturnValue());
                if (a.getReturnValue().length == 0) {
                    cmp.set("v.objRecords", a.getReturnValue());
                } 
                
            }
            else if (a.getState() === "ERROR"){
                console.log("Errors", a.getError());
            }
        });
        $A.enqueueAction(fetchObjectLabels);
    }
})