({
	doInit : function(component, event, helper) {
		helper.helperAccountList(component, event);
	},
    
    callContacts : function(component, event, helper) {
        console.log();
        var cscreen = event.getParam("goToContactScreen");
        if(cscreen == true){
            
            $A.createComponent(
                ":LC_CreateContact",{
                    
                },
                function(frm){
                    console.log("inside window11");
                    var bdy = component.find("sform").get("v.body");
                    bdy.push(frm);
                    component.find("sform").set("v.body", bdy);
                });
            
        }
    },
    
    getContact: function(component, event, helper){
    component.set("v.isVisible", false);
    console.log("inside function");
    
        var appEvent = $A.get("e.c:LE_HelloEvent");
        appEvent.setParams({
    "goToContactScreen" : true
});
console.log("event fire");
appEvent.fire();
    
    }

})