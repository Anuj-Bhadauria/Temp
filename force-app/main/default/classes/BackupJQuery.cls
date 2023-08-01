public class BackupJQuery {

/*
<apex:page standardController="RCM_Request__c" >
<head>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
    <Script>
        $('[id$=theForm]').validate();             
              errorclass: "myerrorclass";
        $('[id$=aggrt9]').rules("add",{
            required: true,
            minlength: 2,
            maxlength: 2,                          
            messages:{
                required:"<br/>Required input",
                minlength: jQuery.validator.format("<br/>Please, at least 2 characters are necessary"),
            }                           
        });
            
        function showAggregate(productType){
            if(productType=='Heat Rate with Swing'){
                $('[id$="show"]').show();
                $('[for$="show"]').show();
            }else{
                
                $('[id$="show"]').hide();
                $('[for$="show"]').hide();
            }
        };
        function contractReq(conRequest){
             //alert('Hello');
             //alert(conSupplement);
            if(conRequest=='Aggregate Doc Request'){ 
            
                $('[id$="govn"],[id$="broker"],[id$="form"],[id$="prodType"],[id$="negoLang"],[id$="specMetr"],[id$="rec"],[id$="master"],[id$="aggrt10"],[id$="aggrt11"]').show();
                $('[for$="govn"],[for$="broker"],[for$="form"],[for$="prodType"],[for$="negoLang"],[for$="specMetr"],[for$="rec"],[for$="master"],[for$="aggrt10"],[for$="aggrt11"]').show();
                
                $('[id$="qnumber"],[id$="contractDate"],[id$="priceLoc"],[id$="orgQuote"],[id$="buyQuote"],[id$="repQuote"],[id$="blend12"]').hide();
                $('[for$="qnumber"],[for$="contractDate"],[for$="priceLoc"],[for$="orgQuote"],[for$="buyQuote"],[for$="repQuote"],[for$="blend12"]').hide();
            }
            
            else if(conRequest=='Blend and Extend'){
                
                $('[id$="broker"],[id$="form"],[id$="prodType"],[id$="negoLang"],[id$="specMetr"],[id$="rec"],[id$="orgQuote"],[id$="buyQuote"],[id$="repQuote"],[id$="blend12"]').show();
                $('[for$="broker"],[for$="form"],[for$="prodType"],[for$="negoLang"],[for$="specMetr"],[for$="rec"],[for$="orgQuote"],[for$="buyQuote"],[for$="repQuote"],[for$="blend12"]').show();
                
                $('[id$="qnumber"],[id$="contractDate"],[id$="priceLoc"],[id$="govn"],[id$="show"],[id$="master"],[id$="aggrt10"],[id$="aggrt11"]').hide();
                $('[for$="qnumber"],[for$="contractDate"],[for$="priceLoc"],[for$="govn"],[for$="show"],[for$="master"],[for$="aggrt10"],[for$="aggrt11"]').hide();
            }
            
            else if(conRequest=='Consent to Assignment'){
            
                $('[id$="govn"],[id$="broker"],[id$="orgCustName"],[id$="orgQuote"],[id$="buyQuote"],[id$="repQuote"]').show();
                $('[for$="govn"],[for$="broker"],[for$="orgCustName"],[for$="orgQuote"],[for$="buyQuote"],[for$="repQuote"]').show();
                
                $('[id$="qnumber"],[id$="contractDate"],[id$="priceLoc"],[id$="form"],[id$="prodType"],[id$="negoLang"],[id$="specMetr"],[id$="rec"],[id$="show"],[id$="master"],[id$="aggrt10"],[id$="aggrt11"],[id$="blend12"]').hide();
                $('[for$="qnumber"],[for$="contractDate"],[for$="priceLoc"],[for$="form"],[for$="prodType"],[for$="negoLang"],[for$="specMetr"],[for$="rec"],[for$="show"],[for$="master"],[for$="aggrt10"],[for$="aggrt11"],[for$="blend12"]').hide();
            }
            
            else if(conRequest=='Contract Restructure'){
            
                $('[id$="broker"],[id$="form"],[id$="prodType"],[id$="negoLang"],[id$="specMetr"],[id$="rec"],[id$="orgQuote"],[id$="buyQuote"],[id$="repQuote"]').show(); 
                $('[for$="broker"],[for$="form"],[for$="prodType"],[for$="negoLang"],[for$="specMetr"],[for$="rec"],[for$="orgQuote"],[for$="buyQuote"],[for$="repQuote"]').show();
                
                $('[id$="qnumber"],[id$="contractDate"],[id$="priceLoc"],[id$="govn"],[id$="orgCustName"],[id$="blend12"],[id$="show"],[id$="master"],[id$="aggrt10"],[id$="aggrt11"]').hide();
                $('[for$="qnumber"],[for$="contractDate"],[for$="priceLoc"],[for$="govn"],[for$="orgCustName"],[for$="blend12"],[for$="show"],[for$="master"],[for$="aggrt10"],[for$="aggrt11"]').hide();   
            }
            
            else if(conRequest=='Premise Buyout'){
                
                $('[id$="govn"],[id$="broker"],[id$="form"],[id$="prodType"],[id$="negoLang"],[id$="specMetr"],[id$="rec"],[id$="orgCustName"],[id$="orgQuote"],[id$="buyQuote"],[id$="repQuote"]').show();
                $('[for$="govn"],[for$="broker"],[for$="form"],[for$="prodType"],[for$="negoLang"],[for$="specMetr"],[for$="rec"],[for$="orgCustName"],[for$="orgQuote"],[for$="buyQuote"],[for$="repQuote"]').show();
                
                $('[id$="qnumber"],[id$="contractDate"],[id$="priceLoc"],[id$="blend12"],[id$="show"],[id$="master"],[id$="aggrt10"],[id$="aggrt11"]').hide();
                $('[for$="qnumber"],[for$="contractDate"],[for$="priceLoc"],[for$="blend12"],[for$="show"],[for$="master"],[for$="aggrt10"],[for$="aggrt11"]').hide();   
            }
            else if(conRequest=='RTP Contract Request'){
            
                $('[id$="govn"],[id$="broker"],[id$="qnumber"],[id$="form"],[id$="prodType"],[id$="negoLang"],[id$="specMetr"],[id$="rec"]').show();
                $('[for$="govn"],[for$="broker"],[for$="qnumber"],[for$="form"],[for$="prodType"],[for$="negoLang"],[for$="specMetr"],[for$="rec"]').show();
                
                $('[id$="qnumber"],[id$="contractDate"],[id$="priceLoc"],[id$="blend12"],[id$="show"],[id$="master"],[id$="aggrt10"],[id$="aggrt11"],[id$="orgQuote"],[id$="buyQuote"],[id$="repQuote"],[id$="orgCustName"]').hide();
                $('[for$="qnumber"],[for$="contractDate"],[for$="priceLoc"],[for$="blend12"],[for$="show"],[for$="master"],[for$="aggrt10"],[for$="aggrt11"],[for$="orgQuote"],[for$="buyQuote"],[for$="repQuote"],[for$="orgCustName"]').hide();
            }
            else if(conRequest=='Sample Contract Request'){
                
                $('[id$="govn"],[id$="broker"],[id$="qnumber"],[id$="contractDate"],[id$="form"],[id$="prodType"],[id$="priceLoc"],[id$="negoLang"],[id$="specMetr"],[id$="rec"]').show();
                $('[for$="govn"],[for$="broker"],[for$="qnumber"],[for$="contractDate"],[for$="form"],[for$="prodType"],[for$="priceLoc"],[for$="negoLang"],[for$="specMetr"],[for$="rec"]').show();
                
                $('[id$="blend12"],[id$="show"],[id$="master"],[id$="aggrt10"],[id$="aggrt11"],[id$="orgQuote"],[id$="buyQuote"],[id$="repQuote"],[id$="orgCustName"]').hide();
                $('[for$="blend12"],[for$="show"],[for$="master"],[for$="aggrt10"],[for$="aggrt11"],[for$="orgQuote"],[for$="buyQuote"],[for$="repQuote"],[for$="orgCustName"]').hide();
                
            }
            else if(conRequest=='Standard Contract Request'){
            
                $('[id$="govn"],[id$="broker"],[id$="qnumber"],[id$="form"],[id$="prodType"],[id$="negoLang"],[id$="specMetr"],[id$="rec"]').show();
                $('[for$="govn"],[for$="broker"],[for$="qnumber"],[for$="form"],[for$="prodType"],[for$="negoLang"],[for$="specMetr"],[for$="rec"]').show();
                
                $('[id$="contractDate"],[id$="priceLoc"],[id$="blend12"],[id$="show"],[id$="master"],[id$="aggrt10"],[id$="aggrt11"],[id$="orgQuote"],[id$="buyQuote"],[id$="repQuote"],[id$="orgCustName"]').hide();
                $('[for$="contractDate"],[for$="priceLoc"],[for$="blend12"],[for$="show"],[for$="master"],[for$="aggrt10"],[for$="aggrt11"],[for$="orgQuote"],[for$="buyQuote"],[for$="repQuote"],[for$="orgCustName"]').hide();
            }
            
            else{
                $('[id$="qnumber"],[id$="contractDate"],[id$="priceLoc"],[id$="orgCustName"],[id$="govn"],[id$="broker"],[id$="form"],[id$="prodType"],[id$="negoLang"],[id$="specMetr"],[id$="show"],[id$="rec"],[id$="master"],[id$="aggrt10"],[id$="aggrt11"],[id$="orgQuote"],[id$="buyQuote"],[id$="repQuote"],[id$="blend12"]').hide();
                $('[for$="qnumber"],[for$="contractDate"],[for$="priceLoc"],[for$="orgCustName"],[for$="govn"],[for$="broker"],[for$="form"],[for$="prodType"],[for$="negoLang"],[for$="specMetr"],[for$="show"],[for$="rec"],[for$="master"],[for$="aggrt10"],[for$="aggrt11"],[for$="orgQuote"],[for$="buyQuote"],[for$="repQuote"],[for$="blend12"]').hide();
                
            } 
        } ;
        /*
        function showctype(RequestType){
             //alert('Hello');
             //alert(RequestType);
            if(RequestType==''){
                $('[id$="conType"]').hide();
                $('[for$="conType"]').hide();                
                //$('[id$="oComment"]').show();
                //$('[for$="oComment"]').show();
                
            } 
            else if(RequestType=='Contract Supplements'){
                $('[id$="cType"]').show();
                $('[for$="cType"]').show();
                //$('[id$="oComment"]').show();
                //$('[for$="oComment"]').show();
                
            }
            else if(RequestType=='Contract Request'){
                $('[id$="conType"]').show();
                $('[for$="conType"]').show();
                
                $('[id$="let"],[id$="broker"],[id$="showletter3"],[id$="showletter5"],[id$="orgQuote"],[id$="repQuote"],[id$="priceLoc"]').hide();
                $('[for$="let"],[for$="broker"],[for$="showletter3"],[for$="showletter5"],[for$="orgQuote"],[for$="repQuote"],[for$="priceLoc"]').hide();                
            }
            else if(RequestType=='Letters'){
                $('[id$="let"]').show();
                $('[for$="let"]').show();
                
                $('[id$="conType"],[id$="qnumber"],[id$="contractDate"],[id$="priceLoc"],[id$="orgCustName"],[id$="govn"],[id$="broker"],[id$="form"],[id$="prodType"],[id$="negoLang"],[id$="specMetr"],[id$="show"],[id$="rec"],[id$="master"],[id$="aggrt10"],[id$="aggrt11"],[id$="orgQuote"],[id$="buyQuote"],[id$="repQuote"],[id$="blend12"]').hide();
                $('[for$="conType"],[for$="qnumber"],[for$="contractDate"],[for$="priceLoc"],[for$="orgCustName"],[for$="govn"],[for$="broker"],[for$="form"],[for$="prodType"],[for$="negoLang"],[for$="specMetr"],[for$="show"],[for$="rec"],[for$="master"],[for$="aggrt10"],[for$="aggrt11"],[for$="orgQuote"],[for$="buyQuote"],[for$="repQuote"],[for$="blend12"]').hide();
                                
            }
            else{
                $('[id$="cType"]').hide();
                $('[for$="cType"]').hide();
                //$('[id$="cType"]').hide();
                //$('[for$="cType"]').hide();
            } 
        };
        */
        /*
        function cSupplement(conSupplement){
             //alert('Hello');
             //alert(conSupplement);
            if(conSupplement=='Amendment'){
                $('[id$="qnumber"]').show();
                $('[for$="qnumber"]').show();
               
            }else{
                $('[id$="qnumber"]').hide();
                $('[for$="qnumber"]').hide();
                
            } 
        };
        
        function letter(letters){
             //alert('Hello');
             //alert(conSupplement);
            if(letters=='Conversion Letter'){
                $('[id$="orgQuote"],[id$="letterDate"],[id$="priceLoc"],[id$="broker"],[id$="showletter3"],[id$="showletter5"]').show();
                $('[for$="orgQuote"],[for$="letterDate"],[for$="priceLoc"],[for$="broker"],[for$="showletter3"],[for$="showletter5"]').show();
               
                $('[id$="repQuote"]').hide();
                $('[for$="repQuote"]').hide();
            }
            else if(letters =='Extendable Letter'){
                $('[id$="orgQuote"],[id$="repQuote"]').show();
                $('[for$="orgQuote"],[for$="repQuote"]').show();
                
                $('[id$="broker"],[id$="showletter3"],[id$="showletter5"],[id$="priceLoc"]').hide();
                $('[for$="broker"],[for$="showletter3"],[for$="showletter5"],[for$="priceLoc"]').hide();
                
            }
            else if(letters =='Notice of Legal Demand'){
                $('[id$="orgQuote"]').show();
                $('[for$="orgQuote"]').show();
                
                $('[id$="broker"],[id$="showletter3"],[id$="showletter5"],[id$="repQuote"],[id$="priceLoc"]').hide();
                $('[for$="broker"],[for$="showletter3"],[for$="showletter5"],[for$="repQuote"],[for$="priceLoc"]').hide();
            
            }
            else if(letters =='Security Demand'){
                $('[id$="orgQuote"]').show();
                $('[for$="orgQuote"]').show();
                
                $('[id$="broker"],[id$="showletter3"],[id$="showletter5"],[id$="repQuote"],[id$="priceLoc"]').hide();
                $('[for$="broker"],[for$="showletter3"],[for$="showletter5"],[for$="repQuote"],[for$="priceLoc"]').hide();
                
            
            }
            else if(letters =='Termination Letter'){
                $('[id$="orgQuote"]').show();
                $('[for$="orgQuote"]').show();
                
                $('[id$="broker"],[id$="showletter3"],[id$="showletter5"],[id$="repQuote"],[id$="priceLoc"]').hide();
                $('[for$="broker"],[for$="showletter3"],[for$="showletter5"],[for$="repQuote"],[for$="priceLoc"]').hide();
            
            }
            else{
                $('[id$="letterDate"],[id$="broker"],[id$="showletter3"],[id$="showletter5"],[id$="orgQuote"],[id$="repQuote"],[id$="priceLoc"]').hide();
                $('[for$="letterDate"],[for$="broker"],[for$="showletter3"],[for$="showletter5"],[for$="orgQuote"],[for$="repQuote"],[for$="priceLoc"]').hide();
                
            } 
        }    
    </script>
        
</head>
    
    <apex:form id="theForm">
        <apex:sectionHeader title="RCM Request edit" subtitle="New RCM Request" />
        <apex:pageBlock title="RCM Request Edit" mode="edit">
            
            <apex:pageBlockButtons >
                <apex:commandButton action="{!save}" value="Save" onclick="saveFunction()"/>
                <apex:commandButton action="{!cancel}" value="Cancel"/>
            </apex:pageBlockButtons>
        
            <apex:pageBlockSection title="RCM Request Information" columns="2">
                
                <apex:inputField value="{!RCM_Request__c.Name}" required="true"/>
                <apex:inputField value="{!RCM_Request__c.Channel__c}" rendered="{! If(RCM_Request__c.Account__r.Channels__c != null ,true,false) }"/>
                <apex:inputField value="{!RCM_Request__c.Status__c}"/> 
               <!-- <apex:inputField value="{!RCM_Request__c.Request_Type__c}" required="true" onchange="showctype(this.value)"/>  --> 
                <apex:inputField value="{!RCM_Request__c.Priority__c}"/>     
                <apex:inputField value="{!RCM_Request__c.Case_Current_Owner__c}" rendered="{! If(RCM_Request__c.Case__r.Owner != null ,true,false) }"/>       
                <apex:inputField value="{!RCM_Request__c.Letter__c}" id="let" onchange="letter(this.value)"/>
                <apex:pageBlockSectionItem >
                    <apex:outputLabel > Contract Type</apex:outputLabel>
                    <apex:actionRegion >
                        <apex:inputField value="{!RCM_Request__c.Contract_Type__c}" onchange="contractReq(this.value)">
                        <apex:actionSupport event="onchange" reRender="contractRequired,contractRequired1" />
                        <!--Action support component controls the behavior of the form and adds AJAX support to your actionRegion -->
                        </apex:inputField>
                    </apex:actionRegion>
                </apex:pageBlockSectionItem>
                <apex:inputField value="{!RCM_Request__c.Contract_Supplements__c}" id="cType" onchange="cSupplement(this.value)"/>
            </apex:pageBlockSection>
             
            <apex:pageBlockSection id="contractRequired" title="Account Information" columns="2"> 
                       
                <apex:inputField value="{!RCM_Request__c.Account__c}"/>
                <apex:inputField value="{!RCM_Request__c.Government__c}" id="govn" required="{!IF(RCM_Request__c.Contract_Type__c=='Aggregate Doc Request', true, false)}"/>
                <apex:inputField value="{!RCM_Request__c.Broker__c}" id="broker" required="{!IF(RCM_Request__c.Contract_Type__c=='Aggregate Doc Request', true, false)}"/>
                <apex:outputPanel id="conRes8">
                    <apex:outputField value="{!RCM_Request__c.Other_Language__c}"/>
                </apex:outputPanel>
                
                <!--<apex:inputField value="{!RCM_Request__c.Other_Language__c}" id="Premise9"/>
                    <apex:inputField value="{!RCM_Request__c.Other_Language__c}" id="RTP10"/>             
                    <apex:inputField value="{!RCM_Request__c.Other_Language__c}" id="aggrt8"/> 
                    <apex:inputField value="{!RCM_Request__c.Other_Language__c}" id="sample13"/>
                    <apex:inputField value="{!RCM_Request__c.Other_Language__c}" id="stand10"/>-->
                <apex:inputField value="{!RCM_Request__c.BP_Number__c}" rendered="{! If(RCM_Request__c.Account__r.bpartner__c != null ,true,false) }"/>
                <apex:inputField value="{!RCM_Request__c.Legal_Notice_Address__c}" rendered="{! If(RCM_Request__c.Account__r.Legal_Notice_Address__c != null ,true,false) }"/>
                <apex:inputField value="{!RCM_Request__c.Sales_Exec__c}" rendered="{! If(RCM_Request__c.Account__r.Sales_Exec__c != null ,true,false) }"/>
                <apex:inputField value="{!RCM_Request__c.Additional_Account_Manager__c}" required="false"/> 
                <apex:inputField value="{!RCM_Request__c.Account_Phone_Number__c}" rendered="{! If(RCM_Request__c.Account__r.Account_Phone_Number__c != null ,true,false) }"/>
                <apex:inputField value="{!RCM_Request__c.Sales_Channel__c}" rendered="{! If(RCM_Request__c.Account__r.Sales_Channel__c != null ,true,false) }"/>
            </apex:pageBlockSection>
             
            <apex:pageBlockSection id="contractRequired1" title="Deal Information" columns="2">                           
                <apex:inputField value="{!RCM_Request__c.Quote_Number__c}" id="qnumber"/>
                <apex:inputField value="{!RCM_Request__c.Form__c}" id="form"/>
                <apex:inputField value="{!RCM_Request__c.Product_Type__c}" onchange="showAggregate(this.value)" id="prodType" required="{!IF(RCM_Request__c.Contract_Type__c=='Aggregate Doc Request', true, false)}"/>
                <apex:inputField value="{!RCM_Request__c.Negotiated_Language__c}" id="negoLang" required="{!IF(RCM_Request__c.Contract_Type__c=='Aggregate Doc Request', true, false)}"/>
                <apex:inputField value="{!RCM_Request__c.Special_Meter_Reads__c}" id="specMetr" required="{!IF(RCM_Request__c.Contract_Type__c=='Aggregate Doc Request', true, false)}"/>
                <apex:inputField value="{!RCM_Request__c.REC__c}" id="rec"/>  
                <apex:inputField value="{!RCM_Request__c.Aggregated_Swing__c}" id="show"/>        
                <!--<apex:inputField value="{!RCM_Request__c.VAPS__c}" id="aggrt6"/> 
                    <apex:inputField value="{!RCM_Request__c.VAPS__c}" id="conRes5"/> 
                    <apex:inputField value="{!RCM_Request__c.VAPS__c}" id="Premise6"/>  
                    <apex:inputField value="{!RCM_Request__c.VAPS__c}" id="RTP7"/>
                    <apex:inputField value="{!RCM_Request__c.VAPS__c}" id="sample10"/>
                    <apex:inputField value="{!RCM_Request__c.VAPS__c}" id="stand7"/>                           
                    <apex:inputField value="{!RCM_Request__c.Product_Type__c}" onchange="showAggregate(this.value)">
                </apex:inputField>          
                <div>&nbsp;</div>  -->             
                
            </apex:pageBlockSection>
             
            <apex:pageBlockSection title="Additional Deal Information" columns="2">              
                <!--<div>&nbsp;</div> -->  
                <apex:inputField value="{!RCM_Request__c.Original_Customer_Name__c}" id="orgCustName"/>
                <apex:inputField value="{!RCM_Request__c.Original_Contract_Quote__c}" id="orgQuote"/> 
                <apex:inputField value="{!RCM_Request__c.Buyback_Quote__c}" id="buyQuote"/>
                <apex:inputField value="{!RCM_Request__c.New_Replacement_Quote__c}" id="repQuote"/>
                
                <apex:inputField value="{!RCM_Request__c.Conversion_Lock_Method__c}" id="showletter3"/>               
                <apex:inputField value="{!RCM_Request__c.Conversion_Method__c}" id="showletter5"/>
                <!--
                <div id="letterDate">
                    <apex:inputField value="{!RCM_Request__c.Date_of_conversion_Transaction__c}"/>
                    <apex:inputField value="{!RCM_Request__c.Conversion_Start_Date__c}"/>
                    <apex:inputField value="{!RCM_Request__c.Conversion_End_Date__c}"/> 
                </div> -->
                <apex:inputField value="{!RCM_Request__c.Extension_Quote__c}" id="blend12"/>                              
                <apex:inputField value="{!RCM_Request__c.Master_Doc__c}" id="master"/>             
                <apex:inputField value="{!RCM_Request__c.Child_Account_Names__c}" id="aggrt10"/>  
                <apex:inputField value="{!RCM_Request__c.Child_Quote_Numbers__c}" id="aggrt11"/>
                <apex:inputField value="{!RCM_Request__c.Price_Location__c}" id="priceLoc"/>
                
            </apex:pageBlockSection>
            
            <div id="contractDate">
                <apex:pageBlockSection title="Broker Aggrement Request" columns="2">                             
                    <apex:inputField value="{!RCM_Request__c.Contract_Start__c}"/>
                    <apex:inputField value="{!RCM_Request__c.Contract_End__c}" />
                </apex:pageBlockSection>
            </div>
            <p id="demo"></p>
            <script>
             jQuery.validator.setDefaults({
                  debug: true,
                  success: "valid"
                });
                $( "#theform" ).validate({
                  rules: {
                    gender: {
                      required: true
                    }
                  }
                });
            </script>
            <script>
                var RequestType='{!RCM_Request__c.Request_Type__c}';
                //alert('hi');
                //alert(RequestType);
                if(RequestType=='Letters'){
                    $('[id$="let"]').show();
                    $('[for$="let"]').show();
                    $('[id$="oComment"]').show();
                    $('[for$="oComment"]').show();
                }else{
                    
                    $('[id$="let"]').hide();
                    $('[for$="let"]').hide();
                    $('[id$="oComment"]').hide();
                    $('[for$="oComment"]').hide();
                } 
                
            </script>
            
            
            
            <script>
                var lettr ='{!RCM_Request__c.Letter__c}';
                //alert('hi');
                //alert(conSupplement);
                if(lettr=='Conversion Letter'){
                    $('[id$="orgQuote"],[id$="letterDate"],[id$="priceLoc"],[id$="broker"],[id$="showletter3"],[id$="showletter5"]').show();
                    $('[for$="orgQuote"],[for$="letterDate"],[for$="priceLoc"],[for$="broker"],[for$="showletter3"],[for$="showletter5"]').show();
                   
                    $('[id$="repQuote"]').hide();
                    $('[for$="repQuote"]').hide();
                }
                else if(lettr =='Extendable Letter'){
                    $('[id$="orgQuote"],[id$="repQuote"]').show();
                    $('[for$="orgQuote"],[for$="repQuote"]').show();
                    
                    $('[id$="broker"],[id$="showletter3"],[id$="showletter5"],[id$="priceLoc"]').hide();
                    $('[for$="broker"],[for$="showletter3"],[for$="showletter5"],[for$="priceLoc"]').hide();
                    
                }
                else if(lettr =='Notice of Legal Demand'){
                    $('[id$="orgQuote"]').show();
                    $('[for$="orgQuote"]').show();
                    
                    $('[id$="broker"],[id$="showletter3"],[id$="showletter5"],[id$="repQuote"],[id$="priceLoc"]').hide();
                    $('[for$="broker"],[for$="showletter3"],[for$="showletter5"],[for$="repQuote"],[for$="priceLoc"]').hide();
                
                }
                else if(lettr =='Security Demand'){
                    $('[id$="orgQuote"]').show();
                    $('[for$="orgQuote"]').show();
                    
                    $('[id$="broker"],[id$="showletter3"],[id$="showletter5"],[id$="repQuote"],[id$="priceLoc"]').hide();
                    $('[for$="broker"],[for$="showletter3"],[for$="showletter5"],[for$="repQuote"],[for$="priceLoc"]').hide();
                    
                
                }
                else if(lettr =='Termination Letter'){
                    $('[id$="orgQuote"]').show();
                    $('[for$="orgQuote"]').show();
                    
                    $('[id$="broker"],[id$="showletter3"],[id$="showletter5"],[id$="repQuote"],[id$="priceLoc"]').hide();
                    $('[for$="broker"],[for$="showletter3"],[for$="showletter5"],[for$="repQuote"],[for$="priceLoc"]').hide();
                
                }
                else{
                    $('[id$="letterDate"],[id$="broker"],[id$="showletter3"],[id$="showletter5"],[id$="orgQuote"],[id$="repQuote"],[id$="priceLoc"]').hide();
                    $('[for$="letterDate"],[for$="broker"],[for$="showletter3"],[for$="showletter5"],[for$="orgQuote"],[for$="repQuote"],[for$="priceLoc"]').hide();
                    
                } 
    
            </script>
            <!--
            <script>
                   var RequestType='{!RCM_Request__c.Request_Type__c}';
                   //alert('hi');
                   //alert(RequestType);
                if(RequestType=='Contract Request'){
                    $('[id$="conType"]').show();
                    $('[for$="conType"]').show();
                    $('[id$="oComment"]').show();
                    $('[for$="oComment"]').show();
                }else{
                    
                    $('[id$="conType"]').hide();
                    $('[for$="conType"]').hide();
                    $('[id$="oComment"]').hide();
                    $('[for$="oComment"]').hide();
                } 
                
            </script>
            -->
            <script>
                var conRequest='{!RCM_Request__c.Contract_Type__c}';
                
                if(conRequest=='Aggregate Doc Request'){
                    $('[id$="govn"],[id$="broker"],[id$="form"],[id$="prodType"],[id$="negoLang"],[id$="specMetr"],[id$="show"],[id$="rec"],[id$="master"],[id$="aggrt10"],[id$="aggrt11"]').show();
                    $('[for$="govn"],[for$="broker"],[for$="form"],[for$="prodType"],[for$="negoLang"],[for$="specMetr"],[for$="show"],[for$="rec"],[for$="master"],[for$="aggrt10"],[for$="aggrt11"]').show();
                    
                    $('[id$="orgQuote"],[id$="buyQuote"],[id$="repQuote"],[id$="blend12"]').hide();
                    $('[for$="orgQuote"],[for$="buyQuote"],[for$="repQuote"],[for$="blend12"]').hide();               
                 }
                else if(conRequest=='Blend and Extend'){
                    $('[id$="broker"],[id$="form"],[id$="prodType"],[id$="negoLang"],[id$="specMetr"],[id$="rec"],[id$="orgQuote"],[id$="buyQuote"],[id$="repQuote"],[id$="blend12"]').show();
                    $('[for$="broker"],[for$="form"],[for$="prodType"],[for$="negoLang"],[for$="specMetr"],[for$="rec"],[for$="orgQuote"],[for$="buyQuote"],[for$="repQuote"],[for$="blend12"]').show();
                    
                    $('[id$="govn"],[id$="show"],[id$="master"],[id$="aggrt10"],[id$="aggrt11"]').hide();
                    $('[for$="govn"],[for$="show"],[for$="master"],[for$="aggrt10"],[for$="aggrt11"]').hide();    
                }
                else if(conRequest=='Consent to Assignment'){
            
                    $('[id$="govn"],[id$="broker"],[id$="orgCustName"],[id$="orgQuote"],[id$="buyQuote"],[id$="repQuote"]').show();
                    $('[for$="govn"],[for$="broker"],[for$="orgCustName"],[for$="orgQuote"],[for$="buyQuote"],[for$="repQuote"]').show();
                    
                    $('[id$="qnumber"],[id$="contractDate"],[id$="priceLoc"],[id$="form"],[id$="prodType"],[id$="negoLang"],[id$="specMetr"],[id$="rec"],[id$="show"],[id$="master"],[id$="aggrt10"],[id$="aggrt11"],[id$="blend12"]').hide();
                    $('[for$="qnumber"],[for$="contractDate"],[for$="priceLoc"],[for$="form"],[for$="prodType"],[for$="negoLang"],[for$="specMetr"],[for$="rec"],[for$="show"],[for$="master"],[for$="aggrt10"],[for$="aggrt11"],[for$="blend12"]').hide();
                }
                
                else if(conRequest=='Contract Restructure'){
                
                    $('[id$="broker"],[id$="form"],[id$="prodType"],[id$="negoLang"],[id$="specMetr"],[id$="rec"],[id$="orgQuote"],[id$="buyQuote"],[id$="repQuote"]').show(); 
                    $('[for$="broker"],[for$="form"],[for$="prodType"],[for$="negoLang"],[for$="specMetr"],[for$="rec"],[for$="orgQuote"],[for$="buyQuote"],[for$="repQuote"]').show();
                    
                    $('[id$="qnumber"],[id$="contractDate"],[id$="priceLoc"],[id$="govn"],[id$="orgCustName"],[id$="blend12"],[id$="show"],[id$="master"],[id$="aggrt10"],[id$="aggrt11"]').hide();
                    $('[for$="qnumber"],[for$="contractDate"],[for$="priceLoc"],[for$="govn"],[for$="orgCustName"],[for$="blend12"],[for$="show"],[for$="master"],[for$="aggrt10"],[for$="aggrt11"]').hide();   
                }
                
                else if(conRequest=='Premise Buyout'){
                    
                    $('[id$="govn"],[id$="broker"],[id$="form"],[id$="prodType"],[id$="negoLang"],[id$="specMetr"],[id$="rec"],[id$="orgCustName"],[id$="orgQuote"],[id$="buyQuote"],[id$="repQuote"]').show();
                    $('[for$="govn"],[for$="broker"],[for$="form"],[for$="prodType"],[for$="negoLang"],[for$="specMetr"],[for$="rec"],[for$="orgCustName"],[for$="orgQuote"],[for$="buyQuote"],[for$="repQuote"]').show();
                    
                    $('[id$="qnumber"],[id$="contractDate"],[id$="priceLoc"],[id$="blend12"],[id$="show"],[id$="master"],[id$="aggrt10"],[id$="aggrt11"]').hide();
                    $('[for$="qnumber"],[for$="contractDate"],[for$="priceLoc"],[for$="blend12"],[for$="show"],[for$="master"],[for$="aggrt10"],[for$="aggrt11"]').hide();   
                }
                else if(conRequest=='RTP Contract Request'){
                
                    $('[id$="govn"],[id$="broker"],[id$="qnumber"],[id$="form"],[id$="prodType"],[id$="negoLang"],[id$="specMetr"],[id$="rec"]').show();
                    $('[for$="govn"],[for$="broker"],[for$="qnumber"],[for$="form"],[for$="prodType"],[for$="negoLang"],[for$="specMetr"],[for$="rec"]').show();
                    
                    $('[id$="qnumber"],[id$="contractDate"],[id$="priceLoc"],[id$="blend12"],[id$="show"],[id$="master"],[id$="aggrt10"],[id$="aggrt11"],[id$="orgQuote"],[id$="buyQuote"],[id$="repQuote"],[id$="orgCustName"]').hide();
                    $('[for$="qnumber"],[for$="contractDate"],[for$="priceLoc"],[for$="blend12"],[for$="show"],[for$="master"],[for$="aggrt10"],[for$="aggrt11"],[for$="orgQuote"],[for$="buyQuote"],[for$="repQuote"],[for$="orgCustName"]').hide();
                }
                else if(conRequest=='Sample Contract Request'){
                    
                    $('[id$="govn"],[id$="broker"],[id$="qnumber"],[id$="contractDate"],[id$="form"],[id$="prodType"],[id$="priceLoc"],[id$="negoLang"],[id$="specMetr"],[id$="rec"]').show();
                    $('[for$="govn"],[for$="broker"],[for$="qnumber"],[for$="contractDate"],[for$="form"],[for$="prodType"],[for$="priceLoc"],[for$="negoLang"],[for$="specMetr"],[for$="rec"]').show();
                    
                    $('[id$="blend12"],[id$="show"],[id$="master"],[id$="aggrt10"],[id$="aggrt11"],[id$="orgQuote"],[id$="buyQuote"],[id$="repQuote"],[id$="orgCustName"]').hide();
                    $('[for$="blend12"],[for$="show"],[for$="master"],[for$="aggrt10"],[for$="aggrt11"],[for$="orgQuote"],[for$="buyQuote"],[for$="repQuote"],[for$="orgCustName"]').hide();
                    
                }
                else if(conRequest=='Standard Contract Request'){
                
                    $('[id$="govn"],[id$="broker"],[id$="qnumber"],[id$="form"],[id$="prodType"],[id$="negoLang"],[id$="specMetr"],[id$="rec"]').show();
                    $('[for$="govn"],[for$="broker"],[for$="qnumber"],[for$="form"],[for$="prodType"],[for$="negoLang"],[for$="specMetr"],[for$="rec"]').show();
                    
                    $('[id$="contractDate"],[id$="priceLoc"],[id$="blend12"],[id$="show"],[id$="master"],[id$="aggrt10"],[id$="aggrt11"],[id$="orgQuote"],[id$="buyQuote"],[id$="repQuote"],[id$="orgCustName"]').hide();
                    $('[for$="contractDate"],[for$="priceLoc"],[for$="blend12"],[for$="show"],[for$="master"],[for$="aggrt10"],[for$="aggrt11"],[for$="orgQuote"],[for$="buyQuote"],[for$="repQuote"],[for$="orgCustName"]').hide();
                }
                
                else{
                    $('[id$="qnumber"],[id$="contractDate"],[id$="priceLoc"],[id$="orgCustName"],[id$="govn"],[id$="broker"],[id$="form"],[id$="prodType"],[id$="negoLang"],[id$="specMetr"],[id$="show"],[id$="rec"],[id$="master"],[id$="aggrt10"],[id$="aggrt11"],[id$="orgQuote"],[id$="buyQuote"],[id$="repQuote"],[id$="blend12"]').hide();
                    $('[for$="qnumber"],[for$="contractDate"],[for$="priceLoc"],[for$="orgCustName"],[for$="govn"],[for$="broker"],[for$="form"],[for$="prodType"],[for$="negoLang"],[for$="specMetr"],[for$="show"],[for$="rec"],[for$="master"],[for$="aggrt10"],[for$="aggrt11"],[for$="orgQuote"],[for$="buyQuote"],[for$="repQuote"],[for$="blend12"]').hide();
                    
                } 
            </script> 
            
            
            <script>
                var productType='{!RCM_Request__c.Product_Type__c}';
                if(productType=='Heat Rate with Swing'){
                    $('[id$="show"]').show();
                    $('[for$="show"]').show();
                }else{
                    
                    $('[id$="show"]').hide();
                    $('[for$="show"]').hide();
                } 
            </script>  
            
            <script>
                   var RequestType='{!RCM_Request__c.Request_Type__c}';
                   //alert('hi');
                   //alert(RequestType);
                if(RequestType=='Contract Supplements'){
                    $('[id$="cType"]').show();
                    $('[for$="cType"]').show();
                    $('[id$="oComment"]').show();
                    $('[for$="oComment"]').show();
                }else{
                    
                    $('[id$="cType"]').hide();
                    $('[for$="cType"]').hide();
                    $('[id$="oComment"]').hide();
                    $('[for$="oComment"]').hide();
                } 
                
            </script> 
        </apex:pageBlock>
        
        
    </apex:form>
</apex:page>
*/

}