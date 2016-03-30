## Analytics App

* API Tracking Service and Reporting Tool

* An analytics service and reporting tool to track user activity and report results

### Create a JavaScript Snippet
Analytics App can track events using JavaScript snippet.
```javascript
var analytics_app = {};
analytics_app.report = function(eventName){
  var event   = { event: { name: eventName } };

  var request = new XMLHttpRequest();

  request.open("POST", "http://analytics_app_domain/api/events", true);
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
