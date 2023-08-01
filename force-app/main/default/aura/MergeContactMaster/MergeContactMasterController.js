({
    doOnLoad : function(component, event, helper) {
        var action = component.get('c.fetchRelatedList');
        action.setParams({
            "filterString" : ''
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS"){
                component.set("v.RelatedList", response.getReturnValue()); 
                component.set("v.allOptionsDuplicate", response.getReturnValue());
            } 
        });
        $A.enqueueAction(action);
    },
    onPrevious: function(component, event, helper) {
    	var mergeContactEvt = component.getEvent("mergeContMaterEvent");
        mergeContactEvt.fire();       
    },
    
    getListOfConIds : function(component, event, helper) {
               event.getParam("MergeListOfContactIds");  
    },
    
    
    
    handleListClickL2R : function(component, event, helper) {
        //debugger;
        var item = event.currentTarget.dataset.value;
        var currentRightValue = component.get('v.selectedList');
        var selectedValue = [];
        if(!$A.util.isEmpty(currentRightValue)){
            for(var j in currentRightValue){
                selectedValue.push(currentRightValue[j].value);
            }
        }
        var newleftlist=[];
        var newrightlist=[];
        var newleftlisttemp=[];
        var options = component.get("v.RelatedList");
        for(var i in options){
            var subc;
            
          //  console.log('==item 28== '+item);
            if(options[i].value===item){
                if(!selectedValue.includes(options[i].value)){
                    subc = {label:options[i].label,value:options[i].value ,selected:true};
                    //newrightlist.push(options[i]);
                }else{
                    subc =options[i];
                    subc.selected=false;
                }
            }else{
                if(options[i].selected===undefined){
                    subc = {label:options[i].label,value:options[i].value ,selected:false};
                }else{
                    subc =options[i];
                }
            }
            
          //  console.log('subc main==',subc);
            newleftlist.push(subc);
        }
        //debugger;
        for(var i in newleftlist){
            console.log();
            if(newleftlist[i].selected){
                var subc;
                subc = {label:newleftlist[i].label,value:newleftlist[i].value ,selected:false};
                newrightlist.push(subc);
            }
        }
        
        console.log('newleftlist==',newleftlist);
        console.log('newrightlist==',newrightlist);
        component.set('v.selectedList',newrightlist);
        //console.log('===41=== '+component.get("v.selectedList"));
        component.set('v.RelatedList',newleftlist);
        //component.set("v.allOptionsDuplicate", newleftlist);
        
    },
    
    moveLeftToRight : function(component,event, helper){
        //component.set('v.rightValues',component.get("v.selectedList"));
         var addValuesLeftToRight= component.get("v.selectedList");
        var rightCurrentValues =  component.get("v.rightValues");
        var currentLeftValues = component.get("v.allOptionsDuplicate");
        var newleftlist = [];
        var selectedlist=[];
        
        for(var i in addValuesLeftToRight){
            var subc;
            subc = {label:addValuesLeftToRight[i].label,value:addValuesLeftToRight[i].value ,selected:false};
            selectedlist.push(addValuesLeftToRight[i].value);
            rightCurrentValues.push(subc);
        }
        for(var i in currentLeftValues){
            if(selectedlist.includes(currentLeftValues[i].value)){
                continue;
            }else{
                newleftlist.push(currentLeftValues[i]);
            }
            
        }
        
        var blanklist = [];
        component.set("v.rightValues",rightCurrentValues);
        component.set("v.RelatedList",newleftlist);
        component.set("v.allOptionsDuplicate",newleftlist);
        component.set("v.selectedList",blanklist);
        //component.set("v.selectedInRightList",null);
       // component.set("v.selectedList",clearArray);
       // component.set('v.selectedInRightList',clearArray);
    },
    
    handleListClickR2L : function(component, event, helper){
        //debugger;
        var item = event.currentTarget.dataset.value;
        var currentRightValue = component.get('v.selectedInRightList');
        var selectedValue = [];
        if(!$A.util.isEmpty(currentRightValue)){
            for(var j in currentRightValue){
                selectedValue.push(currentRightValue[j].value);
            }
        }
        var newleftlist=[];
        var newrightlist=[];
        var newleftlisttemp=[];
        var options = component.get("v.rightValues");
        for(var i in options){
            var subc;
            
          //  console.log('==item 28== '+item);
            if(options[i].value===item){
                if(!selectedValue.includes(options[i].value)){
                    subc = {label:options[i].label,value:options[i].value ,selected:true};
                    //newrightlist.push(options[i]);
                }else{
                    subc =options[i];
                    subc.selected=false;
                }
            }else{
                if(options[i].selected===undefined){
                    subc = {label:options[i].label,value:options[i].value ,selected:false};
                }else{
                    subc =options[i];
                }
            }
            
          //  console.log('subc main==',subc);
            newleftlist.push(subc);
        }
        //debugger;
        for(var i in newleftlist){
            console.log();
            if(newleftlist[i].selected){
                var subc;
                subc = {label:newleftlist[i].label,value:newleftlist[i].value ,selected:false};
                newrightlist.push(subc);
            }
        }
        
        console.log('newleftlist==',newleftlist);
        console.log('newrightlist==',newrightlist);
        component.set('v.selectedInRightList',newrightlist);
        //console.log('===41=== '+component.get("v.selectedList"));
        component.set('v.rightValues',newleftlist);
    },
    
    moveRightToLeft : function(component,event, helper){
        var addValuesRightToLeft = component.get("v.selectedInRightList");
        var rightCurrentValues =  component.get("v.rightValues");
        var currentLeftValues = component.get("v.allOptionsDuplicate");
        var newleftlist = [];
        var selectedlist=[];
        
        for(var i in addValuesRightToLeft){
            var subc;
            subc = {label:addValuesRightToLeft[i].label,value:addValuesRightToLeft[i].value ,selected:false};
            selectedlist.push(addValuesRightToLeft[i].value);
            currentLeftValues.push(subc);
        }
        for(var i in rightCurrentValues){
            if(selectedlist.includes(rightCurrentValues[i].value)){
                continue;
            }else{
                newleftlist.push(rightCurrentValues[i]);
            }
            
        }
        
        var blanklist = [];
        component.set("v.rightValues",newleftlist);
        component.set("v.RelatedList",currentLeftValues);
        component.set("v.allOptionsDuplicate",currentLeftValues);
        //component.set("v.allOptionsDuplicate", currentLeftValues);
        component.set("v.selectedInRightList",blanklist);
        //component.set("v.selectedInRightList",null);
       // component.set("v.selectedList",clearArray);
    },
    
    nextButton : function (cmp, event, helper) {
        var contactIds=cmp.get("v.contactIdList");
        var testVal = "TestMergeObj__c";
        var MergeObjects = [];
        var listOfSobjectNames = cmp.get("v.rightValues");
        for (var i in listOfSobjectNames){
            
            MergeObjects.push(listOfSobjectNames[i].value);
            console.log("inside success" + MergeObjects);
            
        }
        
        //alert('controller params in merge Contact Master==>'+'conIds==>'+contactIds+'==sObjectChildAPIs==>'+MergeObjects+'==parentId ==>'+cmp.get("v.masterId"));
        var action = cmp.get("c.mergeChildRedcords");      //{caseId: component.get('v.recordId'), dept: dropdownSelection}
        
        action.setParams({  
            				"conIds":contactIds,
            				"sObjectChildAPIs": MergeObjects,			
            				"parentId":cmp.get("v.masterId")
            
                         });
        console.log("masterId==223== "+cmp.get("v.masterId"));
        console.log("conIds==224=="+contactIds);
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var returnValue=response.getReturnValue();	 console.log("returnValue-->" + JSON.stringify(returnValue));
                if(returnValue==='SUCCESS'){
                    console.log("inside success");
                     var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title : 'Success',
                        message: 'Merged SuccessFully',
                        duration:' 2000',
                        key: 'info_alt',
                        type: 'success',
                        mode: 'pester'
                    });
                    toastEvent.fire();
                    var navEvt = $A.get("e.force:navigateToSObject");
                    navEvt.setParams({
                        "recordId": cmp.get("v.masterId"),
                        "slideDevName": "detail"
                        
                    });
                    navEvt.fire();
                }else if(returnValue==='Failure'){
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title : 'Error',
                        message:'Error Occured During Merge',
                        duration:' 2000',
                        key: 'info_alt',
                        type: 'error',
                        mode: 'pester'
                    });
                    toastEvent.fire();
                }
            } else {
                
            }
        });
        $A.enqueueAction(action);
        
    },
    
    searchNow : function(cmp, event ,helper) {
        var filterStr = cmp.find("fString").get("v.value");
        var options = cmp.get("v.RelatedList");
        var options2 = cmp.get("v.allOptionsDuplicate");
        //console.log('options==',options);
        //console.log('filterStr==',filterStr);
        if(filterStr == null || filterStr == ''){
            cmp.set("v.RelatedList", options2 );  
            return;
        }
        else{
            var strname=[];
            for (let i = 0; i < options2.length; i++){
                if(options2[i].label.toLowerCase().includes(filterStr.toLowerCase())){
                    strname.push(options2[i]);
                }
            }
            cmp.set( "v.RelatedList", strname );
        }
    }
    
})