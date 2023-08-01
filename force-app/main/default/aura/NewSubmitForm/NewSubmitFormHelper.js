({
	helperMethod : function(cmp) {
         var action = cmp.get("c.createNewRecord");
		 var name = cmp.get("v.firstName");
         action.setParams({ 
            "firstName" : cmp.get("v.firstName"), 
            "phone" : cmp.get("v.phoneNumber") 
         });
		//var name = component.find('clientName').get("v.value");
        alert('Client Name == '+name);
	}
})