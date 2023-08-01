({
	getSubmit : function(cmp) {
        
        var action = cmp.get("c.getWebToLeadForm");
        alert(cmp.get("v.Name"));
        alert(cmp.get("v.EmailId"));
        action.setParams({
            "ldName" : cmp.get("v.Name"),
            "email" : cmp.get("v.EmailId"),
            "phoneNum" : cmp.get("v.Phone"),
            "comments" : query.get("v.Query")
        });
       
        $A.enqueueAction(action);
	}
})