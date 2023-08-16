function decrement(e) {
    const btn = e.target.parentNode.parentElement.querySelector(
      'div[data-action="decrement"]'
    );
    const target = btn.nextElementSibling;
    let value = Number(target.value);
    if (value > 1) {
        value--;
    }
    target.value = value;
  }

function increment(e) {
    const btn = e.target.parentNode.parentElement.querySelector(
      'div[data-action="decrement"]'
    );
    const target = btn.nextElementSibling;
    let value = Number(target.value);
    value++;
    target.value = value;
}

const decrementButtons = document.querySelectorAll(
    `div[data-action="decrement"]`
);

const incrementButtons = document.querySelectorAll(
    `div[data-action="increment"]`
);

decrementButtons.forEach(btn => {
    btn.addEventListener("click", decrement);
});

incrementButtons.forEach(btn => {
    btn.addEventListener("click", increment);
});

var val = document.getElementById("quantityBox").value;

if(target.value < 0){
    
}