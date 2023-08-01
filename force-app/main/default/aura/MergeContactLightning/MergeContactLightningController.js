({
    doInit : function(component, event, helper) {
        var accIdFromVf=component.get("v.AccIDFromVfPage");
        // alert(accIdFromVf);
        var action = component.get("c.GetConRecords");
        
        action.setParams({ 
            accId: accIdFromVf //'0013I00000VW55fQAD'            
        });
        
        action.setCallback(this, function(response) {
            //store state of response
            var state = response.getState();          
            if (state === "SUCCESS") {
                var rtdata=JSON.stringify(response.getReturnValue());  
                console.log('data-->',response.getReturnValue());
                component.set('v.contactList', response.getReturnValue());                
                var output=response.getReturnValue();
                if(output.length==2 || output.length==3)
                {
                   // component.set('v.checkval',true);
                }
                else
                {
                    component.set('v.searchTerm','');
                    var selrows=component.get('v.selectedRow');
                    console.log('selrows===>'+selrows);
                    // console.log('')alert('sel len-->'+selrows.length);
                    if(selrows.length>0)
                    {
                        helper.checkBoxes(component, event, helper);                        
                    }
                }
            }
        });
        $A.enqueueAction(action);        
    },
    onNext : function(component, event, helper) {        
        var checkboxesChecked = component.get('v.selectedRow');
        var accIdFromVf=component.get("v.AccIDFromVfPage");
        //console.log('selectedRow on next-->',checkboxesChecked);
        //alert(accIdFromVf);
        if(checkboxesChecked.length<=1)
        {
            component.set('v.lessConMsg','You must select two or three records to merge.');
        }
        else if(checkboxesChecked.length>3)
        {
            component.set('v.lessConMsg','Please select only two or three contacts to continue to merge.');
        }else{
            component.set('v.lessConMsg','');
            var compEvents = component.getEvent("componentEventFired");
            compEvents.setParams({ "message" : "Next" ,"checkboxesChecked":checkboxesChecked});
            compEvents.fire();                
        }
    },
    getSelectedRow : function(component, event, helper) {
        var currentCheckVal=event.getSource().get('v.value');		console.log('currentCheckVal====>'+currentCheckVal);
        var currentText=event.getSource().get('v.text');        
        var checkboxesChecked = [];
        var checkvalue = component.find("checkbox"); 	
        var index;
        for (var i = 0; i < checkvalue.length; i++) {//getting index and pusing into checkboxesChecked List.
            console.log('check box true or false====>'+checkvalue[i].get("v.value"));
            if (checkvalue[i].get("v.value") == true) {
                if(checkvalue[i].get("v.text")==event.getSource().get('v.text'))
                {
                    index=i;
                }
                if(checkboxesChecked.length<3)
                {
                    checkboxesChecked.push(checkvalue[i].get("v.text"));
                }
                else
                {
                    alert('You can not select more than 3 records to merge.');
                    checkvalue[index].set("v.value","false");
                }                
            }
        }        
        var selRows=[];
        //var allchecks=[];
        selRows=component.get('v.selectedRow');
        console.log('selRows initiallly======>'+selRows);
 		console.log('checkboxesChecked ======>'+checkboxesChecked);
        if(selRows.length==0)
        {
            component.set('v.selectedRow',checkboxesChecked);
            
        }else{
            
            //if some rows already selected previously.
            for (var i = 0; i < checkvalue.length; i++) {
                console.log('check box true or false====>'+checkvalue[i].get("v.value"));
                if (checkvalue[i].get("v.value") == true) {
                    if(!selRows.includes(checkvalue[i].get("v.text")))	{	//if not included alraedy
                        if(selRows.length<3)
                        {
                            selRows.push(checkvalue[i].get("v.text"));
                        }
                        else
                        {
                            alert('You can not select more than 3 records to merge.');
                            checkvalue[index].set("v.value","false");
                        }
                    }
                }
            }
            const index = selRows.indexOf(currentText);
            if(currentCheckVal == false)
            {	 console.log('currentCheckVal   inside false');
	             selRows.splice(index, 1);
                 //selRows.remove(currentText);
            }
            console.log('selRows-->'+selRows);
            //component.set("v.selectedRow",[]);
            //console.log('blankkselectedRow-->',component.get('v.selectedRow'));
            component.set('v.selectedRow',selRows);
        }
        console.log('selRows finally======>',component.get('v.selectedRow'));
    },
    findContacts : function(component, event, helper) {
        var accIdFromVf=component.get("v.AccIDFromVfPage");
        var con= component.get("v.contactList");
        var searchInput =  component.find("searchBox").get("v.value");
        var action = component.get("c.findSearchContact");
        action.setParams({
            "contName" : searchInput,
            "accId": accIdFromVf
        })
        action.setCallback(this, function(response) {
            var state = response.getState(); 
            if (state === "SUCCESS") {
               component.set("v.contactList",response.getReturnValue()); 
            }
        });
        $A.enqueueAction(action);
        /*
        var upadtedList=[];
        for (var i= 0; i < con.length; i++) {
            var a = con[i]['Name'];
            a=a.substring(0,searchInput.length);
            if(searchInput==a)
            {
                upadtedList.push(con[i]);
            }
        }
        component.set("v.contactList",upadtedList);*/
        
    }, 
    
    findAllContacts : function(component, event, helper) {
        var con= component.get("v.contactList");
        var accIdFromVf=component.get("v.AccIDFromVfPage");
        var searchInput =  component.find("searchBox").get("v.value");
        var action = component.get("c.GetConRecords");
        action.setParams({
            accId: accIdFromVf,
        })
        action.setCallback(this, function(response) {
            var state = response.getState(); 
            if (state === "SUCCESS") {
               component.set("v.contactList",response.getReturnValue()); 
            }
        });
        $A.enqueueAction(action);
    },
    
    onCancel : function(component, event, helper) {
        var accIdFromVf=component.get("v.AccIDFromVfPage");       
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": accIdFromVf, //'0013I00000VW55fQAD'
            "slideDevName": "detail"            
        });
        navEvt.fire();
    }    
})