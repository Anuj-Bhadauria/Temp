({
   /* doInit : function(component, event, helper) {
        alert('Parent');
    },*/
    handleEvent : function(component, event, helper) {
        var name =event.getParam("message");
        var checks =event.getParam("checkboxesChecked");
        // alert('name:::'+JSON.stringify(name));
       
        component.set("v.checkboxesChecked",checks);
        console.log('checkboxesCheckedparr-->',component.get("v.checkboxesChecked"));
        component.set("v.message",name);
    },
    
    handleMaterEvt  : function(component, event, helper) {
         //alert('Event of mergeContact Master got in master');
         component.set("v.ShowMergeMaster",true);
    },
    
    openCompThree : function(component, event, helper) {
         console.log('Inside openCompThree'); 
         component.set("v.ShowMergeMaster",false);				
         var masterId= event.getParam("masterId");
         component.set("v.MatserRecordId",masterId);
         console.log('master got in parent component==>'+component.get("v.MatserRecordId"));
         
    }
})