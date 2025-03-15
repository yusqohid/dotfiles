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
        const faqItem = button.closest('.faq-item');
        const content = faqItem.querySelector('.faq-content');
        const icon = faqItem.querySelector('.faq-icon');
        const isExpanded = button.getAttribute('aria-expanded') === 'true';

        // Close all other FAQ items
        document.querySelectorAll('.faq-item').forEach(item => {
            if (item !== faqItem) {
                item.querySelector('.faq-content').style.maxHeight = '0';
                item.querySelector('.faq-header').setAttribute('aria-expanded', 'false');
                item.querySelector('.faq-icon').style.transform = 'rotate(0deg)';
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