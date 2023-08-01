({
	getObjects : function(cmp) {
		var action = cmp.get("c.getName");
        //alert('outside');
        action.setCallback(this, function(a){
            //alert('inside');
            if(a.getState() === "SUCCESS"){
                cmp.set("v.ObjList", a.getReturnValue());
            } else if (a.getState() === "ERROR"){
                console.log("Errors", a.getError());
            }
        });
        $A.enqueueAction(action);
	},
    
    handlerGetObjectRecords : function(cmp) {
        var selected = cmp.find("levels").get("v.value");
        var fetchObjectLabels = cmp.get("c.getObjectLabels");//here c.getObjectRecords referene our controller and getObjectRecords is a method  	
        fetchObjectLabels.setParams({
            "objName" : cmp.find("levels").get("v.value")
        });
        //alert('outside');
        fetchObjectLabels.setCallback(this, function(a){
            //alert('inside');
            //alert(a.getReturnValue());
            if(a.getState() === "SUCCESS"){
                alert('SUCCESS LABELS == ' + a.getReturnValue());
                if (a.getReturnValue().length == 0) {
                    cmp.set("v.Message", 'No Result Found...');
                } 
                else {
                    // create a empty array for store map keys 
                    var arrayOfMapKeys = [];
                    // store the response of apex controller (return map)     
                    var StoreResponse = a.getReturnValue();
                    cmp.set("v.myMap", StoreResponse);
                    //alert(a.getReturnValue().getvalues());
                    alert('values available');
                    for (var singlekey in StoreResponse) {
                        arrayOfMapKeys.push(singlekey);
                    }
                    // Set the all list of keys on component attribute, which name is lstKey and type is list.     
                    cmp.set('v.ListSize', true);
                    cmp.set('v.lstKey', arrayOfMapKeys);
                    
                }
                
            } else if (a.getState() === "ERROR"){
                alert('ERROR');
                console.log("Errors", a.getError());
            }
        });
        $A.enqueueAction(fetchObjectLabels);
        
        //var selected = cmp.find("levels").get("v.value");
        var fetchObjectRecords = cmp.get("c.getObjectRecords");//here c.getObjectRecords referene our controller and getObjectRecords is a method  	
        fetchObjectRecords.setParams({
            "objName" : cmp.find("levels").get("v.value")            
        });
        
        //alert('outside');
        fetchObjectRecords.setCallback(this, function(a){
            //alert('inside');
            
            if(a.getState() === "SUCCESS"){
                alert('SUCCESS RECORDS == '+a.getReturnValue());
                if (a.getReturnValue().length == 0) {
                    cmp.set("v.Message", 'No Result Found...');
                } 
                else {        
                    // Set the all list of keys on component attribute, which name is lstKey and type is list.     
                    cmp.set('v.ObjRec', a.getReturnValue());
                }
                
            } else if (a.getState() === "ERROR"){
                alert('ERROR');
                console.log("Errors", a.getError());
            }
        });
        $A.enqueueAction(fetchObjectRecords);
    },
    
    handlerSelectAll: function(component,event) {
  //get the header checkbox value  
  var selectedHeaderCheck = event.getSource().get("v.value");
  // get all checkbox on table with "boxPack" aura id (all iterate value have same Id)
  // return the List of all checkboxs element 
  var getAllId = component.find("boxPack");
  // If the local ID is unique[in single record case], find() returns the component. not array   
     if(! Array.isArray(getAllId)){
       if(selectedHeaderCheck == true){ 
          component.find("boxPack").set("v.value", true);
          component.set("v.selectedCount", 1);
       }else{
           component.find("boxPack").set("v.value", false);
           component.set("v.selectedCount", 0);
       }
     }else{
       // check if select all (header checkbox) is true then true all checkboxes on table in a for loop  
       // and set the all selected checkbox length in selectedCount attribute.
       // if value is false then make all checkboxes false in else part with play for loop 
       // and select count as 0 
        if (selectedHeaderCheck == true) {
        for (var i = 0; i < getAllId.length; i++) {
  		  component.find("boxPack")[i].set("v.value", true);
   		 component.set("v.selectedCount", getAllId.length);
        }
        } else {
          for (var i = 0; i < getAllId.length; i++) {
    		component.find("boxPack")[i].set("v.value", false);
   			 component.set("v.selectedCount", 0);
  	    }
       } 
     }  
 
 },
    handlerCheckboxSelect: function(component, event) {
  // get the selected checkbox value  
  var selectedRec = event.getSource().get("v.value");
  // get the selectedCount attrbute value(default is 0) for add/less numbers. 
  var getSelectedNumber = component.get("v.selectedCount");
  // check, if selected checkbox value is true then increment getSelectedNumber with 1 
  // else Decrement the getSelectedNumber with 1     
  if (selectedRec == true) {
   getSelectedNumber++;
  } else {
   getSelectedNumber--;
  }
  // set the actual value on selectedCount attribute to show on header part. 
  component.set("v.selectedCount", getSelectedNumber);
 },
    deleteSelectedHelper: function(component, event) {
        // create var for store record id's for selected checkboxes  
        var delId = [];
        // get all checkboxes 
        var getAllId = component.find("boxPack");
        // If the local ID is unique[in single record case], find() returns the component. not array
        if(! Array.isArray(getAllId)){
            if (getAllId.get("v.value") == true) {
                delId.push(getAllId.get("v.text"));
            }
        }else{
            // play a for loop and check every checkbox values 
            // if value is checked(true) then add those Id (store in Text attribute on checkbox) in delId var.
            for (var i = 0; i < getAllId.length; i++) {
                if (getAllId[i].get("v.value") == true) {
                    delId.push(getAllId[i].get("v.text"));
                }
            }
        }
        //call apex class method
        var action = component.get('c.deleteRecords');
        // pass the all selected record's Id's to apex method 
        action.setParams({
            "lstRecordId": delId,
            "objName" : component.find("levels").get("v.value")
        });
        action.setCallback(this, function(response) {
            //store state of response
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log(state);
                
                if (response.getReturnValue() != '') {
                    // if getting any error while delete the records , then display a alert msg/
                    alert('The following error has occurred. while Delete record-->' + response.getReturnValue());
                } else {
                    component.set("v.selectedCount", 0);
                    console.log('check it--> delete successful');
                    alert('Delete Successful');
                }
                // call the onLoad function for refresh the List view    
                this.handlerGetObjectRecords(component);
                
            }
        });
        $A.enqueueAction(action);
    },
    editRecordHelper : function(component, event) {
        alert('Edit 1');
        var editRecordEvent = $A.get("e.force:editRecord");
        //var editRecordId = component.find("boxPack");
        //var action = component.get('c.editRecords');
        //if (editRecordId.get("v.value") == true) {
            editRecordEvent.setParams({
            "recordId": editRecordId
        });
       // }
        editRecordEvent.fire();
    }

})