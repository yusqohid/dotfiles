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
        const isExpanded = button.getAttribute('aria-expanded') === 'true';

        // Close all other FAQ items (optional)
        document.querySelectorAll('.faq-content').forEach(otherContent => {
            if (otherContent !== content) {
                otherContent.style.maxHeight = '0';
                otherContent.previousElementSibling.setAttribute('aria-expanded', 'false');
                otherContent.previousElementSibling.querySelector('.faq-icon').style.transform = 'rotate(0deg)';
            }
        });

        // Toggle current FAQ item
        if (isExpanded) {
            content.style.maxHeight = '0';
            button.setAttribute('aria-expanded', 'false');
            icon.style.transform = 'rotate(0deg)';
        } else {
            content.style.maxHeight = content.scrollHeight + 'px';
            button.setAttribute('aria-expanded', 'true');
            icon.style.transform = 'rotate(180deg)';
        }
    });
});