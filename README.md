## Analytics App

[See it in action](http://analytics-app-ghbooth12.herokuapp.com)

* Analytics app is an analytics service and reporting tool that you can use with web apps to track user activity and report results.
* It uses a client-side JavaScript snippet that allows a user to track events on their website.
* Then the server-side API captures and saves those events to a database.
* Finally it displays the captured event data for a user.

### How it works
_Log-in as test user account, take a look how it works._

1. Click here to log in automatically.
2. See all registered apps.
3. Register a new app URL to track user activity.
4. Go to one of your apps and copy/paste [this JavaScript snippet](#create-a-javascript-snippet) in the app that you choose.
5. Make actions on the target element in the registered app. e.g., click
6. View user activities in beautiful charts.

### Create a JavaScript Snippet
Analytics App can track events using JavaScript snippet.
```javascript
var analytics_app = {};
analytics_app.report = function(eventName){
  var event   = { event: { name: eventName } };

  var request = new XMLHttpRequest();

  request.open("POST", "http://analytics-app-ghbooth12.herokuapp.com/api/events", true);
  request.setRequestHeader('Content-Type', 'application/json');
  request.send(JSON.stringify(event));
};

$(document).ready(function(){
  $('#target-element').on("click", function(){
    analytics_app.report("Clicked Welcome Button");
  });
});
```
```html
<button id="target-element">I'm Button</button>
```
