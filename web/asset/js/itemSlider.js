console.log("a");
        const slider = document.querySelector(".container");
        const next = document.querySelector("#next");
        const prev = document.querySelector("#prev");
        console.log(next);
        console.log(prev);
        let sliderWidth = slider.offsetWidth / 4;
        const sliderList = document.querySelector("#display-list");
        console.log(sliderList);
        let items = sliderList.querySelectorAll("#display-li").length - 2;
        let count = 1;
        

//        window.addEventListener("resize", function () {
//            sliderWidth = slider.offsetWidth;
//        });

        function prevSlide() {
            if (count > 1) {
                count = count - 2;
                sliderList.style.left = "-" + count * sliderWidth + "px";
                count++;
            } else if (count == 1) {
                count = items - 1;
                sliderList.style.left = "-" + count * sliderWidth + "px";
                count++;
            }
        }
        function nextSlide() {
            if (count < items) {
                sliderList.style.left = "-" + count * sliderWidth + "px";
                count++;
            } else if (count == items) {
                sliderList.style.left = "0px";
                count = 1;
            }
        }
        prev.addEventListener("click", prevSlide);
        next.addEventListener("click", nextSlide);
        setInterval(function () {
            nextSlide();
        }, 5000);