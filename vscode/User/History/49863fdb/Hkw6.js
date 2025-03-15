const carousel = document.getElementById("carousel");
const images = carousel.querySelectorAll("img");

let isDragging = false;
let startX, scrollLeft;

// Saat mouse ditekan
carousel.addEventListener("mousedown", (e) => {
    isDragging = true;
    startX = e.pageX - carousel.offsetLeft;
    scrollLeft = carousel.scrollLeft;
    carousel.classList.add("cursor-grabbing");

    // Matikan pointer-event pada gambar agar bisa drag meskipun cursor di atas gambar
    images.forEach(img => img.style.pointerEvents = "none");
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

    // Aktifkan kembali pointer-event setelah drag selesai
    images.forEach(img => img.style.pointerEvents = "auto");
});

// Saat mouse keluar dari area
carousel.addEventListener("mouseleave", () => {
    isDragging = false;
    carousel.classList.remove("cursor-grabbing");
    
    // Aktifkan kembali pointer-event
    images.forEach(img => img.style.pointerEvents = "auto");
});
