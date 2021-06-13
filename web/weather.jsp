<%-- 
    Document   : weather
    Created on : Jun 11, 2021, 10:28:15 AM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
   
    <title>Weather Status</title>
    <link rel='stylesheet' href='/stylesheets/style.css' />
 
  </head>
  <body>
    <div  class="text-primary">
        <h1 class="display-3">Weather Status</h1>
    
    </div>

    
    <nav class="navbar navbar-light bg-light">
      <span class="navbar-brand mb-0 h1">Weather Live Status</span>
    </nav>

    <br>
    <div class="container">
    <div style="background: linen">
        <input type="text"  class="form-control-plaintext" id="cname" placeholder="Select City">
     
      <input type="text"  class="form-control-plaintext" id="dname" placeholder="Select Country">
      </div>
        <div style="text-align: center;">
      <button   type="submit" onclick="myfunc()" class="btn btn-primary mb-2">GO</button>
    </div>

    
   
   
    <script>
function myfunc(){
  var x = document.getElementById("cname").value;
  var y = document.getElementById("dname").value;


      

       var request = new XMLHttpRequest()

request.open('GET', 'http://api.openweathermap.org/data/2.5/weather?q='+x+','+y+'&appid=82005d27a116c2880c8f0fcb866998a0', true)
request.onload = function() {
// Begin accessing JSON data here
var data = JSON.parse(this.response)

if (request.status >= 200 && request.status < 400) {
 console.log(data)
 document.getElementById("temp").innerHTML = (data.main.temp - 273).toFixed(2);
  
 document.getElementById("speed").innerHTML = data.wind.speed
 document.getElementById("hum").innerHTML = data.main.humidity


 var dd = new Date();
 document.getElementById("time").innerHTML = dd

 


} else {
  console.log('error')
  alert("please Enter Correct Country Name");
 // document.getElementById("model").innerHTML = "Please Enter Correct Country name."
}
}

request.send()
}

    </script>

   
   <div class="text-secondary">
    <h4><span id="model"></span></h4>
   </div> 
    <div class="row">
        <div class="col-md-4">
<div class="card" style="width: 18rem;">
  <div class="card-body">
    <h5 class="card-title text-success font-weight-bold ">Temperature in C </h5>
    <p class="card-text " > <span id='temp'></span></p>
    
  </div>
</div>
        </div>
<br>
 <div class="col-md-4">
<div class="card" style="width: 18rem; ">
  <div class="card-body">
    <h5 class="card-title text-success font-weight-bold ">Wind Speed</h5>
    <p class="card-text " ><span id='speed'></span></p>
    
  </div>
</div>
 </div>
<br>
 <div class="col-md-4">
<div class="card"  style="width: 18rem;">
  <div class="card-body">
    <h5 class="card-title text-success font-weight-bold ">Humidity</h5>
    <p class="card-text "><span id='hum'></span></p>
    
  </div>
</div>
</div>

    </div>
<br>
<nav class="navbar navbar-light bg-light">
 <h5>Last Update on - <span  id="time" class="navbar-brand mb-0 h1">  </span></h5> 
</nav>
<div class="container text-primary text-center">
            <a href="index.jsp" class="btn btn-primary">HOME </a>
        </div>
    </div>
  </body>
</html>
