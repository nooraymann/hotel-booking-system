
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
       <title>Sign up page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <style>
    
            .mail{ 
                  position:relative; 
                 left:180px; 
                 top:18px;
                 border-radius: 25px; 
                 border: 2px ; 
                 padding: 25px; 
                 width: 20em 
            }
            .username{ 
                  position:relative; 
                 left:500px; 
               
                 border-radius: 25px; 
                 border: 2px ; 
                 padding: 25px; 
                 width: 20em 
            }
            .first{ position:relative; 
                 left:500px; 
                 border-radius: 25px; 
                 border: 2px ; 
                 padding: 25px; 
                 width: 10em }
            .second{
                 position:relative; 
                 left:500px; 
                 top:0px;
                 border-radius: 25px; 
                 border: 2px ; 
                 padding: 25px; 
                 width: 10em 
            }
            .phone{
                position:relative; 
                 left:500px; 
                 top:100px;
                 border-radius: 25px; 
                 border: 2px ; 
                 padding: 25px; 
                 width: 20em 
            }
            .button{
                    position:relative; 
                    left:570px; 
                    top:100px;
                    width: 13em;
                    border-radius:25px; 
                    border:2px ;
                    padding:21px;
                      color: whitesmoke;
                    background:burlywood;
                    
            }
            .g-recaptcha{
                position:relative; 
                 left:505px; 
                 top:130px;
                width: 50px;}
             body {
              background-image: url('h1.jpeg');
              background-repeat: no-repeat;
              background-size: cover;
            }
            .welc{position:relative; 
                     left:540px; 
                     
                     color: white;
                     font-size:60px;
                font-family: Helvetica;
            }
            .radio1{
                position:relative; 
                     left:540px; 
                     top:110px;
                     color: white;
                   
                font-family: Helvetica;
            }
             .radio2{
                position:relative; 
                     left:540px; 
                     top:120px;
                     color: white;
                font-family: Helvetica;
            }
            #m{
                
               position:relative; 
                 left:160px; 
                 top:30px;
                 border-radius: 25px; 
                 border: 2px ; 
                 padding: 25px; 
                 width: 20em 
            }
            .error3{
                
                  position:relative; 
                 left:578px; 
                 top:109px;
                color:red;
            }
            .error2{
                
                color:red;
                position:relative;
                 left:578px;
                 top:109px;
            }
            #nameError{
                 position:relative; 
                 left:500px; 
                 top:14px;
             
            }
            #mailError{
                 position:relative; 
                 left:150px; 
                 top:30px;
            }
        </style>
       
            
         
   
        
    </head>
    <body>
 
        <form name="register" onsubmit="return ClientSide(this)" action="signup" method="post" >
            <h1 class="welc">Welcome</h1>
            <input class="first" type="text" name="first" placeholder="First name"  >           
            <input class="second" type="text" name="second" placeholder="Second name" > <label id="nameError"></label><br>
             <input class="phone" type="text" name="phone" placeholder="Phone number" required>
           <input class="mail" type="text" name="mail" id="mail" placeholder="E-email"  onblur="checkExist()" >  <span id="m"></span> <label id="mailError"></label><br>
           <div class="radio1">
             <label>  <input  type="radio" name="role" value='Admin' checked required> Admin</label> </div>
            <div class="radio2">
                <label> <input  type="radio" name="role" value='User' required> User</label>
                   </div>
            <div  class="g-recaptcha" data-sitekey="6LeAdRoaAAAAAHSj6Efe2wTqbNulBgJ6WSm88pGu" data-callback="enableBtn"></div><br>
        <p class="error2">${error2}</p>
        <c:remove var="error2" scope="s" />
        <p class="error2">${error}</p>
        <c:remove var="error" scope="s" />
        <p class="error3">${error3}</p>
        <c:remove var="error3" scope="s" />
            <input class="button" type="submit" value="Sign up" id="submit" disabled>
        </form>
         <script type="text/javascript">
    function enableBtn(){
        document.getElementById("submit").disabled = false;
    };
    function checkExist(){
                var xmlhttp = new XMLHttpRequest();
                var mail = document.forms["register"]["mail"].value;
                var url = "exist.jsp?mail=" + mail;
                xmlhttp.onreadystatechange = function(){
                    if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
                        if(xmlhttp.responseText == "\n\n\n\n\nUser already exists"){
                            document.getElementById("m").style.color = "red";
                            document.getElementById("m").innerHTML = xmlhttp.responseText;}
                        else
                        {  document.getElementById("m").style.color = "green";
                        document.getElementById("m").innerHTML = xmlhttp.responseText;}
                    }                
                };
                try{
                xmlhttp.open("GET",url,true);
                xmlhttp.send();
            }catch(e){alert("Eror :can not connect to the server");
            }}
         function ClientSide(form)
            {
                if (form.first.value === "") {
                    var fName = document.getElementById("nameError");
                    fName.innerHTML = " this field can not be blank!";
                    
                    fName.style.color = "red";
                    form.first.focus();
                    return false;
                }
                else if (form.second.value === "")
                {
                     var sName = document.getElementById("nameError");
                    sName.innerHTML = " this field can not be blank!";
                    sName.style.color = "red";
                    form.second.focus();
                    return false;

                }
                else if (form.mail.value === "")
                {
                    var email = document.getElementById("mailError");
                    email.innerHTML = " this field can not be blank!";
                    email.style.color = "red";
                    form.mail.focus();
                    return false;
                }
                else if (form.phone.value === "")
                {
                    var email = document.getElementById("phoneError");
                    email.innerHTML = " this field can not be blank!";
                    email.style.color = "red";
                    form.mail.focus();
                    return false;
                }
                m = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
               if(!m.test(form.mail.value)) {
               var email = document.getElementById("mailError");
                    email.innerHTML = " invalid mail";
                    email.style.color = "red";
               form.mail.focus();
               return false;
                                             }
                n = /^[A-Za-z]+$/;
         if(!n.test(form.first.value)){
        var sName = document.getElementById("nameError");
            sName.innerHTML = " first name must contain only letters";
            sName.style.color = "red";
        form.first.focus();
        return false;
    }
    if(!n.test(form.second.value)){
       var sName = document.getElementById("nameError");
            sName.innerHTML = " second name must contain only letters";
            sName.style.color = "red";
        form.second.focus();
        return false;
    }
                alert("success java script validation");
                return true;
            }
</script> 
    </body>
</html>
