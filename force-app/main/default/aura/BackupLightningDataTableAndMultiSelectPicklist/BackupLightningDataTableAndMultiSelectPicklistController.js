({
    init: function (cmp, event, helper) {
        helper.fetchData(cmp, event, helper);
        helper.initColumnsWithActions(cmp, event, helper)
    },
    
    handleColumnsChange: function (cmp, event, helper) {
        helper.initColumnsWithActions(cmp, event, helper)
    },
    
    handleRowAction: function (cmp, event, helper) {
        var action = event.getParam('action');
        var row = event.getParam('row');
        var onRowActionHandler = cmp.get('v.onRowActionHandler');
        
        if(onRowActionHandler){
            $A.enqueueAction(onRowActionHandler)                       
        }else{            
            switch (action.name) {
                case 'edit':
                    helper.editRecord(cmp, row)
                    break;
                case 'delete':
                    helper.removeRecord(cmp, row)
                    break;
            }
        }
    },
    
    handleGotoRelatedList : function (cmp, event, helper) {
        var relatedListEvent = $A.get("e.force:navigateToRelatedList");
        relatedListEvent.setParams({
            "relatedListId": "DMS__r",
            "parentRecordId": cmp.get("v.recordId")
        });
        relatedListEvent.fire();
    },
    
    handleCreateRecord : function (cmp, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        createRecordEvent.setParams({
            "entityApiName": cmp.get("v.sobjectApiName"),
            "defaultFieldValues": {
                [cmp.get("v.relatedFieldApiName")] : cmp.get("v.recordId")
            },
            "navigationLocation": "RELATED_LIST"
        });
        createRecordEvent.fire();
    },
    
    DocFolderModal : function(component, event, helper) {
        component.set("v.isFolderModalOpen",true);
        //  var action = component.get("c.getDocTypePickListValues");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                //var records = response.getReturnValue();             
                //  component.set('v.DMSDocTypeOption', response.getReturnValue())
                
            }else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        
        $A.enqueueAction(action); 
    },
    
    openModal : function(component, event, helper) {
        component.set("v.isModalOpen",true);
        var action = component.get("c.getDocTypePickListValues");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                //var records = response.getReturnValue();             
                component.set('v.DMSDocTypeOption', response.getReturnValue())
                
            }else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        
        $A.enqueueAction(action); 
        
        var action2 = component.get("c.getDocFolderNameWithId");
        action2.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                //var records = response.getReturnValue();             
                component.set('v.DMSDocFolderNameOption', response.getReturnValue())
                
            }else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        
        $A.enqueueAction(action2); 
        
        var action3 = component.get("c.getContLOBPickListValues");
        action3.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                //var records = response.getReturnValue();             
                component.set('v.DMSDocContLOBOption', response.getReturnValue())
                
            }else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        
        $A.enqueueAction(action3); 
    },
    /*
    handleConfirm : function(component, event, helper) {
        //Find lightning flow from component
        var flow = component.find("AccountNavigation");
        //Put input variable values
        var inputVariables = [];
           {
                name : "AccountId",
                type : "String",
                value : component.get("v.recordId")
            }
        ]; 
        //Reference flow's Unique Name
        flow.startFlow("accountnavigation",inputVariables);
    }, */
    
    statusChange : function (cmp, event) {
        cmp.set("v.isModalOpen",true);
        if (event.getParam('status') === "FINISHED") {
            
        }
    },
    
    DownloadFile : function (cmp, event, helper) {
        var downloadRecordId = cmp.get("v.selectedRowsID");
        console.log('==downloadRecordId 53=='+downloadRecordId[0]);
        var action1 = cmp.get("c.FileDownload");
        action1.setParams({
            "recordIds" : downloadRecordId
        });
        
        action1.setCallback(this, function(response) {
            var urlEvent = $A.get("e.force:navigateToURL");
            console.log('Response ==60 '+response.getReturnValue());
            urlEvent.setParams({ "url": response.getReturnValue()
                               });
            urlEvent.fire();
        });
        
        $A.enqueueAction(action1);   
    },
    
    changeFolder: function (cmp, event, helper) {
        var selectedOptionValue = event.getParam("value");
        //cmp.set("v.folderName", selectedOptionValue)
        //alert("Option selected with value: '" + selectedOptionValue + "'");
        var action = cmp.get("c.initData");
        action.setParams({
            "recordId" : cmp.get("v.recordId"),
            "folderName" : selectedOptionValue
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var records = response.getReturnValue();             
                cmp.set('v.records', records)
                
            }else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        
        $A.enqueueAction(action); 
        
    },
    
    onChangeDocType: function (cmp, event, helper) {
        var selectedOptionValue = event.getParam("value");
        cmp.set("v.SelectedDMSDocType", selectedOptionValue)
        alert("Option selected with value: 171'" + selectedOptionValue);
    },
    
    onChangeDocFolder: function (cmp, event, helper) {
        var selectedOptionValue = event.getParam("value");
        cmp.set("v.SelectedDMSFolder", selectedOptionValue)
        alert("Option selected with value: 177'" + selectedOptionValue);
    },
    
    handleRowAction: function (cmp, event, helper) {
        var action = event.getParam('action');
        var row = event.getParam('row');
        switch (action.name) {
            case 'edit':
                var navEvt = $A.get("e.force:editRecord");
                navEvt.setParams({
                    "recordId": row.Id
                });
                navEvt.fire();
                break;
                
            case 'delete':
                var rows = cmp.get('v.records');
                var rowIndex = rows.indexOf(row);
                console.log('rowIndex'+rowIndex);
                console.log('rowIndex row'+rows[rowIndex].Id);
                var deleteDMS = cmp.get("c.deleteRecord");
                deleteDMS.setParams({ "recordId" : rows[rowIndex].Id });
                $A.enqueueAction(deleteDMS);
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "message": "The record has been delete successfully.",
                    "type": "success"
                });
                toastEvent.fire();
                rows.splice(rowIndex, 1);
                cmp.set('v.records', rows);
                break;
                
                
            case 'UploadVersion':
                console.log('==coming==232');
                var UploadVersion = cmp.get("c.FolderUpdate");
                console.log('==coming==');
                UploadVersion.setParams({
                    "fileName" : row.Name,
                    "recordId" :  row.Id
                });
                UploadVersion.setCallback(this, function(response) {
                    console.log('==comingBeforeCallback==');
                    var state = response.getState();
                    if (state === "SUCCESS") {
                        console.log('==comingAfterCallback==');
                        var uploadEvt = $A.get("e.force:navigateToSObject"); //force:navigateToSObject
                        uploadEvt.setParams({
                            "recordId": response.getReturnValue()
                        });
                        uploadEvt.fire();
                    }else if (state === "ERROR") {
                        var errors = response.getError();
                        if (errors) {
                            if (errors[0] && errors[0].message) {
                                console.log("Error message: " + errors[0].message);
                            }
                        } else {
                            console.log("Unknown error");
                        }
                    }
                });
                $A.enqueueAction(UploadVersion); 
                break;
                
            case 'view':
                console.log('==ROWID 290=== '+row.Id);
                var UpdateParentField = cmp.get("c.updateParentRecordId");
                UpdateParentField.setParams({
                    "recordId" :  row.Id,
                    "parentRecordId" : cmp.get("v.recordId")
                });
                UpdateParentField.setCallback(this, function(response) {
                    var state = response.getState();
                    if (state === "SUCCESS") {
                        var navEvt = $A.get("e.force:navigateToSObject"); //force:navigateToSObject
                        navEvt.setParams({
                            "recordId": response.getReturnValue()
                        });
                        navEvt.fire();
                    }else if (state === "ERROR") {
                        var errors = response.getError();
                        if (errors) {
                            if (errors[0] && errors[0].message) {
                                console.log("Error message: " + errors[0].message);
                            }
                        } else {
                            console.log("Unknown error");
                        }
                    }
                    
                });
                $A.enqueueAction(UpdateParentField);
                break;
                
        }
    },
    
    closePreviewModel: function(component, event, helper) {
        // for Close Model, set the "hasModalOpen" attribute to "FALSE"  
        component.set("v.isModalResponseOpen", false);
        component.set("v.responseStore" , null); 
    },
    
    updateSelectedText : function(component, event, helper){
        var selectedRows = event.getParam('selectedRows');
        console.log('selectedRows 57== '+selectedRows);
        component.set("v.selectedRowsCount" ,selectedRows.length );
        let obj =[] ; 
        for (var i = 0; i < selectedRows.length; i++){
            
            obj.push(selectedRows[i].Id);
            
        }
        
        
        component.set("v.selectedRowsID" ,obj);
        console.log('selectedRows 68== '+component.get("v.selectedRowsID"));
        //component.set("v.selectedRowsList" ,event.getParam('selectedRows') );
        
    },
    
    closeModel: function(component, event, helper) {
        component.set("v.isModalOpen", false); 
        component.set("v.isFolderModalOpen", false);
    },
    
    goToMultiSelectValues: function(component, event, helper) {
        const selectedOptions = component.find("folders").get("v.selectedOptions");
        console.log('==351 options== '+JSON.stringify(selectedOptions));
        var options = [];
        for(var i in selectedOptions){
            options.push(selectedOptions[i].Name);
        }
        console.log('==356=='+options);
        var selectedFolder = component.get("c.selectedFolderList");
                selectedFolder.setParams({
                    "selectedFoldersName" :  options,
                    "recordId" : component.get("v.recordId") 
                   });
        selectedFolder.setCallback(this, function(response) {
                    var state = response.getState();
                    if (state === "SUCCESS") {
                        component.set("v.records",response.getReturnValue())
                        console.log('===366 Response=='+JSON.stringify(component.get("v.records")));
                    }else if (state === "ERROR") {
                        var errors = response.getError();
                        if (errors) {
                            if (errors[0] && errors[0].message) {
                                console.log("Error message: " + errors[0].message);
                            }
                        } else {
                            console.log("Unknown error");
                        }
                    }
                    
                });
                $A.enqueueAction(selectedFolder);
    },
    
    navigate:function(cmp){
        console.log('=COming 200');
        console.log('==LOB254=='+cmp.get("v.DMSContLOB"));
        var allValid = cmp.find('field').reduce(function (validSoFar, inputCmp) {
            inputCmp.reportValidity();
            return validSoFar && inputCmp.checkValidity();
        }, true);
        if (allValid) {
            var action = cmp.get("c.createDMSRecord");
            action.setParams({
                "recordId" : cmp.get("v.recordId"),
                "docName" : cmp.get("v.DMSDocName"),
                "desc" : cmp.get("v.DMSDescription"),
                "key" : cmp.get("v.DMSKeyWords"),
                "version" : cmp.get("v.DMSVersion"),
                "docType" : cmp.get("v.SelectedDMSDocType"),
                "folder" : cmp.get("v.SelectedDMSFolder"),
                "contLOB" : cmp.get("v.DMSContLOB"),
                "activeCont" : cmp.get("v.DMSActiveCont"),
                "CompCont" : cmp.get("v.DMSCompCont")
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    var recordId = response.getReturnValue();
                    //var idx= event.currentTarget.id;
                    var navEvt = $A.get("e.force:navigateToSObject");
                    navEvt.setParams({
                        "recordId": recordId,
                        "slideDevName": "detail"
                        
                    });
                    navEvt.fire();
                    //cmp.set('v.records', records)
                    
                }else{
                     cmp.set('v.isModalOpen', true)
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Warning!",
                    "message": "Please enter all the required fields.",
                    "type": 'warning'
                });
                toastEvent.fire();
                    
                }
            });
            
            $A.enqueueAction(action); 
        } 
    },
    
    folderCreate:function(cmp){
        var folderValue = cmp.get("v.DocFoldName");
        if(folderValue){
            var action5 = cmp.get("c.newDocFolder");
        	action5.setParams({
            "docName" : cmp.get("v.DocFoldName"),
            "descptn" : cmp.get("v.DocFoldDesc")
        });
        action5.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                if(response.getReturnValue() == true){
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                       "title": "Error!",
                        "message": "This folder Name is already exist",
                        "type": 'Error'
                    });
                    toastEvent.fire();
                }
                else{
                    cmp.set('v.isFolderModalOpen', false)
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title": "Success!",
                        "message": "The record has been created successfully.",
                        "type": 'success'
                    });
                    toastEvent.fire();
                }
            }else {
                
            }
        });
        $A.enqueueAction(action5);  
        }
        else{
            var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "error!",
                    "message": "Please enter a Folder Name",
                    "type": 'error'
                });
                toastEvent.fire();
        }
    }, 
    
    /*
        var idx= event.currentTarget.id;
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": idx,
            "slideDevName": "detail"
            
        });
        navEvt.fire(); */
    
    
    handleMultiSelect: function (cmp, event) {
        // This will contain an array of the "value" attribute of the selected options
        var selectedOptionValue = event.getParam("value");
        cmp.set("v.DMSContLOB",selectedOptionValue);
        //alert("Option selected with value: '" + selectedOptionValue.toString() + "'");
    },
    
    handleToastEvent  : function (cmp, event, helper) {
        var eventType = event.getParam('type');
        var eventMessage= event.getParam('message');
        if(eventType == 'SUCCESS' && eventMessage.includes(cmp.get('v.sobjectLabel'))){
            helper.fetchData(cmp, event, helper)
            event.stopPropagation();            
        }        
    },   
    
})