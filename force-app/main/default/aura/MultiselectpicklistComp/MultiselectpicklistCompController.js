({
	initialize : function(component, event, helper) {
        helper.init( component, helper );
	},
    handleChange : function(component, event, helper) {
		helper.handleChange( component  );
	},
    cancel : function(component, event, helper) {
		helper.reset( component, helper );
	},
    save : function(component, event, helper) {
		helper.save( component, helper  );
	}
})