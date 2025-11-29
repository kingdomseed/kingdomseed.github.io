// Main JavaScript file for JH Resume

document.addEventListener('DOMContentLoaded', () => {
    initTheme();
    initMobileMenu();
    initContactForm();
});

// Theme Management
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

// Mobile Menu
function initMobileMenu() {
    const btn = document.getElementById('mobile-menu-button');
    const menu = document.getElementById('mobile-menu');

    if (btn && menu) {
        btn.addEventListener('click', () => {
            menu.classList.toggle('hidden');
        });
    }
}

// Contact Form Validation
function initContactForm() {
    const form = document.getElementById('contact-form');
    if (!form) return;

    form.addEventListener('submit', (e) => {
        // We do NOT want to prevent default immediately if we want standard submission.
        // BUT we want to validate first.
        
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
            // If NOT valid, prevent submission
            e.preventDefault();
        } else {
            // If valid, we let it submit to Formspark
            // Optional: Add loading state visual
            const btn = form.querySelector('button[type="submit"]');
            btn.innerText = 'Sending...';
            // Don't disable or it might not submit depending on browser behavior with disabled buttons during submit
        }
    });
}
