({
	doInit : function(component, event, helper) {
		helper.getObjects(component);
        alert('jS');
	},
    searchObj : function(component, event, helper) {
        //var acc=component.find('accountSearch').get('v.value');
        //alert(acc);
        helper.getObjectNameList(component);
    },
    objField : function(component, event, helper) {
        //var acc=component.find('accountSearch').get('v.value');
        //alert(acc);
        helper.getObjectField(component,event);
    }
})