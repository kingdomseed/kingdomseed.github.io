/* =========================================
   Jason Holt Portfolio - Main JavaScript
   ========================================= */

// --- Navigation Scroll Fix (Updated) ---
// 1. Select all links that link to a hash
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        // 2. Prevent default anchor jump
        e.preventDefault();
        
        const targetId = this.getAttribute('href');
        if(targetId === '#') return;
        
        const targetElement = document.querySelector(targetId);
        
        if(targetElement){
            // 3. Calculate position with header offset (80px)
            const headerOffset = 80;
            const elementPosition = targetElement.getBoundingClientRect().top;
            const offsetPosition = elementPosition + window.pageYOffset - headerOffset;

            // 4. Smooth scroll to calculated position
            window.scrollTo({
                top: offsetPosition,
                behavior: "smooth"
            });
        }
    });
});

// --- Chart Logic ---
const ctx = document.getElementById('skillsRadar').getContext('2d');
// Set fonts globally for chart
Chart.defaults.font.family = "'Inter', sans-serif";

// Skills data for each axis
const skillsData = {
    'UI Engineering': {
        score: 95,
        skills: ['React', 'Next.js', 'TypeScript', 'Component Architecture', 'State Management', 'Flutter/Dart']
    },
    'Visual Craft': {
        score: 80,
        skills: ['CSS/Tailwind', 'Animations', 'Responsive Design', 'Figma', 'Design Systems', 'Adobe Suite']
    },
    'Product Sense': {
        score: 85,
        skills: ['User Research', 'Analytics', 'Beta Testing', 'Iteration', 'Community Building', 'Shipping']
    },
    'Backend': {
        score: 60,
        skills: ['REST APIs', 'MongoDB', 'Azure Cloud', 'Docker', 'Nginx/SSL', 'Firebase']
    },
    'AI Tooling': {
        score: 70,
        skills: ['Claude Code', 'Cursor', 'Prompt Eng.', 'Context Eng.', 'Agentic Workflows', 'LLM Integration']
    },
    'Edu UX': {
        score: 95,
        skills: ['Learning Psychology', 'Instructional Design', 'Accessibility', 'Engagement Mechanics', 'Curriculum Dev']
    }
};

const labels = Object.keys(skillsData);
const dataValues = labels.map(l => skillsData[l].score);

// Custom tooltip element
const customTooltip = document.createElement('div');
customTooltip.id = 'chartTooltip';
customTooltip.className = 'fixed z-50 pointer-events-none opacity-0 transition-opacity duration-200';
customTooltip.innerHTML = `
    <div class="glass-panel rounded-xl p-4 border border-brand-400/30 shadow-xl shadow-brand-400/10 min-w-[180px]">
        <div class="font-semibold text-brand-400 mb-2 flex items-center gap-2">
            <span id="tooltipTitle"></span>
            <span id="tooltipScore" class="ml-auto text-white bg-brand-400/30 px-2 py-0.5 rounded text-xs"></span>
        </div>
        <div id="tooltipSkills" class="flex flex-wrap gap-1.5"></div>
    </div>
`;
document.body.appendChild(customTooltip);

