({
	onChildData : function(component, event, helper) {
        var isReady = component.get("v.isReady");
        if(!isReady){
            return null;
        }
        var field = component.get("v.fields");
        field = field.replace(" ", "");
		var recordMap = component.get("v.recordMap");
        var recordId = component.get("v.recordId");        
        var record = recordMap.get(recordId);
        var fieldValue = record[field];
        component.set("v.recordValue", fieldValue);
	}
})