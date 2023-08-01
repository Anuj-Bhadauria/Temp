({
	Onsearch: function(component) {
        // Search term
        var term = component.get("v.term");
        console.log('term ==>'+term);
         var action = component.get('c.fetchRelatedList');
         action.setParams({
            "filterString" : term
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log('Response === '+JSON.stringify(response.getReturnValue()));
            if (state === "SUCCESS"){
                component.set("v.RelatedList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    
    handleListClick : function(component,event, listName, selectedListName, selectedItemName ){
        var id = event.currentTarget.id;
        var items = component.get(listName);
        
        var itemOriginal = component.get(selectedItemName);
        
        var item = this.getItem(id,items);
        //items = this.removeStyles(items);
        items = this.removeSelection(items);
        
        if (event.shiftKey && itemOriginal) {
            //make a selection from one to the next!
            var start = item.sort < itemOriginal.sort ? item.sort : itemOriginal.sort;
            var end = item.sort > itemOriginal.sort ? item.sort : itemOriginal.sort;
            
            var subset = this.getItems(start,end,items);
            
            //subset = this.addStyles(subset,' select-focus ');
            subset = this.addSelection(subset);
            component.set(selectedListName,subset);
            component.set(selectedItemName,'');
        }
        else {
            this.addSelection([item]);
            component.set(selectedItemName,item);
            component.set(selectedListName,[item]);
        }
        
        component.set(listName,items);
        
    },
    
    setInfoText: function(component, labels) {
    
    if (labels.length == 0) {
      component.set("v.infoText", "Select an option...");
    }
    if (labels.length == 1) {
      component.set("v.infoText", labels[0]);
    }
    else if (labels.length > 1) {
      component.set("v.infoText", labels.length + " options selected");
    }
  },
    despatchSelectChangeEvent: function(component,values){
    var compEvent = component.getEvent("selectChange");
    compEvent.setParams({ "values": values });
    compEvent.fire();
  }
})