({
    init : function( component, helper ) {
        
        // Get values for checkbox and picklist
        var action = component.get( "c.getPicklistCheckboxValues" );
        action.setParams({ 
            sObjectName           : component.get( "v.sObjectName"       ), 
            fieldNameForCheckbox  : component.get( "v.fieldNameCheckbox" ),
            fieldNameForPicklist  : component.get( "v.fieldNamePicklist" ),
            recordId              : component.get( "v.recordId"          )
        });
        
        action.setCallback( this, function( response ) {
            
            let state = response.getState();

            if ( state === "SUCCESS" ) {

                let returnValue     = response.getReturnValue();
                
                // Checkbox - with options sorted by their length
                let checkbox        = returnValue.checkbox;
                let checkboxOptions = helper.sortByKey( checkbox.pickListOptionsList, "label" );
                let checkboxValues  = checkbox.pickListSelectedValuesList;
                component.set( "v.checkboxOptions", checkboxOptions );
                component.set( "v.checkboxValues",  checkboxValues  );               

                // Picklist
                let pickListValues  = returnValue.picklist;
                let listOptions     = pickListValues.pickListOptionsList; 
                let defaultOptions  = pickListValues.pickListSelectedValuesList; 
                component.set( "v.defaultOptions" , defaultOptions );
                component.set( "v.listOptions",     listOptions    ); 
                
                console.log( JSON.stringify( pickListValues.pickListSelectedValuesList ));
                
                // Save selected checkbox and picklist field values in local storage
                window.localStorage.setItem( "checkboxValues",  JSON.stringify( checkboxValues ));
                window.localStorage.setItem( "defaultOptions",  JSON.stringify( defaultOptions ));
                
                if( defaultOptions == '' || checkboxValues == '' ){
                    
                    // Warning Toast if checkbox/picklist field is blank
                    helper.raiseToast( 'warning',
                                       $A.get( "ProductBrandNotPopulated" ), 
                                       $A.get( "SelectOnePickListElement" ) );
                }
            }
            else{
                let error        = response.getError();
                let errorMessage = error[0].message;
                component.set( "v.errorMessage", errorMessage );
            }
            
            // render component when values are loaded.
            component.set( "v.isLoaded", true );
        });
        $A.enqueueAction(action);
        
    },
    
    handleChange : function( component ) {
        
        // on changing value of checkbox/picklist enable button
        component.set( "v.isDisabled", false );
        component.set( "v.errorMessage" , '' );
        
    },
    
    reset : function( component, helper ) {
        
        // get default values of checkbox and picklist fields from local storage
        var defaultOptions  = JSON.parse( window.localStorage.getItem( "defaultOptions"  ));
        var checkboxValues  = JSON.parse( window.localStorage.getItem( "checkboxValues"  ));
        
        component.set( "v.defaultOptions",  defaultOptions  ); 
        component.set( "v.checkboxValues",  checkboxValues  ); 
        component.set( "v.isDisabled",      true            );
        
    },
    
    save : function( component, helper ) {
        // disable save button after first click
        component.set( "v.isDisabled", true );
        
        // fieldname
        var checkboxFieldname   = component.get( "v.fieldNameCheckbox" );
        var picklistFieldname   = component.get( "v.fieldNamePicklist" );
        var defaultOptions      = component.get( "v.defaultOptions"    );
        var checkboxValues      = component.get( "v.checkboxValues"    );
        
        // throw error message if no value of checkbox/picklist is selected
        if( checkboxValues == '' || defaultOptions == '' ){
            component.set( "v.errorMessage", $A.get( "SelectOnePickListElement" ) );
            return;
        }
        
        // create JSON of selected checkbox, picklist values with record id
        var sObjectJson                 = { "Id" : component.get( "v.recordId" ) };
        sObjectJson[checkboxFieldname]  = checkboxValues.join( ";" );
        sObjectJson[picklistFieldname]  = defaultOptions.join( ";" );
        
        // apex update method
        var action = component.get( "c.saveToSobject" );
        action.setParams({ 
            objectToUpdate    : sObjectJson,
            checkboxFieldname : checkboxFieldname,
            picklistFieldname : picklistFieldname
        });
        
        action.setCallback( this, function( response ) {
            
            let state   = response.getState();
            let type;
            let title;
            let message;
            
            if ( state === "SUCCESS" ) {
                
                // set toast params for successful update
                type    = 'success';
                title   = $A.get( "success" );
                message = $A.get( "SuccessfulUpdate" );
                
                // update the default value of checkbox/picklist field in local storage
                window.localStorage.setItem( "defaultOptions", JSON.stringify( defaultOptions ));
                window.localStorage.setItem( "checkboxValues", JSON.stringify( checkboxValues ));

            } else {

                type        = 'error';
                title       = $A.get( "FailedUpdate" );
                let error   = response.getError();
                message     = error[0].message;
            }
            
            // Method that raise Toast
            helper.raiseToast( type, title, message );
            
            // If successful update, refresh record view
            if( type == 'success' ){
                $A.get('e.force:refreshView').fire();
            }
           
        });
        $A.enqueueAction(action);
    },  
    
    raiseToast : function( type, title, message ){
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "type"      : type,
            "mode"      : "dismissible",
            "title"     : title,
            "message"   : message
        });
        toastEvent.fire();
    },
    
    sortByKey : function( array, key ) {
        return array.sort( function( a, b ) {
            var x = a[key]; 
            var y = b[key];
            return ( ( x.length < y.length ) ? -1 : ( ( x.length > y.length ) ? 1 : 0 ) );
        });
    }
})