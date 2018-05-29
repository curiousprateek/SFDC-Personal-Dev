<div class="row">
  <div class="form-group col-sm-2 col-sm-offset-10" >
    <input class="form-control input-sm" id="searchText" placeholder="Search accounts" style="width:100%" ng-model="searchText" ng-change="searchData()"/>
  </div>
</div>
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
<div class="row" ng-show="filteredAccountData">
  <div class="form-group col-sm-12" >
      <table class="table table-condensed table-hover">
          <thead>
              <tr>
                  <th><a ng-click="sort = 'Name';reverse = !reverse;">Name <span ng-class="{'glyphicon-sort-by-alphabet' : !reverse,'glyphicon-sort-by-alphabet-alt' : reverse}" class="glyphicon" ng-show="sort=='Name'"/></a></th>
                  <th><a ng-click="sort = 'Type';reverse = !reverse;">Type <span ng-class="{'glyphicon-sort-by-alphabet' : !reverse,'glyphicon-sort-by-alphabet-alt' : reverse}" class="glyphicon" ng-show="sort=='Type'"/></a></th>
              </tr>
          </thead>
          <tr ng-repeat="account in filteredAccountData">
              <td style="vertical-align: middle;">
                  <a ng-href="#{{account.Id}}">{{account.Name}}</a>
              </td>
              <td style="vertical-align: middle;">
                  {{account.Type}}
              </td>
          </tr>
      </table>
      <pagination class="pagination-sm" total-items="totalItems" items-per-page="itemsPerPage" ng-model="currentPage" max-size="10" ng-show="accountData && (accountData.length>5)" rotate="false" previous-text="<" next-text=">"></pagination>
  </div>
</div>