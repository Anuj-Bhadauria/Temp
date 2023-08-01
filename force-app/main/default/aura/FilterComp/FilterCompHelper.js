({
	getAccounts : function(cmp) {
        
        var action = cmp.get("c.getAccounts");
        
        action.setCallback(this, function(a) {
            cmp.set("v.Accts", a.getReturnValue());
            //console.log(a.getReturnValue());
        });
        $A.enqueueAction(action);
        /*
        var inputsel = cmp.find("AcctId");
        var opts=[];
        action.setCallback(this, function(a) {
            for(var i=0;i< a.getReturnValue().length;i++){
                opts.push({"class": "optionClass", label: a.getReturnValue()[i], value: a.getReturnValue()[i]});
            }
            inputsel.set("v.options", opts);
    
        });
        $A.enqueueAction(action); */
	},
    getOpp : function(cmp){
        var accName = cmp.find("AcctId");
       // alert('FilterAccount== '+accName.get("v.value"));
        //var oppEvent = e.getSource().get("v.value");
        //cmp.set("v.accselect", oppEvent);
        var action = cmp.get("c.getOpportunities");
        //var inputSel = cmp.find("AcctId"); 
       // console.log(inputSel);
        //alert( 'AccountId== '+accName.get("v.value"));
        action.setParams({
            "accId" : accName.get("v.value")
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
           // alert(state);
            if (cmp.isValid() && state === "SUCCESS") {
                //alert('response== '+response.getReturnValue());
                var opts = response.getReturnValue();
                console.log(response.getReturnValue());
                //cmp.set("v.opps", opts);
                cmp.set("v.showSpinner", false);
                var compEvent = $A.get("e.c:FilterPaginationEvent");
                compEvent.setParams({ "OpportunityList" : response.getReturnValue(),
                                     "DisplayCSS" : "Block",
                                     "accId" : accName.get("v.value")
                                    });
               
                compEvent.fire();
                
            }
		});
        $A.enqueueAction(action);
   }
   /* getStage : function(cmp){
    	var action = cmp.get("c.getOppStage");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (cmp.isValid() && state === "SUCCESS") {
                cmp.set("v.sobjectsStage", response.getReturnValue());
            }
            });
        $A.enqueueAction(action);
    },
    getSearch : function(cmp){
        alert('my alert');
        var oppStage = cmp.find("InputSelectDynamic2");
        alert(oppStage.get("v.value"))
        //alert(cmp.get("v.value"));
        var acc = cmp.find("AcctId");
        var opp = cmp.find("InputSelectDynamic1");
        var oppStage = cmp.find("InputSelectDynamic2");
    	var action = cmp.get("c.getFilter");  
        action.setParams({
            "accName" : acc.get("v.value"),
            "oppName" : opp.get("v.value"),
            "oppStageName" : oppStage.get("v.value")
        });
        action.setCallback(this, function(response){
            alert(response.getReturnValue());
            console.log(response.getReturnValue());
            var state = response.getState();
            if (cmp.isValid() && state === "SUCCESS") {
                var compEvent = $A.get("e.c:FilterEvent");
                alert('HI');
                compEvent.setParams({ "OpportunityList" : response.getReturnValue()});
                alert('fire');
                compEvent.fire();
                
                //cmp.set("v.filterOpps", response.getReturnValue());
            }
        });
        $A.enqueueAction(action); 
    }*/
})       
        /*
        var action = cmp.get("c.getOpportunities");
        console.log(action);
        var inputSel = cmp.find("AcctId");
        action.setParams({
            "accId" : inputSel.get("v.Accts")
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (cmp.isValid() && state === "SUCCESS") {
                var opts = response.getReturnValue();
                cmp.find("InputSelectDynamic1").set("v.options", opts);
            }

            // Display toast message to indicate load status
            var toastEvent = $A.get("e.force:showToast");
            if (state === 'SUCCESS'){
                toastEvent.setParams({
                    "title": "Success!",
                    "message": " Your Opportunities have been loaded successfully."
                });
            }
            else {
                toastEvent.setParams({
                        "title": "Error!",
                        "message": " Something has gone wrong."
                });
            }
            toastEvent.fire();
        });
         $A.enqueueAction(action); */
        
        // Load all Product data
       /* var action = cmp.get("c.getAccounts");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (cmp.isValid() && state === "SUCCESS") {
                cmp.set("v.sobjects", response.getReturnValue());
          }

             //Display toast message to indicate load status
            var toastEvent = $A.get("e.force:showToast");
            if (state === 'SUCCESS'){
                toastEvent.setParams({
                    "title": "Success!",
                    "message": " Your Accounts AccountSource have been loaded successfully."
                });
            }
            else {
                toastEvent.setParams({
                        "title": "Error!",
                        "message": " Something has gone wrong."
                });
            }
            
            toastEvent.fire();
        });
         $A.enqueueAction(action); */