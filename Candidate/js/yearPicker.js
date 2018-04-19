$(document).ready(function () {
    var years = []
    var currYear = new Date().getFullYear()+8;
    var dropdown = $(".yearPicker");
    years[0] ="";
    for (i = 1; i < 101; i++) {

        years[i] = currYear + 1 - i;
        
    }
    dropdown.each(function () {
        var selecteD = dropdown.attr('selectedYear');
        var par = this.parentNode;      
        if (par.className === "w") {
            var yearSelector = par.childNodes[1];
            var selectedYear = par.firstChild.value;
            for (a = 0; a < 101; a++) {
                var setSelected = false;
                if (selectedYear == years[a]) {
                    setSelected = true;
                };
                this[a] = new Option(years[a], years[a], setSelected, setSelected);
            };
        } else {
            for (a = 0; a < 101; a++) {
                this[a] = new Option(years[a], years[a]);
            }
        }
        

    });

});
