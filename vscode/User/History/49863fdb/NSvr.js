const carousel = document.getElementById("carousel");

let isDragging = false;
let startX, scrollLeft;

carousel.addEventListener("mousedown", (e) => {
    isDragging = true;
    startX = e.pageX - carousel.offsetLeft;
    scrollLeft = carousel.scrollLeft;
    carousel.style.cursor = "grabbing";
});

carousel.addEventListener("mousemove", (e) => {
    if (!isDragging) return;
    e.preventDefault();
    const x = e.pageX - carousel.offsetLeft;
    const walk = (x - startX) * 2; // Atur kecepatan drag
    carousel.scrollLeft = scrollLeft - walk;
});

carousel.addEventListener("mouseup", () => {
    isDragging = false;
    carousel.style.cursor = "grab";
});

carousel.addEventListener("mouseleave", () => {
    isDragging = false;
    carousel.style.cursor = "grab";
});
