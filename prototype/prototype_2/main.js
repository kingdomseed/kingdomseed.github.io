document.addEventListener('DOMContentLoaded', () => {
    // Mobile Menu Toggle
    const mobileMenuButton = document.getElementById('mobile-menu-button');
    const mobileMenu = document.getElementById('mobile-menu');

    if (mobileMenuButton && mobileMenu) {
        mobileMenuButton.addEventListener('click', () => {
            mobileMenu.classList.toggle('hidden');
            const icon = mobileMenuButton.querySelector('svg');
            if (mobileMenu.classList.contains('hidden')) {
                icon.innerHTML = '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />';
            } else {
                icon.innerHTML = '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />';
            }
        });
    }

    // Typing Effect
    const typeWriterElement = document.getElementById('typewriter');
    if (typeWriterElement) {
        const text = typeWriterElement.getAttribute('data-text');
        let i = 0;
        function typeWriter() {
            if (i < text.length) {
                typeWriterElement.innerHTML += text.charAt(i);
                i++;
                setTimeout(typeWriter, 50); // Typing speed
            }
        }
        // Start after a slight delay
        setTimeout(typeWriter, 500);
    }

    // Intersection Observer for Scroll Animations
    const observerOptions = {
        root: null,
        rootMargin: '0px',
        threshold: 0.1
    };

    const observer = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('opacity-100', 'translate-y-0');
                entry.target.classList.remove('opacity-0', 'translate-y-10');
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    document.querySelectorAll('.reveal-on-scroll').forEach((el) => {
        el.classList.add('opacity-0', 'translate-y-10', 'transition-all', 'duration-700', 'ease-out');
        observer.observe(el);
    });
});

// --- PDF Generation ---
/**
 * Generates a PDF of the resume using html2pdf.js
 * Targets the hidden #resumeTemplate element.
 */
async function downloadResume() {
    const element = document.getElementById('resumeTemplate');
    // Try to find the button in desktop or mobile nav
    const buttons = document.querySelectorAll('button[onclick="downloadResume()"]');
    
    if (!element) {
        console.error('Resume template element (#resumeTemplate) not found in the DOM.');
        alert('Error: Could not generate resume. Please try again later.');
        return;
    }

    try {
        // Update UI state
        buttons.forEach(btn => {
            btn.dataset.originalText = btn.innerText;
            btn.innerText = 'Generating...';
            btn.disabled = true;
            btn.classList.add('opacity-50', 'cursor-not-allowed');
        });

        console.log('Starting PDF generation...');

        const opt = {
            margin: 0,
            filename: 'Jason_Holt_Flutter_Engineer_Resume.pdf',
            image: { type: 'jpeg', quality: 0.98 },
            html2canvas: { scale: 2, useCORS: true, logging: false },
            jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
        };

        await html2pdf().set(opt).from(element).save();
        console.log('PDF generated successfully');

    } catch (error) {
        console.error('PDF Generation Error:', error);
        alert('Failed to generate PDF. Please check the console for details.');
    } finally {
        // Restore UI state
        buttons.forEach(btn => {
            if (btn.dataset.originalText) {
                btn.innerText = btn.dataset.originalText;
            }
            btn.disabled = false;
            btn.classList.remove('opacity-50', 'cursor-not-allowed');
        });
    }
}

// --- Collapsible Experience Details ---
/**
 * Toggles the visibility of job details with smooth animation
 * @param {HTMLElement} button - The button element that was clicked
 */
function toggleJobDetails(button) {
    const details = button.nextElementSibling;
    const expandText = button.querySelector('.expand-text');
    const icon = button.querySelector('svg');
    
    if (details.style.maxHeight && details.style.maxHeight !== '0px') {
        // Collapse
        details.style.maxHeight = '0';
        icon.classList.remove('rotate-180');
        if (expandText) expandText.textContent = 'Show details';
    } else {
        // Expand
        details.style.maxHeight = details.scrollHeight + 'px';
        icon.classList.add('rotate-180');
        if (expandText) expandText.textContent = 'Hide details';
    }
}
