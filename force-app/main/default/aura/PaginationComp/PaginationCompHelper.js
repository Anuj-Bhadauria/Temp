({
    eventMethod : function(cmp,e) {
		cmp.set("v.accId",e.getParam('accId'));
        cmp.set("v.DisplayCSS",e.getParam('DisplayCSS'));
       
	},
    getSearch : function(cmp) {
        //alert('search'+cmp.find("accountSearch").get("v.value"));
        var search = cmp.get("v.searchKey");
        //alert(search);
        //var toggleText = cmp.find("accountSearch");
        //console.log(search);
        var action = cmp.get("c.getAccountSearch");
        action.setParams({
            "accountSearch" : search             
        });
        action.setCallback(this, function(a) {
            //alert('searchAccount');
            var state = a.getState();
            if (cmp.isValid() && state === "SUCCESS") {
                if (a.getReturnValue().length == 0) {
                    cmp.set("v.Message", 'No Result Found...');
                } else {
                    cmp.set("v.Message", 'Search Result...');
                }
                cmp.set("v.SearchAccount", a.getReturnValue());
                document.getElementById('lookup-348').style.display = 'block';
                //alert('yo');
                console.log(a.getReturnValue());
            }
        });
        //$A.util.toggleClass(toggleText, "toggle");
        $A.enqueueAction(action); 
    },
    getLookup : function(cmp,event) {
        var src = event.getSource();
        var outputText = cmp.find("src.getLocalId()");
        var selAcc = cmp.get("v.SearchAccount");
        alert('outputText == '+outputText);
        alert('id=== '+src.getLocalId("v.Id"));
		//alert('id== '+src.get("v.aura:id"));
        cmp.set("v.searchKey", src.get("v.value"));
        document.getElementById('lookup-348').style.display = 'None';
        console.log('value=='+selAcc);
    },
    getSave : function(cmp,event) {
        var action = cmp.get("c.getSaveOpp");
        //alert('oppList');
        console.log(cmp.get("v.OpportunityList"));
        console.log(JSON.stringify(cmp.get("v.OpportunityList")));
        action.setParams({
            "oppList" : JSON.stringify(cmp.get("v.OpportunityList"))            
        });
        
        action.setCallback(this, function(a) {
            //alert('responseOppList');
            var state = a.getState();
            if (cmp.isValid() && state === "SUCCESS") {
                cmp.set("v.OpportunityList", a.getReturnValue());
                console.log(a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
	getAccounts : function(cmp) {
        var action = cmp.get("c.getAccountList");
        var action1 = cmp.get("c.getAccountCount");
        //alert('AccountName== '+ cmp.get("v.accId"));
        action.setParams({
            "offset" : cmp.get("v.offset"),
            "limits" : cmp.get("v.limit"),
            "accId" : cmp.get("v.accId")
        });
        action.setCallback(this, function(a) {
            //alert('hi');
            var state = a.getState();
            if (cmp.isValid() && state === "SUCCESS") {
                //alert('hello');
                //alert('oppLength= '+a.getReturnValue().length);
                cmp.set("v.OpportunityList", a.getReturnValue());
                //cmp.set("v.accListSize", a.getReturnValue().length);
                //console.log(a.getReturnValue());
            }
        });
        action1.setParams({
            "accId" : cmp.get("v.accId")
        });
        action1.setCallback(this, function(a) {
            //alert('action1');
            var state = a.getState();
            if (cmp.isValid() && state === "SUCCESS") {
                //alert('hello action1');
                //alert('AccSize== '+a.getReturnValue());
                cmp.set("v.accListSize", a.getReturnValue());
                
                //console.log(a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
        $A.enqueueAction(action1);
    },
    getNext : function(cmp) {
        //var toggleText = cmp.find("text");
        var offset = cmp.get("v.offset");
        var limit = cmp.get("v.limit");
        //alert(offset);
        if(offset+limit < cmp.get("v.accListSize")){
            var action = cmp.get("c.getAccountList");
            action.setParams({
                "offset" : cmp.get("v.offset")+cmp.get("v.limit"),
                "limits" : cmp.get("v.limit"),
                "accId" : cmp.get("v.accId")
       		});
        	action.setCallback(this, function(a) {
                //alert('hi');
                var state = a.getState();
                if (cmp.isValid() && state === "SUCCESS") {
                    //alert('hello');
                    //alert(a.getReturnValue().length);
                    cmp.set("v.offset",cmp.get("v.offset")+cmp.get("v.limit"));
                    cmp.set("v.OpportunityList", a.getReturnValue());
                    //alert('set = '+a.getReturnValue())
                    //cmp.set("v.accListSize", a.getReturnValue().length);
                    //console.log(a.getReturnValue());
                }
        	});
       
        	$A.enqueueAction(action);
        }
        else{
            cmp.set("v.buttonShowHide", false);
            //alert('end of list');
        }
        
    },
    getPrevious : function(cmp){
        var offset = cmp.get("v.offset");
        var limit = cmp.get("v.limit");
        //alert(offset);
        if(offset-limit >= 0){
            var action = cmp.get("c.getAccountList");
            action.setParams({
                "offset" : cmp.get("v.offset")-cmp.get("v.limit"),
                "limits" : cmp.get("v.limit"),
                "accId" : cmp.get("v.accId")
            });
        	action.setCallback(this, function(a) {
                //alert('hi');
                var state = a.getState();
                if (cmp.isValid() && state === "SUCCESS") {
                    //alert('hello');
                    //alert(a.getReturnValue().length);
                    cmp.set("v.offset",cmp.get("v.offset")-cmp.get("v.limit"));
                    cmp.set("v.OpportunityList", a.getReturnValue());
                    //cmp.set("v.accListSize", a.getReturnValue().length);
                    //console.log(a.getReturnValue());
                }
            });
       
        	$A.enqueueAction(action);
        }
        else{
            cmp.set("v.buttonShowHide", false);
            //alert('end of list');
        }
    }
})