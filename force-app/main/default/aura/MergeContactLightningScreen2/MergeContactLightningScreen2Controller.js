({
    doInit : function(component, event, helper) {
        console.log('checksss-->',component.get('v.checkboxesChecked'));
        var selectedList = component.get('v.checkboxesChecked');
        var ids=new Array();
        for (var i= 0 ; i < selectedList.length ; i++){
            ids.push(selectedList[i].substring(6,selectedList[i].length));
        }        
        var idListJSON=JSON.stringify(ids);
        var action = component.get("c.GetConData");
        action.setParams({ 
            conIds: idListJSON            
        });
        action.setCallback(this, function(response) {
            //store state of response
            var state = response.getState();          
            if (state === "SUCCESS") {
                var rtdata=response.getReturnValue();
                component.set('v.contactData', rtdata); 
                //component.set('v.masterContact',rtdata[0]['masterContactId']);
                console.log('rtdata-->'+JSON.stringify(rtdata));
                //console.log('rtdata-->',rtdata[0]['fieldWrapper'][0]);
                var F1; var F2; var F3; var L1; var L2; var L3;                
                for(var i=0;i<rtdata[0]['fieldWrapper'].length;i++)
                {
                    if(rtdata[0]['fieldWrapper'][i]['labels']=="First Name")
                    { 
                        F1 =rtdata[0]['fieldWrapper'][i]['contactValue1'];
                        F2 =rtdata[0]['fieldWrapper'][i]['contactValue2'];
                        F3 =rtdata[0]['fieldWrapper'][i]['contactValue3'];
                        if(typeof F1=='undefined'){F1="";}
                        if(typeof F2=='undefined'){F2="";}
                        if(typeof F3=='undefined'){F3="";}
                    }
                    else if(rtdata[0]['fieldWrapper'][i]['labels']=="Last Name")
                    {
                        L1 =rtdata[0]['fieldWrapper'][i]['contactValue1'];
                        L2=rtdata[0]['fieldWrapper'][i]['contactValue2'];
                        L3=rtdata[0]['fieldWrapper'][i]['contactValue3'];
                    }
                }
                component.set('v.contactName1',F1 +' '+ L1);
                component.set('v.contactF1L1',F1 +'#'+ L1);
                component.set('v.contactName2',F2 +' '+ L2);
                component.set('v.contactF2L2',F2 +'#'+ L2);
                component.set('v.contactName3',F3 +' '+ L3);
                component.set('v.contactF3L3',F3 +'#'+ L3);
                
                console.log('masterContactId 49====-->'+rtdata[0].masterContactId);
                console.log('secondContactId 50====-->'+rtdata[0].secondContactId);
                console.log('thirdContactId 51====-->'+rtdata[0].thirdContactId);
				
                var master=rtdata[0].masterContactId;	  
                component.set("v.masterContactId", master);				
                component.set("v.masterRecId", master);	
                console.log('masterContactId 57====-->'+component.get("v.masterContactId"));
                
                
                var secChld=rtdata[0].secondContactId;
                component.set("v.secondContactId", secChld);
                console.log('secondContactId 58====-->'+component.get("v.secondContactId"));
                
                var thrdChld=rtdata[0].thirdContactId;
                component.set("v.thirdContId", thrdChld);        
                console.log('thirdContactId 59====-->'+component.get("v.thirdContId"));
             
            }
        });
        $A.enqueueAction(action);
        
       
    },
    UpdateMasterRecord : function(component, event, helper) {
        console.log('<=======UpdateMasterRecord ====>');
        var source = event.getSource();
        var selectedValue = source.get('v.value');
        var selectedapi = source.get('v.name');
        //console.log('selectedValue-->'+selectedValue);
        //console.log('selectedapi-->'+selectedapi);        
        var selRows=[];
        selRows=component.get('v.selectedRadios');
        if(selRows.length==0)
        {            
            selRows.push({ label: selectedapi,value: selectedValue});
        }
        else
        {          
            for(var i=0;i<selRows.length;i++)
            {
                if(selRows[i]['label']==selectedapi)
                {
                    selRows.splice(i, 1);
                }
            }           
            selRows.push({label: selectedapi,value: selectedValue});          
        }
        component.set('v.selectedRadios',selRows);
        console.log('selectedRadios-->',component.get('v.selectedRadios')); 
        if(selectedapi=="MasterRecord")
        {
            component.set('v.masterCon',selectedValue);
        }
    },
    SelectAll : function(component, event, helper) {
        //var datavalue = event.target.dataset.caseid;
      	//alert('==109=='+datavalue);
        console.log('masterContactId====-->'+component.get("v.masterContactId"));
        console.log('secondContactId====-->'+component.get("v.secondContactId"));
        console.log('thirdContactId====-->'+component.get("v.thirdContId"));
        
        //var datavalue= event.target.dataset.value;				  console.log('datavalue Attribute ====>'+datavalue);
        
        var a = event.getSource();
		var auraid = a.getLocalId();		console.log('auraid Attribute ====>'+auraid);		
        console.log('cmp.isValid() Attribute ====>'+component.isValid());
        var masterRec=event.getSource().get("v.name");				console.log('masterRec Attribute ====>'+masterRec);        
       
       
		
        //var recordId = event.target.dataset.caseid;				console.log('recordId Attribute ====>'+recordId);
        
        //var normalIdValue = event.currentTarget.id; 					console.log('normalIdValue====>'+normalIdValue);
        
        //var buttonValue=event.getSource().get("v.value");		 console.log('buttonValue  ====>'+buttonValue);
        
        component.set("v.masterRecId", masterRec);				 console.log('masterRecId setted ====>'+component.get("v.masterRecId"));
       
        var source = event.getSource();
        var selectedValue = source.get('v.value');			 console.log('selectedValue ====>'+selectedValue);
        if(selectedValue=='Main')
        {
            component.set('v.selectAll','Main');
            component.set('v.masterCon','Main');
        }
        else if(selectedValue=='child')
        {
            component.set('v.selectAll','child');
            component.set('v.masterCon','child');
        }
            else if(selectedValue=='child2')
            {
                component.set('v.selectAll','child2');
                component.set('v.masterCon','child2');
            }
        // alert('sall-->'+ component.get('v.masterCon'));
    },
    
    
    onPrevious : function(component, event, helper) {
        var compEvents = component.getEvent("componentEventFired");
        compEvents.setParams({ "message" : "Previous" ,"checkboxesChecked":""});
        compEvents.fire();           
    },
    
    onMerge : function(component, event, helper) {
        
        var master =component.get('v.masterCon');
        // var chngList=JSON.stringify(component.get('v.selectedRadios'));
        var contactData=component.get('v.contactData');
        //console.log('chngList-->',chngList);
        var masterid;
        var boolMain=false;        
        if(master=="Main")
        {
            masterid=contactData[0]['masterContactId'];
            boolMain=true;
        }
        else if(master=="child")
        {
            masterid=contactData[0]['secondContactId'];
        }else{
            masterid=contactData[0]['thirdContactId'];
		}
        
        var selectedRadios=[];
        selectedRadios=component.get('v.selectedRadios');
        if(boolMain==false && selectedRadios.length>0 )
        {
            var chcklength=component.get('v.checkboxesChecked').length;	
            //alert('lngth-->'+chcklength);
            for(var i=0;i<contactData[0]['fieldWrapper'].length;i++)
            {
                var apivl=contactData[0]['fieldWrapper'][i]['apinames'];
                var apinamevl=contactData[0]['fieldWrapper'][i]['contactValue1'];
                var apinamevl2=contactData[0]['fieldWrapper'][i]['contactValue2'];
                var apinamevl3=contactData[0]['fieldWrapper'][i]['contactValue3'];
                if(typeof apinamevl=='undefined')
                {
                    apinamevl='';
                }
                if(typeof apinamevl2=='undefined')
                {
                    apinamevl2='';
                }
                if(typeof apinamevl3=='undefined')
                {
                    apinamevl3='';
                }
                //console.log('ffapivl-->',apivl + '--ffapinamevl-->'+apinamevl);
                var boolexists=false;
                //if(apivl!='masterrecord' && apivl!='createdby.name,createddate' && apivl!='lastmodifiedby.name,lastmodifieddate' && apivl!='account.name' && apivl!='accountid' &&  apivl!='birthdate' && apinamevl !='false' && apivl!='last_completed_step__c' && apivl!='most_recent_platform_onboarding_date__c' && apivl!='last_marketing_email_click_date__c' && apivl!='last_marketing_email_open_date__c' && apivl!='freeoffer_msa_electronically_accept_date__c' && apivl!='hh_requested_date__c' && apivl!='date_moved_to_bdql__c' && apivl!='date_moved_to_seller_qualified__c' && apivl!='sdr_status_timestamp__c' && apivl!='certification_date__c' && apivl!='birthdate' && apivl!='last_reset_source_timestamp__c' && apivl!='ecustoms__im_date__c' && apivl!='ecustoms__rps_date__c' && apivl!='mkto71_acquisition_date__c' && apivl!='date_reached_out__c' && apivl!='pi__created_date__c' && apivl!='pi__first_activity__c' && apivl!='pi__last_activity__c' && apivl!='pi__conversion_date__c' && apivl!='pi__pardot_last_scored_at__c' && apivl!='zisf__zoominfo_last_clean_run__c' && apivl!='zisf__zoom_lastupdated__c' && apivl!='most_recent_engagement_date__c' && apivl!='lastcurequestdate' && apivl!='lastcuupdatedate' && apivl!= 'pi__score__c' && apivl!= 'spark_id__c' && apivl!= 'mkto71_acquisition_program_id__c' && apivl!= 'mkto71_lead_score__c' && apivl!= 'pardot_score_tier__c'	&& apivl!= 'pardot_initial_mql_tier__c')
                if(apivl!='masterrecord' && apivl!='createdby.name,createddate' && apivl!='lastmodifiedby.name,lastmodifieddate' && apivl!='account.name' && apivl!='accountid' &&  apivl!='birthdate')
                {                
                    for(var j=0;j<selectedRadios.length;j++)
                    {                        
                        if(selectedRadios[j]['label']==apivl && boolexists==false)
                        {
                            boolexists=true;
                        }
                    } 
                    if(boolexists==false)
                    {
                        if(chcklength=='2')	
                        {	
                            // alert('apinamevl2-->'+apinamevl2+'--apinamevl-->'+apinamevl);
                            if(apinamevl2 != apinamevl)	
                            {	
                                selectedRadios.push({label: apivl,value: apinamevl});	
                                // console.log('apivl-->',apivl + '--apinamevl-->'+apinamevl);	
                            }	
                        }	
                        else	
                        {	
                            if(apinamevl2 !=apinamevl && apinamevl3 !=apinamevl)	
                            {	
                                selectedRadios.push({label: apivl,value: apinamevl});	
                                //console.log('apivl-->',apivl + '--apinamevl-->'+apinamevl);	
                            }	
                            
                        }
                        //selectedRadios.push({label: apivl,value: apinamevl});
                        //console.log('apivl-->',apivl + '--apinamevl-->'+apinamevl);
                    }
                    component.set('v.selectedRadios',selectedRadios);
                }                
            }            
        }
        var chngList=JSON.stringify(component.get('v.selectedRadios'));
        
        console.log('chngList-->',chngList + '--id-->' +contactData[0]['masterContactId'] +'--2-->'+contactData[0]['secondContactId']+'--3-->'+contactData[0]['thirdContactId']);
        var action = component.get("c.MergeConData");
        action.setParams({ 
            masterCon: masterid,
            chngList : chngList,
            firstcon: contactData[0]['masterContactId'],
            secondcon:contactData[0]['secondContactId'],
            thirdcon: contactData[0]['thirdContactId']
        });
        action.setCallback(this, function(response) {
            //store state of response
            var state = response.getState();          
            if (state === "SUCCESS") {
                var rtdata=response.getReturnValue();
                
            }
        });
        
       /* var accIdFromVf=component.get("v.AccIDFromVfPage");
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": accIdFromVf, //'0013I00000VW55fQAD'
            "slideDevName": "detail"
            
        });
        navEvt.fire();
        */
        $A.enqueueAction(action);
        
        
        var compTwoToThreeEvent = component.getEvent("compTwoEventFired");
        console.log('compTwoToThreeEvent====>'+compTwoToThreeEvent);		
        compTwoToThreeEvent.setParams({ "ShowThirdComponent":true,"masterId":component.get("v.masterRecId")});
        
        compTwoToThreeEvent.fire();      
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