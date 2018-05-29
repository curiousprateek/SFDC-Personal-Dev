<div class="row" ng-hide="loaded || alerts">
    <div class="form-group col-sm-12" >
        <img class="center-block" src="{{loadingImageURL}}" border="0" />
    </div>
</div>
<div class="row" ng-show="alerts">
    <div class="form-group col-sm-12" >
        <alert class="alert-dismissible" ng-repeat="alert in alerts" type="{{alert.type}}" >{{alert.msg}}</alert>
    </div>
</div>
<div class="row" ng-show="account">
  <form class="form-horizontal">
    <div class="form-group">
      <label class="col-sm-2 control-label">Account Name</label>
      <div class="col-sm-10">
        <p class="form-control-static"><a href="/{{account.Id}}">{{account.Name}}</a></p>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label">Account owner</label>
      <div class="col-sm-10">
        <p class="form-control-static"><a href="/{{account.Owner.Id}}">{{account.Owner.Name}}</a></p>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label">Type</label>
      <div class="col-sm-10">
        <p class="form-control-static">{{account.Type}}</p>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label">Industry</label>
      <div class="col-sm-10">
        <p class="form-control-static">{{account.Industry}}</p>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label">Description</label>
      <div class="col-sm-10">
        <p class="form-control-static">{{account.Description}}</p>
      </div>
    </div>
    <button type="button" class="btn btn-danger pull-left" ng-click="goBack()">back</button>
  </form>
</div>