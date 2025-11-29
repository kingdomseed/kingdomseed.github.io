// Main JavaScript file for JH Resume - Prototype

document.addEventListener('DOMContentLoaded', () => {
    initTheme();
    initMobileMenu();
    initContactForm();
    initSmoothScroll();
});

// =========================================
// Expose functions to global scope for onclick handlers
// =========================================
window.toggleJobDetails = toggleJobDetails;
window.downloadResume = downloadResume;

// =========================================
// Job Details Toggle (Smooth Animation)
// =========================================
function toggleJobDetails(button) {
    const details = button.nextElementSibling;
    const icon = button.querySelector('svg');
    const text = button.querySelector('.expand-text');
    
    if (details.classList.contains('collapsed')) {
        // Expand
        details.style.maxHeight = details.scrollHeight + 'px';
        details.classList.remove('collapsed');
        icon.classList.add('rotate-180');
        icon.classList.remove('animate-pulse-gentle');
        text.textContent = 'Hide details';
        
        // Remove max-height after animation to allow content reflow
        setTimeout(() => {
            details.style.maxHeight = 'none';
        }, 300);
    } else {
        // Collapse - first set explicit height, then animate to 0
        details.style.maxHeight = details.scrollHeight + 'px';
        // Force reflow
        details.offsetHeight;
        details.style.maxHeight = '0';
        details.classList.add('collapsed');
        icon.classList.remove('rotate-180');
        icon.classList.add('animate-pulse-gentle');
        text.textContent = 'Show details';
    }
}

// =========================================
// Theme Management
// =========================================
function initTheme() {
    const themeToggleBtn = document.getElementById('theme-toggle');
    const darkIcon = document.getElementById('theme-toggle-dark-icon');
    const lightIcon = document.getElementById('theme-toggle-light-icon');

    // Initial Icon State
    if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
        document.documentElement.classList.add('dark');
        lightIcon.classList.remove('hidden');
    } else {
        document.documentElement.classList.remove('dark');
        darkIcon.classList.remove('hidden');
    }

    if (themeToggleBtn) {
        themeToggleBtn.addEventListener('click', () => {
            // Toggle icons inside button
            darkIcon.classList.toggle('hidden');
            lightIcon.classList.toggle('hidden');

            // If set via local storage previously
            if (localStorage.getItem('color-theme')) {
                if (localStorage.getItem('color-theme') === 'light') {
                    document.documentElement.classList.add('dark');
                    localStorage.setItem('color-theme', 'dark');
                } else {
                    document.documentElement.classList.remove('dark');
                    localStorage.setItem('color-theme', 'light');
                }
            } else {
                // if NOT set via local storage previously
                if (document.documentElement.classList.contains('dark')) {
                    document.documentElement.classList.remove('dark');
                    localStorage.setItem('color-theme', 'light');
                } else {
                    document.documentElement.classList.add('dark');
                    localStorage.setItem('color-theme', 'dark');
                }
            }
        });
    }
}

// =========================================
// Mobile Menu
// =========================================
function initMobileMenu() {
    const btn = document.getElementById('mobile-menu-button');
    const menu = document.getElementById('mobile-menu');

    if (btn && menu) {
        btn.addEventListener('click', () => {
            menu.classList.toggle('hidden');
        });
    }
}

// =========================================
// Smooth Scroll Navigation
// =========================================
function initSmoothScroll() {
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            
            const targetId = this.getAttribute('href');
            if(targetId === '#') return;
            
            const targetElement = document.querySelector(targetId);
            
            if(targetElement){
                // Calculate position with header offset (80px)
                const headerOffset = 80;
                const elementPosition = targetElement.getBoundingClientRect().top;
                const offsetPosition = elementPosition + window.pageYOffset - headerOffset;

                window.scrollTo({
                    top: offsetPosition,
                    behavior: "smooth"
                });
                
                // Close mobile menu if open
                const mobileMenu = document.getElementById('mobile-menu');
                if (mobileMenu && !mobileMenu.classList.contains('hidden')) {
                    mobileMenu.classList.add('hidden');
                }
            }
        });
    });
}

// =========================================
// PDF Resume Download
// =========================================
function downloadResume() {
    const resumeTemplate = document.getElementById('resumeTemplate');
    
    if (!resumeTemplate) {
        console.error('Resume template not found');
        alert('Unable to generate PDF. Please try again later.');
        return;
    }
    
    const element = resumeTemplate.firstElementChild;
    const opt = {
        margin: 0,
        filename: 'Jason_Holt_Resume.pdf',
        image: { type: 'jpeg', quality: 0.98 },
        html2canvas: { scale: 2, useCORS: true },
        jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' },
        enableLinks: true  // Preserve clickable links in PDF
    };
    
    // Show loading state on all download buttons
    const buttons = document.querySelectorAll('button[onclick="downloadResume()"]');
    buttons.forEach(btn => {
        btn.disabled = true;
        btn.style.opacity = '0.5';
        btn.style.cursor = 'wait';
    });
    
    // Generate PDF using html2pdf library
    html2pdf().set(opt).from(element).save().then(() => {
        // Reset button states on success
        buttons.forEach(btn => {
            btn.disabled = false;
            btn.style.opacity = '1';
            btn.style.cursor = 'pointer';
        });
    }).catch((error) => {
        console.error('PDF generation failed:', error);
        alert('Failed to generate PDF. Please try again.');
        // Reset button states on error
        buttons.forEach(btn => {
            btn.disabled = false;
            btn.style.opacity = '1';
            btn.style.cursor = 'pointer';
        });
    });
}

// =========================================
// Contact Form Validation
// =========================================
function initContactForm() {
    const form = document.getElementById('contact-form');
    if (!form) return;

    form.addEventListener('submit', (e) => {
        const nameInput = document.getElementById('name');
        const emailInput = document.getElementById('email');
        const messageInput = document.getElementById('message');
        
        let isValid = true;

        // Reset errors
        document.querySelectorAll('.text-red-500').forEach(el => el.classList.add('hidden'));

        // Name Validation
        if (!nameInput.value.trim()) {
            document.getElementById('name-error').classList.remove('hidden');
            isValid = false;
        }

        // Email Validation
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(emailInput.value.trim())) {
            document.getElementById('email-error').classList.remove('hidden');
            isValid = false;
        }

        // Message Validation
        if (!messageInput.value.trim()) {
            document.getElementById('message-error').classList.remove('hidden');
            isValid = false;
        }

        if (!isValid) {
            e.preventDefault();
        } else {
            // Show loading state on submit button
            const btn = form.querySelector('button[type="submit"]');
            btn.innerText = 'Sending...';
        }
    });
}
