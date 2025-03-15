// image slider

document.addEventListener('DOMContentLoaded', function () {
    const carousel = document.getElementById('carousel');
    const prevBtn = document.getElementById('prevBtn');
    const nextBtn = document.getElementById('nextBtn');

    const scrollAmount = 300; // Jumlah scroll per klik

    prevBtn.addEventListener('click', () => {
        carousel.scrollBy({ left: -scrollAmount, behavior: 'smooth' });
    });

    nextBtn.addEventListener('click', () => {
        carousel.scrollBy({ left: scrollAmount, behavior: 'smooth' });
    });
});

// FAQ Accordion

document.querySelectorAll('.faq-header').forEach(button => {
    button.addEventListener('click', () => {
        const content = button.nextElementSibling;
        const icon = button.querySelector('.faq-icon');

        // Toggle hidden class
        content.classList.toggle('hidden');

        // Rotate icon when expanded
        icon.style.transform = content.classList.contains('hidden') ? "rotate(0deg)" : "rotate(180deg)";
    });
});