    // create the module and name it scotchApp    
    var scotchApp = angular.module('RoutingApp', ['ngRoute']);  
      
    // configure our routes    
    scotchApp.config(function($routeProvider) {  
        $routeProvider  
      
        // route for the details page    
            .when('/', {  
            templateUrl: 'pages/payment-declaration.html',  
            controller: 'mainController'  
        })  
      
        // route for criminal-conviction-history page    
        	.when('/criminal-conviction-history', {  
            templateUrl: 'pages/criminal-conviction-history.html',  
            controller: 'criminal-conviction-historyController'  
        })
		
		 // route for availability page    
        	.when('/availability', {  
            templateUrl: 'pages/availability.html',  
            controller: 'availabilityController'  
        })
		
		// route for leave page    
        	.when('/leave', {  
            templateUrl: 'pages/leave.html',  
            controller: 'leaveController'  
        })
		
		// route for expenses page    
        	.when('/expenses', {  
            templateUrl: 'pages/expenses.html',  
            controller: 'expensesController'  
        })
		
		// route for health-and-safety and expenses page    
        	.when('/health-and-safety', {  
            templateUrl: 'pages/health-and-safety.html',  
            controller: 'health-and-safetyController'  
        });
		
	
    });  
      
    // create the controller and inject Angular's $scope    
    scotchApp.controller('mainController', function($scope) {  
        // create a message to display in our view    
        $scope.HomeMessage = 'Home Controller Called !!!';  
    });  
      
    scotchApp.controller('criminal-conviction-historyController', function($scope) {  
        $scope.CriminalMessage = 'criminal-conviction-history Controller Called !!!';  
    });  
      
    scotchApp.controller('contactController', function($scope) {  
        $scope.ContactMessage = 'Contact Controller Called !!!';  
    });  

 	scotchApp.controller('availabilityController', function($scope) {  
        $scope.AvailabilityMessage = 'availability Controller Called !!!';  
    }); 

	scotchApp.controller('leaveController', function($scope) {  
        $scope.LeaveMessage = 'leave Controller Called !!!';  
    }); 

	scotchApp.controller('expensesController', function($scope) {  
        $scope.ExpensesMessage = 'expenses Controller Called !!!';  
    }); 

	scotchApp.controller('health-and-safetyController', function($scope) {  
        $scope.HealthAndSafetyMessage = 'health-and-safety Controller Called !!!';  
    }); 

	scotchApp.controller('documentsController', function($scope) {  
        $scope.documentsMessage = 'documents Controller Called !!!';  
    }); 

	function HeaderController($scope, $location) { 
		$scope.isActive = function (viewLocation) { 
			return viewLocation === $location.path();
		};
	}


	   
	   
	   
	   
	   
	   
	     
	   
	   
















angular.module('RoutingApp').controller('payment-declarationController', ['$scope', function ($scope){

   $scope.load = function() {
 $('#signature').jSignature();
var $sigdiv = $('#signature');
var datapair = $sigdiv.jSignature('getData', 'svgbase64');

$('#signature').bind('change', function(e) {
	var data = $('#signature').jSignature('getData');
	$("#signature_capture").val(data);	
});
	 
$('#save').click(function(e){
	var data = $('#signature').jSignature('getData');
	var i = new Image();
	i.src = data;
	$(i).appendTo('#displayimg');
	
	$('#content').hide();
  	e.preventDefault();
});	   
	   

$('#reset').click(function(e){
  $('#signature').jSignature('clear');
  $("#signature_capture").val('');
  e.preventDefault();
});


	   
	      };
   $scope.load();
}]);