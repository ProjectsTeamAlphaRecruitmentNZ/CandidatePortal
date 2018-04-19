 $("#ProfileTimesheets").addClass("active");   
   
/*----------------------------------------------------
PRINT TIMESHEET
----------------------------------------------------*/   
   
    document.getElementById("myButton").onclick = function () {
        location.href = "Profile - Timesheets.aspx";
    };
    
     function PrintDiv() {
        $('.hide-print').hide();
        var contents = document.getElementById("dvContents").innerHTML;
        var frame1 = document.createElement('iframe');
        frame1.name = "frame1";
        frame1.style.position = "absolute";
        frame1.style.top = "-1000000px";
        document.body.appendChild(frame1);
        var frameDoc = frame1.contentWindow ? frame1.contentWindow : frame1.contentDocument.document ? frame1.contentDocument.document : frame1.contentDocument;
        $('.hide-print').show();
        frameDoc.document.open();
        frameDoc.document.write('<html><head><title>Timesheet</title>');
        frameDoc.document.write('</head><body>');
        frameDoc.document.write(contents);
        frameDoc.document.write('</body></html>');
        frameDoc.document.close();
        
        setTimeout(function () {
            window.frames["frame1"].focus();
            window.frames["frame1"].print();
            document.body.removeChild(frame1);
        }, 500);
        return false;
    }
    
    
    
            $('a:contains("Approved by Client")').text('Confirmed').addClass('black-text');
        $('a:contains("Submitted by Temp")').text('Submitted').addClass('grey-text');
        $('.timesheet-t a').addClass('bold-text');
        
        /* Timesheet details MOBILE */
        if ($(window).width() <600) {
            $('.img-show-more--mobile').show();$('.col1').hide();$('.col2').hide();$('.col3').hide();$('.col4').hide();$('.col5').hide();
            $('.click-to-show').on("click", function(){
              var $clicktoshow = $(this);
               $col1 = $(".col1", $clicktoshow);
               $col2 = $(".col2", $clicktoshow);
               $col3 = $(".col3", $clicktoshow);
               $col4 = $(".col4", $clicktoshow);
               $col5 = $(".col5", $clicktoshow);
               $col1.slideToggle();$col2.slideToggle();$col3.slideToggle();$col4.slideToggle();$col5.slideToggle();
               $(this).find('img').toggle();
            });
        }
    
    