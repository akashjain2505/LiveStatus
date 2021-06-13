<%-- 
    Document   : currency
    Created on : Jun 11, 2021, 10:28:32 AM
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
   
    <title>Currency Status</title>
    <link rel='stylesheet' href='/stylesheets/style.css' />
 
  </head>
  <body>
    <div  class="text-primary">
        <h1 class="display-3">Currency Status</h1>
    
    </div>

    
    <nav class="navbar navbar-light bg-light">
     <span class="navbar-brand mb-0 h1">Currency Live Status</span> 
    </nav>
<div>
    <div class="container">
  <table class="table table-dark table-hover" style="min-width: 20; background: linen">
   
    <tbody>
      <tr>
        <td><input id="famt" type="number" onkeyup="myfunc()" value="1"></td>
        <td><select id="fromc">
          <option  value="USD">US dollar</option>
          
          <option  value="INR" selected>Indian rupee</option>
          <option  value="AFA">Afghanistan afghani</option>
          <option  value="BHD">Bahraini dinar</option>
          <option  value="BTD">Bangladeshi taka</option>
          <option  value="CAD">Canadian dollar</option>
          <option  value="EGP">Egyptian pound</option>
          <option  value="JMD">Jamaican dollar</option>
          <option  value="MXN">Mexican peso</option>
        </select>
        
        </td>
        
      </tr>
      <tr>
        <td><input id="tamt" type="number" disabled></td>
        <td>
          <select id="toc">
            <option  value="USD" selected>US dollar</option>
            
            <option  value="INR">Indian rupee</option>
            <option  value="AFA">Afghanistan afghani</option>
            <option  value="BHD">Bahraini dinar</option>
            <option  value="BTD">Bangladeshi taka</option>
            <option  value="CAD">Canadian dollar</option>
            <option  value="EGP">Egyptian pound</option>
            <option  value="JMD">Jamaican dollar</option>
            <option  value="MXN">Mexican peso</option>
          </select>
        </td>
       
      </tr>
    </tbody>
  </table>
</div>

    <div style="text-align: center;">
      <button   type="submit" onclick="myfunc()" class="btn btn-primary mb-2">GO</button>
    </div>
</div>

    <script>
      function myfunc(){
        var from = document.getElementById("fromc").value;
        var to = document.getElementById("toc").value;

        var famt = document.getElementById("famt").value;
      
      
            
      
             var request = new XMLHttpRequest()
      var query= from +'_'+to;
      request.open('GET', 'https://free.currconv.com/api/v7/convert?q='+query+'&compact=ultra&apiKey=ed1119a7fc813e338838', true)
      request.onload = function() {
      // Begin accessing JSON data here
      var data = JSON.parse(this.response)
      console.log(data)
      if (request.status >= 200 && request.status < 400) {
        //var one = data.rates[to]/data.rates[from];
        

       
       document.getElementById("tamt").value = (data[query]*famt).toFixed(2);
      
       
      
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
      
         

    <br>
    <div class="container">
<nav class="navbar navbar-light bg-light">
 <h5>Last Update on - <span  id="time" class="navbar-brand mb-0 h1">  </span></h5> 
</nav>
        <div class="container text-primary text-center">
            <a href="index.jsp" class="btn btn-primary">HOME </a>
        </div>
  </div>
  </body>
</html>
