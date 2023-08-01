({
	doInit : function(component, event, helper) {
        //alert('Hello');
		helper.getObjects(component);
        //alert('jS');
	},
    
    selectedvalue : function(component, event, helper) {
		
        alert('textval');
	},
    onSelectChange : function(component, event, helper) {
        helper.handlerGetObjectRecords(component);
        //alert('Success');
    },
    selectAll: function(component, event, helper) {
        helper.handlerSelectAll(component, event);
    },
    checkboxSelect: function(component, event, helper) {
        helper.handlerCheckboxSelect(component, event);
    },
    deleteSelected: function(component, event, helper) {
        helper.deleteSelectedHelper(component, event);
    },
    editRecord : function(component, event, helper) {
        alert('Edit');
        helper.editRecordHelper(component, event);
    }

})