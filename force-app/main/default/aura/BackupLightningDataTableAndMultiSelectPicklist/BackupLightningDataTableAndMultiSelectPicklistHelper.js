({
    fetchData: function (cmp, event, helper) {
        var actions = [
            { label: 'Edit', name: 'edit' },
            //{ label: 'Preview Document', name: 'preview' },
            { label: 'View', name: 'view' },
            { label: 'Delete', name: 'delete' },
            { label: 'Upload New Version', name: 'UploadVersion' }
        ];

        cmp.set('v.mycolumns', [
            {label: 'Document Name', fieldName: 'Document_Name__c', type: 'text'},
                {label: 'JobID', fieldName: 'jobID__c', type: 'text'},
            	{label: 'Version', fieldName: 'Version__c', type: 'number'},
                {label: 'Folder', fieldName: 'folders__c', type: 'text'},
            	{ type: 'action', typeAttributes: { rowActions: actions } }

            ]);
 		var action = cmp.get("c.initData")
 		var relatedFieldApiName = cmp.get("v.relatedFieldApiName")
        console.log('==Selected ROw ID 19 == '+cmp.get("v.SelectedDocMangIds"));
        console.log('==RecordId 5 == '+cmp.get("v.recordId"));
        var numberOfRecords = cmp.get("v.numberOfRecords")
        /*var jsonData = JSON.stringify({fields:cmp.get("v.fields"),
                                       relatedFieldApiName:cmp.get("v.relatedFieldApiName"),
                                       recordId:cmp.get("v.recordId"),
                                       numberOfRecords:numberOfRecords + 1,
                                       sobjectApiName: cmp.get("v.sobjectApiName"),
                                       sortedBy: cmp.get("v.sortedBy"),
                                       sortedDirection: cmp.get("v.sortedDirection")
        }); */
        action.setParams({
            recordId : cmp.get("v.recordId"),
            folderName : cmp.get("v.folderName")
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
        
        var action2 = cmp.get("c.getDocumentFolderName"); 
        action2.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var optionsList = [];
                /*var records = response.getReturnValue();   
                for(var i in records){
                    optionsList.push(records[i].label);
                }*/
                cmp.set('v.DocFolderNames', response.getReturnValue())
                console.log('==67 DOC Name=='+JSON.stringify(cmp.get("v.DocFolderNames")));
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
    },
    
    flattenStructure : function (helper,topObject, prefix, toBeFlattened) {
      for (const prop in toBeFlattened) {
        const curVal = toBeFlattened[prop];
        if (typeof curVal === 'object') {
          helper.flattenStructure(helper, topObject, prefix + prop + '_', curVal);
        } else {
          topObject[prefix + prop] = curVal;
        }
      }
    },    
    
   initColumnsWithActions: function (cmp, event, helper) {
        var customActions = cmp.get('v.customActions')
        if( !customActions.length){
            customActions = [
                { label: 'Edit', name: 'edit' },
                { label: 'Delete', name: 'delete' }
	        ]         
        }
        
        var columns = cmp.get('v.columns')        
        var columnsWithActions = []
        columnsWithActions.push(...columns)
        columnsWithActions.push({ type: 'action', typeAttributes: { rowActions: customActions } })
        cmp.set('v.columnsWithActions',  columnsWithActions)
    },    
    
    removeRecord: function (cmp, row) {
        var modalBody;
        var modalFooter;
        var sobjectLabel = cmp.get('v.sobjectLabel')
        $A.createComponents([
            ["c:deleteRecordContent",{sobjectLabel:sobjectLabel}],
            ["c:deleteRecordFooter",{record: row, sobjectLabel:sobjectLabel}]
        ],
        function(components, status){
            if (status === "SUCCESS") {
                modalBody = components[0];
                modalFooter = components[1];
                cmp.find('overlayLib').showCustomModal({
                   header: "Delete " + sobjectLabel,
                   body: modalBody, 
                   footer: modalFooter,
                   showCloseButton: true
               })
            }
        }
       );
        
    },
    
	editRecord : function (cmp, row) {
        var createRecordEvent = $A.get("e.force:editRecord");
        createRecordEvent.setParams({
            "recordId": row.Id
        });
        createRecordEvent.fire();
	}, 
})