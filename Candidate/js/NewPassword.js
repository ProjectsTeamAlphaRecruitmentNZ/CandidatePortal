var strength = {
   0: "Very weak ",
   1: "Weak",
   2: "Medium",
   3: "Strong",
   4: "Very Strong"
 }

 var email = document.getElementById('user_email');
 var password = document.getElementById('user_password');
 var meter = document.getElementById('password-strength-meter');
 var text = document.getElementById('password-strength-text');
 var password_confirm = document.getElementById('user_password_confirm'); 
 
 var checkEmail = 0;
 var checkPassword = 0;
 
 password.addEventListener('input', function() {
   
   var mail = email.value;
   if (mail ==="" || mail ==null) return alert("Please fill out an email field first.")
   
   var val = password.value;
   var result = passwordStrength(val, mail);

    
   // Update the password strength meter
	  
   // Update the text indicator
   if (val !== "") {
     text.innerHTML = "" + strength[result.score];
   } else {
     text.innerHTML = "";
   } 
   var strengthPoints = parseInt(result.score);
   if(result.score < 2){
       password.setAttribute("style", 'background: #fff url("img/sign-cross.JPG") no-repeat; background-position: right 10px  center;');   
       password.setAttribute("onmouseover", "nhpup.popup('Password must be at least 6 symbols.');");
   }else{
       password.setAttribute("style", 'background: #fff url("img/success.png") no-repeat; background-position: right 10px  center;');
   }
   });
 password_confirm.addEventListener('input', function() {
   var original = password.value;
   var val = password_confirm.value;

 //Add Success or cross sign on password match check
    if (original !== val) {
        password_confirm.setAttribute("style", 'background: #fff url("img/sign-cross.JPG") no-repeat; background-position: right 10px  center;');   
        password_confirm.setAttribute("onmouseover", "nhpup.popup('Passwords do not match.');");
        checkPassword = 0;
    }else{
        password_confirm.setAttribute("style", 'background: #fff url("img/success.png") no-repeat; background-position: right 10px  center;');
        checkPassword = 1;
    }
 });

email.addEventListener('input', function(){
    var mail = email.value;
    var checked = ValidateEmail();
    if (checked) {
                email.setAttribute("style", 'background: #fff url("img/success.png") no-repeat; background-position: right 10px  center;');
                checkEmail = 1;
            }else{
            email.setAttribute("style", 'background: #fff url("img/sign-cross.JPG") no-repeat; background-position: right 10px  center;');   
            email.setAttribute("onmouseover", "nhpup.popup('Incorrect email.');");
            checkEmail = 0;
        }
});
function popUpIncorrect(){
        console.log("wwwww");
}

$('.resset-btn').on("click",function(){
    if(checkEmail === 0 || checkPassword === 0) {
        if(checkEmail === 0 ) return alert("Email field is incorrect. Please point your mouse to email field for more information.");        
        if(checkPassword === 0 ) return alert("Password field is incorrect. Please point your mouse to password field for more information.");
        return alert("Email and password fields are incorrect. Please point your mouse to email and password fields for more information.");
    }
});

function echeck(){
		var at="@"
		var dot="."
		var str =  email.value
		var lat=str.indexOf(at)
		var lstr=str.length
		var ldot=str.indexOf(dot)
		var afgterDot2 = ldot + 3
		if (str.indexOf(at)==-1){
		   return false
		}
		if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
		   return false
		}
		if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr || lstr < afgterDot2){
		    return false
		}
		 if (str.indexOf(at,(lat+1))!=-1){
		    return false
		 }
		 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
		    return false
		 }
		 if (str.indexOf(dot,(lat+2))==-1){
		    return false
		 }
		 if (str.indexOf(" ")!=-1){
		    return false
		 }
 		 return true					
	}

function ValidateEmail(){
	
	if ((email.value==null)||(email.value=="")){
		return false
	}
	if (echeck(email.value)==false){
		return false
	}
	return true
} 



