/* Password strength indicator */
function passwordStrength(password,email) {

	var desc = [{'width':'0px'}, {'width':'20%'}, {'width':'40%'}, {'width':'60%'}, {'width':'80%'}, {'width':'100%'}];
	
	var descClass = ['', 'progress-bar-danger', 'progress-bar-danger', 'progress-bar-warning', 'progress-bar-success', 'progress-bar-success'];

	var score = 0;
    var slicedEmail = email.split("@",1);
    var username = slicedEmail.toString();
	//if password less than 6 give 0 point
	if (password.length < 6 ) 
	{score = 0}else{
	//if password === username  give 1 point
	if ( username === password) score = 1;
	//if password has lower or uppercase characters give 2 points	
	if ((password.match(/[a-z]/)) || (password.match(/[A-Z]/))) score = 2;
	//if password has both lower and uppercase characters give 3 points	
	if ((password.match(/[a-z]/)) && (password.match(/[A-Z]/))) score = 3;
	//if password has at least one number give 5 point
	if (password.match(/\d+/)) {
	    score = 5;
	}
	//if password has at least one special characther give 1 point
	if ( password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/) )	score++;

	console.log(score);
	// display indicator
	if(score >= 4){
		$("#jak_pstrength").removeClass(descClass[1]);
	    $("#jak_pstrength").removeClass(descClass[3]).addClass(descClass[score]).css(desc[score]);
	}else{
	    $("#jak_pstrength").removeClass(descClass[score-1]).addClass(descClass[score]).css(desc[score]);
	}
	}
}