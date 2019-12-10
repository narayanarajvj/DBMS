
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    body {
        font-family: Arial, Helvetica, sans-serif;
        margin:0 0 0 0;
        width: 100%;
    }

    .navbar {
        width: auto;
        background-color: #555;
        overflow: auto;
        padding-top: 2px;
        padding-bottom: 0px;
    }

    .navbar a {
        float: right ;
        padding: 20px;
        color: white;
        text-decoration: none;
        font-size: 19px;
    }

    .navbar a:hover,.dropdown a:hover{
        color: rgba(209, 209, 209, 0.74);
    }


    @media screen and (max-width: 500px) {
        .navbar a {
            float: none;
            display: block;
        }
    }


    .tablink {
        background-color: #555;
        color: white;
        float: left;
        border: none;
        outline: none;
        cursor: pointer;
        padding: 18px 16px;
        font-size: 17px;
        width: 50%;
    }

    .tablink:hover {
        background-color: #777;
    }

    /* Style the tab content */
    .tabcontent {
        color: white;
        display: none;
        padding: auto;
        padding-bottom: 300px;
        padding-top: 170px;
        text-align: center;
        width:100%;
        height: auto;
        width: auto;

    }
    .tabcontent p{
        padding: 190px;
    }
    .tit a{
        /*font-family: 'Old Standard TT', serif;*/
        /*color: rgb(202, 198, 198);*/
        float: left;
        /*color:whitesmoke;*/
        font-size: 35px;
        width: 15%;
        font-weight:bolder;
        margin-left: 50px;
        margin-top: 5px;
        margin-bottom: 5px;
        padding: 10px 5px 10px 5px;
        font-family: "Book Antiqua";
        /*text-align: center;*/
        /*font-size: 35px;*/
        /*letter-spacing: 1px;*/
        color: gold;
        background-color: rgb(84, 84, 84);
        text-shadow: rgb(0, 0, 0) 5px 5px 4px;

    }

    #ele{
        padding: 0.5rem 2rem;
        clip-path: rect(10% 0, 100% 0, 90% 100%,0 100%);
        background-color: rgb(88, 87, 87);
        font-size:30px;
        font-family:'Megrim', cursive;
        color: deepskyblue;
        display:inline-block;
        position: relative;
    }


    #Electronics {
        background-image: url("efin.jpeg");
        background-size: cover;
        background-position: center;
        height: 100%;
    }
    #Home {
        background-image: url("hfin.jfif");
        background-size: cover;
        background-position: center;
        height: 100%;

    }

    .dropbtn {
        padding: 16px;
        font-size: 16px;
        border: none;
        cursor: pointer;
    }

    /* .dropbtn:hover, .dropbtn:focus {
      background-color: #2980B9;
    } */

    .dropdown {
        position: absolute;
        display: inline-block;
        margin-left: 85%;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        top: 50px;
        background-color: #f1f1f1;
        min-width: 160px;
        overflow: auto;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }

    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    /* .dropdown a:hover {background-color: #ddd;} */

    .show {display: block;}
    .bloc a {
        color: black;
        background-color:cornsilk;
        width:10%;
        padding: 13px 13px 13px 13px;
        border: 1px solid black;
        border-radius: 5px;
        font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;\
    font-size: 20px;
    }

</style>
<body>

<div class="navbar">
    <a href="cart.jsp"  style="margin-right: 20px"><i class="fa fa-shopping-cart"></i> Cart</a>
    <div class="dropdown">
        <a onclick="myFunction()" class="dropbtn"><i class="fa fa-phone" aria-hidden="true"></i> Contact</a>
        <div id="myDropdown" class="dropdown-content">
            <p style="text-align: center;">Toll-Free Number:</p>
            <p style="text-align: center;">1800-000-0000</p>
        </div>
    </div>
    <a href="login.jsp"  style="position:relative;margin-right: 0px;right: 105px;padding-top: 18px;"><i class="fa fa-sign-in" aria-hidden="true"></i> Login</a>
    <div class="tit">
        <a href="#"><i class="fa fa-bluetooth-b fa-2x" aria-hidden="true" style="color:red"></i> E-Mart</a>
    </div>
</div>
<section class= "bloc">
    <div id="Electronics" class="tabcontent">
        <h1 id="ele">Electronics Products</h1><br>
        <a  href="product.jsp" style="text-decoration: none;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5);" type="submit">Shop Now</a>
    </div>

    <div id="Home" class="tabcontent">
        <h1 id="ele">Home Appliances</h1><br>
        <a href="home.jsp" style="text-decoration: none;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5);" type="submit">Shop Now</a>
    </div>



    <button class="tablink" onclick="openItem('Electronics', this, 'deeppink')" id="defaultOpen">Electronics Products</button>
    <button class="tablink" onclick="openItem('Home', this, 'green')">Home Appliances</button>
</section>

<script>
    function openItem(cityName,elmnt,color) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablink");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].style.backgroundColor = "";
        }
        document.getElementById(cityName).style.display = "block";
        elmnt.style.backgroundColor = color;

    }
    // Get the element with id="defaultOpen" and click on it
    document.getElementById("defaultOpen").click();

    function myFunction() {
        document.getElementById("myDropdown").classList.toggle("show");
    }

    // Close the dropdown if the user clicks outside of it
    window.onclick = function(event) {
        if (!event.target.matches('.dropbtn')) {
            var dropdowns = document.getElementsByClassName("dropdown-content");
            var i;
            for (i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
    }
</script>

</body>
</html>
