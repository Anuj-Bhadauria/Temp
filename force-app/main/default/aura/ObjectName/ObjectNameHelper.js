({
	getObjects : function(cmp) {
		var action = cmp.get("c.getName");
        alert('outside');
        action.setCallback(this, function(a) {
            alert('inside');
            if (cmp.isValid() && state === "SUCCESS") {
                cmp.set("v.ObjList", a.getReturnValue());
                alert('hello');
                console.log(a.getReturnValue());
            }
        });
        $A.enqueueAction(action); 
	},
    getObjectNameList : function(cmp) {
        //alert('search'+cmp.find("accountSearch").get("v.value"));
        var recId = cmp.get("v.Obj");
        console.log(recId);
        alert(recId);
        alert('myalert');
		var action = cmp.get("c.findObjectNameFromRecordIdPrefix");
        alert('hi');
        action.setParams({
            "recordIdOrPrefix" : recId             
        });
        action.setCallback(this, function(a) {
            alert('searchObjectName');
            var state = a.getState();
            if (cmp.isValid() && state === "SUCCESS") {
                if (a.getReturnValue().length == 0) {
                    cmp.set("v.Message", 'No Result Found...');                    
                } else {
                    cmp.set("v.Message", 'Search Object Name...');                  
                }
                cmp.set("v.ObjList", a.getReturnValue());
                document.getElementById('lookup-348').style.display = 'block';
                alert('yo');
                console.log(a.getReturnValue());
            }
        });
        //$A.util.toggleClass(toggleText, "toggle");
        $A.enqueueAction(action); 
    },
    getObjectField : function(cmp,event) {
        var src = event.getSource();
        var outputText = cmp.find("src.getLocalId()");
        var selObj = cmp.get("v.ObjList");
        alert('outputText == '+outputText);
        alert('id=== '+src.getLocalId("v.Id"));
		//alert('id== '+src.get("v.aura:id"));
        cmp.set("v.obj", src.get("v.value"));
        document.getElementById('lookup-348').style.display = 'None';
        console.log('value=='+selObj); 
    }
})