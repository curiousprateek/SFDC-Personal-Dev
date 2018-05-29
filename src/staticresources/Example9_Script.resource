var app = angular.module('demo', ['ngRoute', 'ui.bootstrap']);

app.config(function($routeProvider) {
  $routeProvider.
    when('/', {
      templateUrl: homeTemplateURL,
      controller: 'homeCtrl'
    }).
    when('/new', {
      templateUrl: newTemplateURL,
      controller: 'newCtrl'
    }).
    when('/:accountId', {
      templateUrl: accountTemplateURL,
      controller: 'accountCtrl'
    }).
    otherwise({
      redirectTo: '/'
    });
});

app.factory('accountFactory', function() {
  return {
        new: function(){
          jsonAccount.Type = "";
          return angular.copy(jsonAccount);
        },
        
        selectOptions: function(fieldName){
          if(fieldName == 'Type')
            return jsonTypeOptions;
          else
            return [];
        }
      };
});
        
app.controller('homeCtrl', function ($scope, $filter, $location){
  
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
          $scope.alerts = [{type: 'danger', msg: event.message}];
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
  
  $scope.new = function() {
    $location.path('/new');
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
          $scope.alerts = [{type: 'danger', msg: event.message}];
        }
      });   
    });
  };
  
  $scope.goBack = function() {
    $location.path('/');
  };
  
  $scope.getAccountDetail();
});

app.controller('newCtrl', function ($scope, accountFactory, $location){
  
  $scope.account = accountFactory.new();
  
  $scope.typeOptions = accountFactory.selectOptions("Type");
  
  $scope.save = function() {
    var upsert = angular.copy($scope.account);
    delete upsert.attributes;
    saveR(upsert, function(result, event){  
      $scope.$apply(function(){  
        if(event.status) {
          //success
          if(result.length==18) {
            $scope.goBack();
          } else {
            $scope.alerts = [{type: 'danger', msg: result}];
          }
        } else {
          //error
          $scope.alerts = [{type: 'danger', msg: event.message}];
        }
      });   
    });
  };
  
  $scope.goBack = function() {
    $location.path('/');
  };
});