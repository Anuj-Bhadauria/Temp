({
    handleStoryFilterEvent : function(component, event, helper) {
        
		helper.eventMethod(component,event);
        helper.getAccounts(component);
        //alert('AccountEvent=  '+component.get("v.accId"));
	},
	doInit : function(component, event, helper) {
        
      //helper.getAccounts(component);  
      //alert(component.get("v.offset"));
        
   },
    calculate : function(component, event, helper) {
        helper.getNext(component);
    },
    prev : function(component, event, helper) {
        helper.getPrevious(component);
    },
    saveFunction : function(component, event, helper) {
        helper.getSave(component);
    },
    searchAcc : function(component, event, helper) {
        //var acc=component.find('accountSearch').get('v.value');
        //alert(acc);
        helper.getSearch(component);
    },
    selectedAccount : function(component, event, helper) {
        //console.log(event);
        //var src = event.getSource();
        //console.log(src);
        //alert('accid == '+src.getLocalId());
        
        helper.getLookup(component,event);
    }
})