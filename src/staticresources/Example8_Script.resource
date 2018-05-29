var app = angular.module('demo', ['ngRoute', 'ui.bootstrap']);

app.config(function($routeProvider) {
  $routeProvider.
    when('/', {
      templateUrl: homeTemplateURL,
      controller: 'homeCtrl'
    }).
    when('/:accountId', {
      templateUrl: accountTemplateURL,
      controller: 'accountCtrl'
    }).
    otherwise({
      redirectTo: '/'
    });
});
        
app.controller('homeCtrl', function ($scope, $filter){
  
  $scope.loadingImageURL = loadingImageURL;
  
  $scope.itemsPerPage = 5;
  $scope.currentPage = 1;
  $scope.sort = 'Name';
  
  $scope.getAccounts = function() {
    getAccountsR(function(result, event){  
      $scope.$apply(function(){  
        if(event.status) {
          //success
          $scope.accountData = result;
          $scope.accountDataStage = result;
          $scope.loaded = true;
          $scope.totalItems = result.length;
          $scope.$watch('currentPage + itemsPerPage', $scope.paginate);
          $scope.$watch('searchText', $scope.watchSearchText);
          $scope.$watch('sort', $scope.watchSort);
          $scope.$watch('reverse', $scope.watchReverse);
          console.log($scope.accountData);
        } else {
          //error
          $scope.$parent.alerts = [{type: 'danger', msg: event.message}];
        }
      });   
    });
  };
  
  $scope.paginate = function() {
    var begin = (($scope.currentPage - 1) * $scope.itemsPerPage),
    end = begin + $scope.itemsPerPage;
    $scope.filteredAccountData = $scope.accountData.slice(begin, end);
  };
  
  $scope.watchSearchText = function(newValue, oldValue){ 
    $scope.currentPage = 1;
    $scope.accountData = $filter('filter')($scope.accountDataStage, newValue);
    $scope.totalItems = $scope.accountData.length;
    $scope.paginate();
  };
   
  $scope.watchSort = function(newValue, oldValue){
    $scope.reverse = false;
    $scope.accountData = $filter('orderBy')($scope.accountData, newValue, $scope.reverse);
    $scope.paginate();
    $scope.currentPage = 1;
  };
  
  $scope.watchReverse = function(newValue, oldValue){
    $scope.accountData = $filter('orderBy')($scope.accountData, $scope.sort, newValue);
    $scope.paginate();
    $scope.currentPage = 1;
  };
  
  $scope.getAccounts();
});

app.controller('accountCtrl', function ($scope, $routeParams, $location){
  
  $scope.loadingImageURL = loadingImageURL;
  
  $scope.getAccountDetail = function() {
    getAccountDetailR($routeParams.accountId, function(result, event){  
      $scope.$apply(function(){  
        if(event.status) {
          //success
          $scope.account = result;
          $scope.loaded = true;
        } else {
          //error
          $scope.$parent.alerts = [{type: 'danger', msg: event.message}];
        }
      });   
    });
  };
  
  $scope.goBack = function() {
    $location.path('/');
  };
  
  $scope.getAccountDetail();
});