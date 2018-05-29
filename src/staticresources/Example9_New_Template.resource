<div class="row" ng-show="alerts">
    <div class="form-group col-sm-12" >
        <alert class="alert-dismissible" ng-repeat="alert in alerts" type="{{alert.type}}" >{{alert.msg}}</alert>
    </div>
</div>
<div class="row">
  <div class="col-sm-6" >
      <div class="form-group" ng-class="{'has-success' : account.Name,'has-error' : !account.Name}">
        <label for="Name">Name *</label>
        <input class="form-control" ng-model="account.Name" id="Name" placeholder="Name">
      </div>
  </div>
  <div class="col-sm-6" >
      <div class="form-group">
        <label for="Type">Type</label>
        <select id="Type" ng-model="account.Type" class="form-control" ng-options="option.key as option.value for option in typeOptions"></select>
      </div>
  </div>
</div>
<div class="row">
  <div class="col-sm-6" >
      <div class="form-group">
        <label for="Industry">Industry *</label>
        <input class="form-control" ng-model="account.Industry" id="Industry" placeholder="Industry">
      </div>
  </div>
  <div class="col-sm-6" >
      <div class="form-group">
        <label for="Type">Type</label>
        <textarea class="form-control" ng-model="account.Description" style="height:70px" id="Description" placeholder="Description (255 characters)"></textarea>
      </div>
  </div>
</div>
<button type="button" class="btn" ng-click="goBack()" id="back" >back</button>
<button type="button" class="btn btn-primary" ng-click="save()" id="save" ng-disabled="!account.Name" >Save</button>