const dateFromBtn = document.getElementById("dateFrom");
const dateToBtn= document.getElementById("dateTo");

if (dateFromBtn !== null && dateToBtn !== null) {
    dateFromBtn.addEventListener("change", () => {
        let fromValue = dateFromBtn.value;
        dateToBtn.setAttribute("min", fromValue);
    })
    
    dateToBtn.addEventListener("change", () => {
        let toValue = dateToBtn.value;
        dateFromBtn.setAttribute("max", toValue);
    })
}