new Chart(ctx, {
    type: 'radar',
    data: {
        labels: labels,
        datasets: [{
            label: 'Skill Proficiency',
            data: dataValues,
            fill: true,
            backgroundColor: 'rgba(16, 185, 129, 0.2)',
            borderColor: '#10b981',
            pointBackgroundColor: '#fff',
            pointBorderColor: '#059669',
            pointHoverBackgroundColor: '#10b981',
            pointHoverBorderColor: '#fff',
            pointRadius: 5,
            pointHoverRadius: 8
        }]
    },
    options: {
        maintainAspectRatio: false,
        scales: {
            r: {
                angleLines: { color: 'rgba(148, 163, 184, 0.1)' },
                grid: { color: 'rgba(148, 163, 184, 0.1)' },
                pointLabels: { 
                    color: '#cbd5e1', 
                    font: { size: 11, weight: 500, family: "'Sora', sans-serif" }
                },
                ticks: { display: false, backdropColor: 'transparent' },
                suggestedMin: 0, suggestedMax: 100
            }
        },
        plugins: { 
            legend: { display: false },
            tooltip: {
                enabled: false,
                external: function(context) {
                    const tooltip = document.getElementById('chartTooltip');
                    
                    if (context.tooltip.opacity === 0) {
                        tooltip.style.opacity = '0';
                        return;
                    }
                    
                    const dataIndex = context.tooltip.dataPoints?.[0]?.dataIndex;
                    if (dataIndex === undefined) return;
                    
                    const label = labels[dataIndex];
                    const data = skillsData[label];
                    
                    document.getElementById('tooltipTitle').textContent = label;
                    document.getElementById('tooltipScore').textContent = data.score + '%';
                    
                    const skillsContainer = document.getElementById('tooltipSkills');
                    skillsContainer.innerHTML = data.skills.map(skill => 
                        `<span class="px-2 py-0.5 bg-slate-800/80 rounded text-xs text-slate-200 border border-slate-700/50">${skill}</span>`
                    ).join('');
                    
                    const position = context.chart.canvas.getBoundingClientRect();
                    tooltip.style.opacity = '1';
                    tooltip.style.left = position.left + context.tooltip.caretX + 'px';
                    tooltip.style.top = position.top + context.tooltip.caretY - 10 + 'px';
                    tooltip.style.transform = 'translate(-50%, -100%)';
                }
            }
        },
        onHover: (event, elements) => {
            event.native.target.style.cursor = elements.length ? 'pointer' : 'default';
        }
    }
});

// Timeline Interaction with smooth animation
function toggleDetails(id) {
    const el = document.getElementById(id);
    const card = el.closest('.glass-panel');
    const chevron = card.querySelector('.expand-chevron');
    const expandText = card.querySelector('.expand-text');

    if (el.classList.contains('expanded')) {
        // Collapse
        el.style.maxHeight = '0';
        el.style.opacity = '0';
        el.classList.remove('expanded');
        if (chevron) chevron.style.transform = 'rotate(0deg)';
        if (expandText) expandText.textContent = 'Expand Details';
    } else {
        // Expand
        el.classList.add('expanded');
        el.style.maxHeight = el.scrollHeight + 'px';
        el.style.opacity = '1';
        if (chevron) chevron.style.transform = 'rotate(180deg)';
        if (expandText) expandText.textContent = 'Collapse';
    }
}

// Portfolio Filter
function filterPortfolio(category) {
    const items = document.querySelectorAll('.portfolio-item');
    const buttons = document.querySelectorAll('#portfolio button');
    buttons.forEach(btn => {
        const isActive = btn.textContent.toLowerCase().includes(category === 'all' ? 'all' : category);
        if(isActive) {
           btn.classList.add('bg-brand-400/10', 'border-brand-400', 'text-brand-400');
           btn.classList.remove('bg-transparent', 'border-slate-600', 'text-slate-400');
           btn.setAttribute('aria-pressed', 'true');
        } else {
           btn.classList.remove('bg-brand-400/10', 'border-brand-400', 'text-brand-400');
           btn.classList.add('bg-transparent', 'border-slate-600', 'text-slate-400');
           btn.setAttribute('aria-pressed', 'false');
        }
    });
    items.forEach(item => {
        if (category === 'all' || item.classList.contains(category)) {
            item.style.display = 'block';
        } else {
            item.style.display = 'none';
        }
    });
}

// Download Resume as PDF
function downloadResume() {
    const element = document.getElementById('resumeTemplate').firstElementChild;
    const opt = {
        margin: 0,
        filename: 'Jason_Holt_Resume.pdf',
        image: { type: 'jpeg', quality: 0.98 },
        html2canvas: { scale: 2, useCORS: true },
        jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' },
        enableLinks: true  // Preserve clickable links in PDF
    };
    
    // Show loading state
    const buttons = document.querySelectorAll('button[onclick="downloadResume()"]');
    buttons.forEach(btn => {
        btn.disabled = true;
        btn.style.opacity = '0.5';
    });
    
    html2pdf().set(opt).from(element).save().then(() => {
        buttons.forEach(btn => {
            btn.disabled = false;
            btn.style.opacity = '1';
        });
    }).catch((error) => {
        console.error('PDF generation failed:', error);
        buttons.forEach(btn => {
            btn.disabled = false;
            btn.style.opacity = '1';
        });
    });
}

// --- Scroll Reveal & Count-Up Animations ---
const observerOptions = {
    root: null,
    rootMargin: '0px',
    threshold: 0.1
};

