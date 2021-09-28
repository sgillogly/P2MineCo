({
	TheController : function(component, int, string) 
    {
		component.set("v.viewDescription", "" );
        
        component.set("v.viewDescription1", "" );
        
        component.set("v.viewDescription2", "" );
        
        component.set("v.viewDescription3", "" );
        
        component.set("v.viewDescription4", "" );
        
        component.set(int, string);
        
        let ProductDescription = $A.get("e.force:TheController");
    	let recid, rectype, RecTypeID;
    	rectype = component.currentTarget;
    	//RecTypeID = rectype.get("v.name");
        
        
	}
})