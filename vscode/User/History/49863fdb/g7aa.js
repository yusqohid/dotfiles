document.addEventListener("DOMContentLoaded", function () {
    const carousel = document.getElementById("carousel");
    let isPaused = false;

    function autoScroll() {
        if (!isPaused) {
            carousel.scrollBy({ left: 1, behavior: "smooth" });

            // Jika sudah di akhir, kembali ke awal
            if (carousel.scrollLeft + carousel.clientWidth >= carousel.scrollWidth) {
                carousel.scrollTo({ left: 0, behavior: "smooth" });
            }
        }
    }

    let scrollInterval = setInterval(autoScroll, 20); // Kecepatan scroll

    // Pause saat hover
    carousel.addEventListener("mouseenter", () => (isPaused = true));
    carousel.addEventListener("mouseleave", () => (isPaused = false));
});