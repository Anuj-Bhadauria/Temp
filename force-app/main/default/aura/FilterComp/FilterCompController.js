({
	doInit : function(component, event, helper) {
		helper.getAccounts(component);
        //helper.getStage(component);
	},
    selectOpp : function(component, event, helper){
        component.set("v.showSpinner",true);
    	helper.getOpp(component);
    },
    runFilter : function(component, event, helper){
    	//helper.getSearch(component);
    }
})