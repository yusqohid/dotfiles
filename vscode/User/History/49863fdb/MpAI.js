const carousel = document.getElementById("carousel");

let isDragging = false;
let startX, scrollLeft;

// Saat mouse ditekan
carousel.addEventListener("mousedown", (e) => {
    isDragging = true;
    startX = e.pageX - carousel.offsetLeft;
    scrollLeft = carousel.scrollLeft;
    carousel.classList.add("cursor-grabbing"); // Ubah kursor
});

// Saat mouse bergerak
carousel.addEventListener("mousemove", (e) => {
    if (!isDragging) return;
    e.preventDefault();
    const x = e.pageX - carousel.offsetLeft;
    const walk = (x - startX) * 2; // Sesuaikan kecepatan geser
    carousel.scrollLeft = scrollLeft - walk;
});

// Saat mouse dilepas
carousel.addEventListener("mouseup", () => {
    isDragging = false;
    carousel.classList.remove("cursor-grabbing");
});

// Saat mouse keluar dari area
carousel.addEventListener("mouseleave", () => {
    isDragging = false;
    carousel.classList.remove("cursor-grabbing");
});
