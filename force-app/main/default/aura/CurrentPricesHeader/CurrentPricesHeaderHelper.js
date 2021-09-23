({
    convertMapToLists : function(component, metalsMap) {
        var metalList = [];
        var priceList = [];
        
        for (var metal in metalsMap) {//<metal, <date, price>>
            var date = Object.keys(metalsMap[metal])[0];//only one date/price pair per metal, grabbing it here
            var formatter = new Intl.NumberFormat('en-US', {style: 'currency', currency: 'USD',});
            var price = formatter.format(metalsMap[metal][date]);//currency format
                             
            metalList.push(metal + ": ");//metal key, date is ignored
            priceList.push(price + " /ton");
        }
        component.set("v.metals", metalList);
        component.set("v.prices", priceList);
    },
    
    nextEntry : function(component) {
        this.updateContent(component);
        this.waitingTimeId = setTimeout($A.getCallback(() => this.nextEntry(component)), 4000);
    },
    
    updateContent : function(component) {
        var count = component.get("v.current") + 1;
        var listSize = component.get("v.metals").length;
        
        if (count >= listSize) {
            count = count - listSize;
        }
        component.set("v.current", count);
        
        component.set("v.key", component.get("v.metals")[count]);
        component.set("v.value", component.get("v.prices")[count]);
    },
})