// Count-up animation function
function animateCountUp(element) {
    const target = parseInt(element.dataset.count);
    const suffix = element.dataset.suffix || '';
    const numberFormatter = new Intl.NumberFormat('en-US');
    const duration = 2000;
    const startTime = performance.now();
    
    function update(currentTime) {
        const elapsed = currentTime - startTime;
        const progress = Math.min(elapsed / duration, 1);
        // Easing function (ease-out)
        const easeOut = 1 - Math.pow(1 - progress, 3);
        const current = Math.floor(easeOut * target);
        element.textContent = numberFormatter.format(current) + suffix;
        
        if (progress < 1) {
            requestAnimationFrame(update);
        } else {
            element.textContent = numberFormatter.format(target) + suffix;
        }
    }
    requestAnimationFrame(update);
}

// Scroll reveal observer
const scrollObserver = new IntersectionObserver((entries) => {
    entries.forEach((entry, index) => {
        if (entry.isIntersecting) {
            // Add stagger delay based on index
            setTimeout(() => {
                entry.target.classList.add('revealed');
                
                // Check for count-up elements
                const countEl = entry.target.querySelector('[data-count]');
                if (countEl && !countEl.dataset.animated) {
                    countEl.dataset.animated = 'true';
                    animateCountUp(countEl);
                }
            }, index * 100);
            
            scrollObserver.unobserve(entry.target);
        }
    });
}, observerOptions);

// Initialize scroll reveal elements
document.querySelectorAll('.scroll-reveal').forEach(el => {
    scrollObserver.observe(el);
});

