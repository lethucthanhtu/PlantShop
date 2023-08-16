var password = document.getElementById("password");
var passwordLabel = document.getElementById("password-label");
var confirmLabel = document.getElementById("confirm-label");
var phoneLabel = document.getElementById("phone-label");
var submitBox = document.getElementById("submit-box");
var isLock = false;

function passwordCheck(x){
    if(x.value.length > 0){
        passwordLabel.classList.add("text-red-500");
        
//        if(x.value.length < 8){
//            document.getElementById("message").innerHTML = "Password must be at least 8 character";
//            submitBox.setAttribute("disabled", true);
//            submitBox.classList.add("cursor-not-allowed");
//            submitBox.classList.remove("cursor-pointer");
//        }
//        else if(x.value.length > 15){
//            document.getElementById("message").innerHTML = "Password must be shorter than 15 character";
//        
            submitBox.setAttribute("disabled", true);
            submitBox.classList.add("cursor-not-allowed");
            submitBox.classList.remove("cursor-pointer");
//        }
    } else {
        document.getElementById("message").innerHTML = "";
        passwordLabel.classList.remove("text-red-500");
        
        submitBox.setAttribute("disabled", false);
        submitBox.classList.add("cursor-pointer");
        submitBox.classList.remove("cursor-not-allowed");
    }
}

function confirmCheck(x){
    if(x.value.length > 0){
        confirmLabel.classList.add("text-red-500");
        
        if(x.value != password.value){
            document.getElementById("message").innerHTML = "Confirm password does not match.";
        
            submitBox.setAttribute("disabled", true);
            submitBox.classList.add("cursor-not-allowed");
            submitBox.classList.remove("cursor-pointer");
        }
    } else {
        document.getElementById("message").innerHTML = "";
        confirmLabel.classList.remove("text-red-500");
        
        submitBox.setAttribute("disabled", false);
        submitBox.classList.add("cursor-pointer");
        submitBox.classList.remove("cursor-not-allowed");
    }
}

var phone = document.getElementById("phone"); 

function phoneCheck(x){
    if(x.value.length > 0 && x.value.length != 10){
        phoneLabel.classList.add("text-red-500");
        
        
        if(Number.isInteger(x.value)) {
            if(x.value.length != 10)
                document.getElementById("message").innerHTML = "Phone number must be 10 number";
        } else
            document.getElementById("message").innerHTML = "Phone number must be number";
        
            
        submitBox.setAttribute("disabled", true);
        submitBox.classList.add("cursor-not-allowed");
        submitBox.classList.remove("cursor-pointer");
    } else {
        document.getElementById("message").innerHTML = "";
        phoneLabel.classList.remove("text-red-500");
        
        submitBox.setAttribute("disabled", false);
        submitBox.classList.add("cursor-pointer");
        submitBox.classList.remove("cursor-not-allowed");
    }
}
