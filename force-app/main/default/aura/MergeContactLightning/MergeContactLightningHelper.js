({
    checkBoxes : function(component, event, helper) {
        var checkvalue = component.find("checkbox"); 
        //alert('chk len-->'+checkvalue.length);
        var index;
        var selrows=component.get('v.selectedRow');
        // alert('sel len-->'+selrows.length);
        if(selrows.length>0)
        {
            for(var i=0;i<selrows.length;i++)
            {
                //alert('sell-->'+selrows[i]);
                for (var j= 0; j < checkvalue.length; j++) {                   
                    if(checkvalue[j].get("v.text")==selrows[i])
                    {
                       // if (checkvalue[i].get("v.value") == false) {
                            //alert('chckval-->'+checkvalue[j].get("v.text"));
                            // index=i;
                            checkvalue[j].set("v.value",true);
                        //}
                    }
                }
            }
        }
    }
})