// Portfolio card tilt effect
document.querySelectorAll('.portfolio-item').forEach(card => {
    card.addEventListener('mousemove', (e) => {
        const rect = card.getBoundingClientRect();
        const x = e.clientX - rect.left;
        const y = e.clientY - rect.top;
        const centerX = rect.width / 2;
        const centerY = rect.height / 2;
        const rotateX = (y - centerY) / 20;
        const rotateY = (centerX - x) / 20;
        
        card.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) translateY(-4px)`;
    });
    
    card.addEventListener('mouseleave', () => {
        card.style.transform = 'perspective(1000px) rotateX(0) rotateY(0) translateY(0)';
    });
});

// =========================================
// INTERACTIVE DOT MATRIX BACKGROUND
// =========================================
(function() {
    'use strict';
    
    // Check for reduced motion preference
    const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
    
    // Configuration
    const config = {
        dotSpacing: 50,           // Base spacing between dots
        depthLayers: 1,           // Number of z-depth layers (reduced for performance)
        maxOpacity: 0.25,         // Front layer max opacity (brighter)
        minOpacity: 0.05,         // Back layer min opacity
        maxSize: 2.5,             // Front layer dot size
        minSize: 1,               // Back layer dot size
        pulseSpeed: 0.0008,       // How fast dots pulse
        pulseIntensity: 0.08,     // How much opacity varies
        glowRadius: 0,            // Glow blur radius (0 = disabled for performance)
        mouseRadius: 150,         // Mouse interaction radius
        mouseStrength: 20,        // How far dots move toward mouse
        springStiffness: 0.03,    // How fast dots return (0-1)
        springDamping: 0.85,      // Friction on return (0-1)
        waveInterval: 8000,       // Ms between ambient waves
        waveSpeed: 0.003,         // How fast wave propagates
        waveStrength: 12,         // How far wave moves dots
        waveDuration: 3000,       // How long wave lasts
        color: { r: 155, g: 170, b: 255 }, // Dot color (soft blue/brand tint)
        mobileMultiplier: 2.0,    // Increase spacing on mobile
        showFPS: false,           // Show FPS counter for debugging
        skillDotChance: 0.04,     // Chance a dot becomes a skill dot (4%)
        skillDotSize: 4,          // Size of skill dots
        skillDotOpacity: 0.6,     // Opacity of skill dots
        skillHoverRadius: 20      // Hover detection radius for skill dots
    };
    
    // Skill categories with colors (matching the skills matrix)
    // weight: higher = more likely to appear (used for top-biasing Frontend)
    // All categories can appear anywhere, but weights shift based on Y position
    const skillCategories = [
        { 
            name: 'Frontend', 
            color: { r: 96, g: 165, b: 250 },  // blue-400
            skills: ['React', 'Next.js', 'TypeScript', 'Astro', 'Flutter'],
            topWeight: 3,    // More common at top
            bottomWeight: 1
        },
        { 
            name: 'Design', 
            color: { r: 192, g: 132, b: 252 }, // purple-400
            skills: ['Figma', 'Miro', 'Prototyping', 'Adobe Suite', 'UI/UX'],
            topWeight: 2.5,
            bottomWeight: 1
        },
        { 
            name: 'AI Tools', 
            color: { r: 251, g: 146, b: 60 },  // orange-400
            skills: ['Claude Code', 'Cursor', 'Prompt Eng.', 'Agentic Workflows'],
            topWeight: 2,
            bottomWeight: 1.5
        },
        { 
            name: 'Product', 
            color: { r: 74, g: 222, b: 128 },  // green-400
            skills: ['Linear', 'Analytics', 'Beta Testing', 'User Research'],
            topWeight: 1,
            bottomWeight: 2
        },
        { 
            name: 'Cloud', 
            color: { r: 34, g: 211, b: 238 },  // cyan-400
            skills: ['Azure', 'MongoDB', 'Docker', 'Firebase', 'Nginx'],
            topWeight: 1,
            bottomWeight: 2.5
        },
        { 
            name: 'Edu UX', 
            color: { r: 244, g: 114, b: 182 }, // pink-400
            skills: ['Learning Psychology', 'Instructional Design', 'Accessibility'],
            topWeight: 1,
            bottomWeight: 3
        }
    ];
    
    // Track used skills to prevent repetition
    let usedSkills = new Set();
    
    // Skill tooltip element
    const skillTooltip = document.createElement('div');
    skillTooltip.id = 'skillDotTooltip';
    skillTooltip.style.cssText = `
        position: fixed;
        z-index: 100;
        pointer-events: none;
        opacity: 0;
        transition: opacity 0.15s ease-out;
        font-family: 'Inter', sans-serif;
    `;
    skillTooltip.innerHTML = `
        <div style="background: rgba(15, 23, 42, 0.95); border: 1px solid rgba(148, 163, 184, 0.3); border-radius: 6px; padding: 6px 10px; backdrop-filter: blur(8px);">
            <span id="skillTooltipText" style="font-size: 12px; font-weight: 500; color: white;"></span>
        </div>
    `;
    
    // Separate SVG for the leader line (positioned absolutely over the page)
    const leaderLine = document.createElement('div');
    leaderLine.id = 'skillLeaderLine';
    leaderLine.style.cssText = `
        position: fixed;
        top: 0;
        left: 0;
        width: 100vw;
        height: 100vh;
        pointer-events: none;
        z-index: 99;
        overflow: visible;
    `;
    leaderLine.innerHTML = `
        <svg id="leaderLineSvg" style="position: absolute; top: 0; left: 0; overflow: visible;">
            <polyline id="leaderLinePath" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
    `;
    document.body.appendChild(leaderLine);
    
    // Set SVG size to exact pixel dimensions
    function updateLeaderLineSvgSize() {
        const svg = document.getElementById('leaderLineSvg');
        if (svg) {
            svg.setAttribute('width', window.innerWidth);
            svg.setAttribute('height', window.innerHeight);
        }
    }
    updateLeaderLineSvgSize();
    window.addEventListener('resize', updateLeaderLineSvgSize);
    document.body.appendChild(skillTooltip);
    
    // FPS counter
    let fpsFrames = 0;
    let fpsTime = 0;
    let currentFPS = 0;
    
    function updateFPS(timestamp) {
        fpsFrames++;
        if (timestamp - fpsTime >= 1000) {
            currentFPS = fpsFrames;
            fpsFrames = 0;
            fpsTime = timestamp;
            if (config.showFPS) {
                console.log(`Dot Matrix FPS: ${currentFPS} | Dots: ${dots.length}`);
            }
        }
    }
    
    // State
    const canvas = document.getElementById('dotMatrix');
    if (!canvas) return;
    
    const ctx = canvas.getContext('2d', { willReadFrequently: false });
    let dots = [];
    let mouse = { x: -1000, y: -1000 };
    let waves = [];
    let animationId = null;
    let lastTime = 0;
    const isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
    
    // Track skill dots separately for hover detection
    let skillDots = [];
    let hoveredSkillDot = null;
    
    // Dot class
    class Dot {
        constructor(x, y, layer, isSkillDot = false) {
            this.baseX = x;
            this.baseY = y;
            this.x = x;
            this.y = y;
            this.vx = 0;
            this.vy = 0;
            this.layer = layer;
            this.isSkillDot = isSkillDot;
            
            // Skill dot properties
            if (isSkillDot) {
                // Select category based on Y position using weighted random
                const pageHeight = document.documentElement.scrollHeight || document.body.scrollHeight;
                const yPercent = y / pageHeight;
                
                // Calculate weights for each category based on Y position
                // yPercent = 0 (top) uses topWeight, yPercent = 1 (bottom) uses bottomWeight
                const weights = skillCategories.map(cat => {
                    return cat.topWeight * (1 - yPercent) + cat.bottomWeight * yPercent;
                });
                const totalWeight = weights.reduce((sum, w) => sum + w, 0);
                
                // Weighted random selection
                let random = Math.random() * totalWeight;
                let category = skillCategories[0];
                for (let i = 0; i < skillCategories.length; i++) {
                    random -= weights[i];
                    if (random <= 0) {
                        category = skillCategories[i];
                        break;
                    }
                }
                
                // Pick a skill that hasn't been used yet (if possible)
                let availableSkills = category.skills.filter(s => !usedSkills.has(s));
                
                // If all skills in this category are used, try other categories
                if (availableSkills.length === 0) {
                    for (const cat of skillCategories) {
                        availableSkills = cat.skills.filter(s => !usedSkills.has(s));
                        if (availableSkills.length > 0) {
                            category = cat;
                            break;
                        }
                    }
                }
                
                // If ALL skills are used, reset and allow repeats
                if (availableSkills.length === 0) {
                    usedSkills.clear();
                    availableSkills = category.skills;
                }
                
                const skillName = availableSkills[Math.floor(Math.random() * availableSkills.length)];
                usedSkills.add(skillName);
                
                this.skillCategory = category.name;
                this.skillColor = category.color;
                this.skillName = skillName;
                this.baseOpacity = config.skillDotOpacity;
                this.baseSize = config.skillDotSize;
            } else {
                // Depth-based properties (handle single layer case)
                const depthRatio = config.depthLayers > 1 ? layer / (config.depthLayers - 1) : 0;
                this.baseOpacity = config.maxOpacity - (depthRatio * (config.maxOpacity - config.minOpacity));
                this.baseSize = config.maxSize - (depthRatio * (config.maxSize - config.minSize));
            }
            
            // Unique pulse offset
            this.pulseOffset = Math.random() * Math.PI * 2;
            this.pulseSpeed = config.pulseSpeed * (0.8 + Math.random() * 0.4);
        }
        
        update(time, deltaTime) {
            // Skill dots are NEVER affected by mouse gravity - they stay fixed
            // This prevents the mismatch between hover detection (base position)
            // and gravity (current position) that causes flickering
            if (!this.isSkillDot) {
                const dx = mouse.x - this.x;
                const dy = mouse.y - this.y;
                const distance = Math.sqrt(dx * dx + dy * dy);
                
                if (distance < config.mouseRadius && distance > 0) {
                    const force = (1 - distance / config.mouseRadius) * config.mouseStrength;
                    const depthFactor = 1 - (this.layer / config.depthLayers) * 0.5;
                    this.vx += (dx / distance) * force * depthFactor * 0.1;
                    this.vy += (dy / distance) * force * depthFactor * 0.1;
                }
            }
            
            // Wave effects (skill dots CAN be affected by waves - they're infrequent)
            for (const wave of waves) {
                const wdx = this.baseX - wave.x;
                const wdy = this.baseY - wave.y;
                const waveDistance = Math.sqrt(wdx * wdx + wdy * wdy);
                const waveRadius = wave.progress * wave.maxRadius;
                const waveWidth = 150;
                
                if (Math.abs(waveDistance - waveRadius) < waveWidth) {
                    const waveEffect = 1 - Math.abs(waveDistance - waveRadius) / waveWidth;
                    const angle = Math.atan2(wdy, wdx);
                    const strength = waveEffect * config.waveStrength * wave.strength;
                    const depthFactor = 1 - (this.layer / config.depthLayers) * 0.6;
                    this.vx += Math.cos(angle) * strength * depthFactor * 0.05;
                    this.vy += Math.sin(angle) * strength * depthFactor * 0.05;
                }
            }
            
            // Spring back to original position
            const returnDx = this.baseX - this.x;
            const returnDy = this.baseY - this.y;
            this.vx += returnDx * config.springStiffness;
            this.vy += returnDy * config.springStiffness;
            
            // Apply damping
            this.vx *= config.springDamping;
            this.vy *= config.springDamping;
            
            // Update position
            this.x += this.vx;
            this.y += this.vy;
        }
        
        draw(ctx, time) {
            // Pulsing opacity
            const pulse = Math.sin(time * this.pulseSpeed + this.pulseOffset);
            let opacity = this.baseOpacity + pulse * config.pulseIntensity;
            let size = this.baseSize + pulse * 0.2;
            
            // Determine color
            let color = config.color;
            if (this.isSkillDot) {
                color = this.skillColor;
                // Skill dots pulse more dramatically
                opacity = this.baseOpacity + pulse * 0.15;
                size = this.baseSize + pulse * 0.5;
                
                // Highlight if hovered
                if (hoveredSkillDot === this) {
                    opacity = 0.9;
                    size = this.baseSize * 1.5;
                }
            }
            
            // Set glow only if enabled (expensive!)
            if (config.glowRadius > 0) {
                ctx.shadowBlur = config.glowRadius * (1 + pulse * 0.3);
                ctx.shadowColor = `rgba(${color.r}, ${color.g}, ${color.b}, ${opacity * 0.5})`;
            }
            
            // Draw dot
            ctx.beginPath();
            ctx.arc(this.x, this.y, Math.max(0.5, size), 0, Math.PI * 2);
            ctx.fillStyle = `rgba(${color.r}, ${color.g}, ${color.b}, ${Math.max(0, opacity)})`;
            ctx.fill();
        }
    }
    
    // Wave class
    class Wave {
        constructor(x, y) {
            this.x = x;
            this.y = y;
            this.progress = 0;
            this.maxRadius = Math.max(canvas.width, canvas.height) * 1.5;
            this.strength = 1;
            this.startTime = performance.now();
        }
        
        update() {
            const elapsed = performance.now() - this.startTime;
            this.progress = Math.min(1, elapsed * config.waveSpeed);
            this.strength = 1 - (elapsed / config.waveDuration);
            return this.strength > 0;
        }
    }
    
    // Initialize canvas (full document height for scrolling)
    function initCanvas() {
        const dpr = window.devicePixelRatio || 1;
        const width = window.innerWidth;
        
        // Temporarily collapse canvas to get true content height
        // (prevents circular dependency where canvas height affects scrollHeight)
        canvas.style.height = '0px';
        
        // Now measure actual content height
        const height = Math.max(
            document.body.scrollHeight,
            document.documentElement.scrollHeight,
            window.innerHeight
        );
        
        canvas.style.width = width + 'px';
        canvas.style.height = height + 'px';
        canvas.width = width * dpr;
        canvas.height = height * dpr;
        ctx.setTransform(1, 0, 0, 1, 0, 0); // Reset transform before scaling
        ctx.scale(dpr, dpr);
    }
    
    // Generate dots (full document height)
    function generateDots() {
        dots = [];
        skillDots = [];
        usedSkills.clear(); // Reset skill tracking to prevent stale data
        const spacing = config.dotSpacing * (isMobile ? config.mobileMultiplier : 1);
        const pageWidth = window.innerWidth;
        const pageHeight = Math.max(
            document.body.scrollHeight,
            document.documentElement.scrollHeight,
            window.innerHeight
        );
        
        const cols = Math.ceil(pageWidth / spacing) + 2;
        const rows = Math.ceil(pageHeight / spacing) + 2;
        
        // For edge bias, use horizontal distance from center only
        const centerX = pageWidth / 2;
        
        for (let layer = config.depthLayers - 1; layer >= 0; layer--) {
            const layerOffset = layer * (spacing * 0.15);
            for (let i = -1; i < cols; i++) {
                for (let j = -1; j < rows; j++) {
                    const x = i * spacing + layerOffset + (Math.random() - 0.5) * 10;
                    const y = j * spacing + layerOffset + (Math.random() - 0.5) * 10;
                    
                    // Skill dots more likely at horizontal edges (left/right)
                    // Center of screen (x) has fewer skill dots
                    const distFromCenterX = Math.abs(x - centerX) / centerX;
                    const edgeBias = 0.2 + distFromCenterX * 1.0;
                    const adjustedChance = config.skillDotChance * edgeBias;
                    
                    const isSkillDot = Math.random() < adjustedChance;
                    const dot = new Dot(x, y, layer, isSkillDot);
                    dots.push(dot);
                    
                    if (isSkillDot) {
                        skillDots.push(dot);
                    }
                }
            }
        }
    }
    
    // Create ambient wave (within visible area + buffer)
    function createWave() {
        const x = Math.random() * window.innerWidth;
        // Create waves near the current scroll position for better effect
        const scrollY = window.scrollY;
        const y = scrollY + Math.random() * window.innerHeight;
        waves.push(new Wave(x, y));
    }
    
    // Animation loop
    function animate(currentTime) {
        updateFPS(currentTime);
        
        const deltaTime = currentTime - lastTime;
        lastTime = currentTime;
        
        // Clear canvas (full document height)
        const pageHeight = Math.max(
            document.body.scrollHeight,
            document.documentElement.scrollHeight,
            window.innerHeight
        );
        ctx.clearRect(0, 0, window.innerWidth, pageHeight);
        
        // Update waves
        waves = waves.filter(wave => wave.update());
        
        // Check for skill dot hover (use BASE position to avoid flicker)
        hoveredSkillDot = null;
        for (const dot of skillDots) {
            const dx = mouse.x - dot.baseX;
            const dy = mouse.y - dot.baseY;
            const distance = Math.sqrt(dx * dx + dy * dy);
            if (distance < config.skillHoverRadius) {
                hoveredSkillDot = dot;
                break;
            }
        }
        
        // Update tooltip (convert document coords to viewport coords)
        const leaderLinePath = document.getElementById('leaderLinePath');
        const leaderLineContainer = document.getElementById('skillLeaderLine');
        
        if (hoveredSkillDot) {
            const color = hoveredSkillDot.skillColor;
            const tooltipText = document.getElementById('skillTooltipText');
            
            skillTooltip.style.opacity = '1';
            leaderLineContainer.style.opacity = '1';
            
            // Exact dot position in viewport coordinates
            // Use baseX/baseY (stable position) not x/y (which could drift)
            // canvasRect already accounts for scroll (since canvas is position:absolute)
            const canvasRect = canvas.getBoundingClientRect();
            const dotX = canvasRect.left + hoveredSkillDot.baseX;
            const dotY = canvasRect.top + hoveredSkillDot.baseY;
            
            // Determine direction
            const isRightEdge = dotX > window.innerWidth - 180;
            const isUpperHalf = dotY < window.innerHeight / 2;
            
            // Line dimensions
            const diagX = 18;  // Horizontal distance of diagonal
            const diagY = 12;  // Vertical distance of diagonal
            const horizLen = 25; // Horizontal segment length
            
            // Calculate elbow and end points based on direction
            const dirX = isRightEdge ? -1 : 1;  // Left or right
            const dirY = isUpperHalf ? 1 : -1;   // Down or up
            
            const elbowX = dotX + (diagX * dirX);
            const elbowY = dotY + (diagY * dirY);
            const endX = elbowX + (horizLen * dirX);
            const endY = elbowY;
            
            // Draw the leader line: dot → elbow → end
            const points = `${dotX},${dotY} ${elbowX},${elbowY} ${endX},${endY}`;
            leaderLinePath.setAttribute('points', points);
            leaderLinePath.setAttribute('stroke', `rgb(${color.r}, ${color.g}, ${color.b})`);
            
            // Position tooltip at end of line
            if (isRightEdge) {
                skillTooltip.style.left = 'auto';
                skillTooltip.style.right = (window.innerWidth - endX + 6) + 'px';
            } else {
                skillTooltip.style.right = 'auto';
                skillTooltip.style.left = (endX + 6) + 'px';
            }
            skillTooltip.style.top = (endY - 14) + 'px'; // Center vertically on line end
            
            tooltipText.textContent = hoveredSkillDot.skillName;
            tooltipText.style.color = `rgb(${color.r}, ${color.g}, ${color.b})`;
        } else {
            skillTooltip.style.opacity = '0';
            leaderLineContainer.style.opacity = '0';
        }
        
        // Update and draw dots
        if (!prefersReducedMotion) {
            for (const dot of dots) {
                dot.update(currentTime, deltaTime);
            }
        }
        
        // Batch draw all dots (no glow for performance)
        for (const dot of dots) {
            dot.draw(ctx, currentTime);
        }
        
        animationId = requestAnimationFrame(animate);
    }
    
    // Event handlers
    function handleMouseMove(e) {
        // Account for scroll position since canvas is absolute, not fixed
        mouse.x = e.clientX;
        mouse.y = e.clientY + window.scrollY;
    }
    
    function handleMouseLeave() {
        mouse.x = -1000;
        mouse.y = -1000;
    }
    
    function handleResize() {
        initCanvas();
        generateDots();
    }
    
    // Device orientation for mobile
    function handleOrientation(e) {
        if (!e.gamma || !e.beta) return;
        const x = window.innerWidth / 2 + (e.gamma / 45) * (window.innerWidth / 2);
        // Add scrollY for document-space coordinates
        const viewportY = window.innerHeight / 2 + ((e.beta - 45) / 45) * (window.innerHeight / 2);
        mouse.x = Math.max(0, Math.min(window.innerWidth, x));
        mouse.y = Math.max(0, Math.min(window.innerHeight, viewportY)) + window.scrollY;
    }
    
    // Initialize
    function init() {
        initCanvas();
        generateDots();
        
        // Event listeners
        if (!isMobile) {
            document.addEventListener('mousemove', handleMouseMove, { passive: true });
            document.addEventListener('mouseleave', handleMouseLeave);
        } else {
            // Request device orientation permission on iOS
            if (typeof DeviceOrientationEvent !== 'undefined' && 
                typeof DeviceOrientationEvent.requestPermission === 'function') {
                // Will need user gesture to enable
                document.body.addEventListener('click', function enableOrientation() {
                    DeviceOrientationEvent.requestPermission()
                        .then(permission => {
                            if (permission === 'granted') {
                                window.addEventListener('deviceorientation', handleOrientation, { passive: true });
                            }
                        });
                    document.body.removeEventListener('click', enableOrientation);
                }, { once: true });
            } else {
                window.addEventListener('deviceorientation', handleOrientation, { passive: true });
            }
        }
        
        window.addEventListener('resize', handleResize, { passive: true });
        
        // Start ambient waves (only if motion is allowed)
        if (!prefersReducedMotion) {
            setInterval(createWave, config.waveInterval);
            // Initial wave after short delay
            setTimeout(createWave, 2000);
        }
        
        // Start animation
        animationId = requestAnimationFrame(animate);
    }
    
    // Start when page is fully loaded (ensures correct page height)
    if (document.readyState === 'complete') {
        init();
    } else {
        window.addEventListener('load', init);
    }
    
    // Cleanup on page hide (battery saving)
    document.addEventListener('visibilitychange', () => {
        if (document.hidden && animationId) {
            cancelAnimationFrame(animationId);
            animationId = null;
        } else if (!document.hidden && !animationId) {
            lastTime = performance.now();
            animationId = requestAnimationFrame(animate);
        }
    });
})();

// =========================================
// HERO TYPEWRITER EFFECT
// =========================================
(function() {
    'use strict';

    const typewriterEl = document.getElementById('typewriter');
    if (!typewriterEl) return;

    const phrases = ['85%', '4.8★', '400%↑'];
    let phraseIndex = 0;
    let charIndex = 0;
    let isDeleting = false;

    const typeSpeed = 150;
    const deleteSpeed = 100;
    const pauseAfterType = 2000;
    const pauseAfterDelete = 500;

    function tick() {
        const currentPhrase = phrases[phraseIndex];

        if (isDeleting) {
            // Remove a character
            typewriterEl.textContent = currentPhrase.substring(0, charIndex - 1);
            charIndex--;

            if (charIndex === 0) {
                isDeleting = false;
                phraseIndex = (phraseIndex + 1) % phrases.length;
                setTimeout(tick, pauseAfterDelete);
            } else {
                setTimeout(tick, deleteSpeed);
            }
        } else {
            // Add a character
            typewriterEl.textContent = currentPhrase.substring(0, charIndex + 1);
            charIndex++;

            if (charIndex === currentPhrase.length) {
                isDeleting = true;
                setTimeout(tick, pauseAfterType);
            } else {
                setTimeout(tick, typeSpeed);
            }
        }
    }

    // Start after page loads with a small delay
    setTimeout(tick, 1000);
})();
