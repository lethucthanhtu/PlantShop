document.getElementById("dropdown-btn").onclick = function (){
    var show = document.getElementById("dropdown-search");
    
    if(show.classList.contains("hidden")) show.classList.remove("hidden");
    else show.classList.add("hidden")
}