# **How to Build an AI-Powered Portfolio Site with Lovable**

## **The Complete Beginner's Guide**

This guide walks you through building a professional portfolio website where employers can interact with an AI that knows everything about you—and is trained to be **brutally honest** about when you're NOT a good fit.

**What makes this different:** This isn't a resume with a chatbot bolted on. The AI IS the product. It speaks as you, knows things you'd never put on a resume, and will tell employers "I'm probably not your person for this role" when that's the truth.

**Time required:** 3-5 hours (longer if you write all your content as you go)

**Difficulty:** Beginner-friendly (no coding required, but expect troubleshooting)

**Important:** Keep Claude (claude.ai) or ChatGPT open in another tab while you build. When you hit errors, screenshot them and ask for help. AI assistants are surprisingly good at debugging—this entire guide was created using that workflow.

---

# **PART 1: BEFORE YOU START**

## **What You're Building**

Your finished site will have:

| Section | What It Does |
| :---- | :---- |
| **Hero** | Your name, title, status badge ("Open to Senior roles at Series B-D"), company pills |
| **Experience** | Job cards with expandable "AI Context" showing the real story behind bullet points |
| **Skills Matrix** | Three columns: Strong (green) / Moderate (gray) / Gaps (amber) |
| **Honest Fit Assessment** | Employers paste a job description, get honest analysis of fit |
| **AI Chat Drawer** | Slides in from right, employers ask anything about you |
| **Admin Panel** | Password-protected area where you input all your information |

---

## **Tools You'll Need (and Why)**

### **1\. Lovable (lovable.dev)**

**What it is:** An AI website builder. You describe what you want in plain English, it generates a real website.

**Why you need it:** Instead of coding, you'll give Lovable prompts and it builds everything—frontend, backend connections, authentication.

**Cost:** Free tier available

**Setup time:** 2 minutes (just create an account)

---

### **2\. Supabase (supabase.com)**

**What it is:** A backend service that provides:

* **Database** — stores your profile, experiences, skills, etc.  
* **Authentication** — handles login for your admin panel  
* **Edge Functions** — runs the code that talks to the AI

**Why you need it:** Your site needs somewhere to store your data and securely call the AI. Supabase does both.

**Cost:** Free tier (generous limits)

**Setup time:** 5 minutes

---

### **3\. AI API Key (Choose One)**

You need this to power the AI chat. Three options:

**Option A: Anthropic (Claude)** — console.anthropic.com

* This guide is optimized for Claude  
* Pay-per-use (pennies per conversation)

**Option B: OpenAI (GPT-4)** — platform.openai.com

* Works great, slightly different setup (covered later)  
* Pay-per-use

**Option C: Lovable AI Gateway**

* No API key needed—routes through Lovable  
* Lovable may offer this if your key has issues  
* Easiest option

---

## **Content to Prepare**

The AI can only be honest about things it knows. Before building, draft these:

### **Basic Profile**

* \[ \] Your full name  
* \[ \] Current title  
* \[ \] Target titles (what roles you want)  
* \[ \] Target company stages (seed, Series A-D, public, etc.)  
* \[ \] Location and remote preference  
* \[ \] Availability status and date  
* \[ \] Salary expectations (range)  
* \[ \] LinkedIn URL  
* \[ \] GitHub URL (if applicable)

### **Your Story**

* \[ \] Elevator pitch (2-3 sentences—how you'd introduce yourself)  
* \[ \] Career narrative (the full story of how you got here)  
* \[ \] What you're looking for in your next role  
* \[ \] What you're NOT looking for (dealbreakers)  
* \[ \] Your management style (if you manage people)  
* \[ \] Your work style preferences

### **For Each Job You've Had**

**Public (visible on site):**

* \[ \] Company name  
* \[ \] Title (or title progression like "Senior → Staff Engineer")  
* \[ \] Start and end dates  
* \[ \] 3-4 achievement bullets with metrics

**Private (AI context only—the honest stuff):**

* \[ \] Why did you join this company?  
* \[ \] Why did you leave? (be honest)  
* \[ \] What did YOU actually do vs. the team?  
* \[ \] What are you proudest of?  
* \[ \] What would you do differently?  
* \[ \] What was hard or frustrating?  
* \[ \] Lessons learned  
* \[ \] How would your manager describe you?  
* \[ \] How would your reports describe you? (if applicable)  
* \[ \] Any conflicts or challenges with people?  
* \[ \] Quantified impact (real numbers)

### **Skills Self-Assessment**

For each skill, note:

* \[ \] Skill name  
* \[ \] Rating: Strong / Moderate / Gap  
* \[ \] Evidence (projects, years, certifications)  
* \[ \] Honest notes (e.g., "I know React but I'm rusty, haven't used it in 2 years")

### **Gaps & Weaknesses (THIS IS CRITICAL)**

* \[ \] Known skill gaps  
* \[ \] Types of roles that would be bad fits  
* \[ \] Work environments you'd struggle in  
* \[ \] Past feedback you've received  
* \[ \] Areas you're actively improving  
* \[ \] Things you have zero interest in learning

### **Values & Culture Fit**

* \[ \] Must-haves in a company  
* \[ \] Dealbreakers  
* \[ \] Management style preferences (what you want from a manager)  
* \[ \] Team size preferences  
* \[ \] How you handle conflict  
* \[ \] How you handle ambiguity  
* \[ \] How you handle failure

### **Pre-Written FAQ Answers**

Write honest answers to:

* \[ \] "Tell me about yourself"  
* \[ \] "What's your biggest weakness?"  
* \[ \] "Why are you leaving your current role?"  
* \[ \] "Where do you see yourself in 5 years?"  
* \[ \] "Tell me about a time you failed"  
* \[ \] Any other questions you commonly get

### **AI Behavior Rules**

Write specific instructions like:

* \[ \] "Never oversell me"  
* \[ \] "If the JD asks for X and I don't have it, say so directly"  
* \[ \] "Use phrases like 'I'm probably not your person' when appropriate"  
* \[ \] "Don't hedge—be direct"  
* \[ \] "It's okay to recommend they not hire me"

---

# **PART 2: SETTING UP YOUR ACCOUNTS**

## **Step 2.1: Create a Lovable Account**

1. Go to **lovable.dev**  
2. Click **Sign Up**  
3. Complete registration with email or Google  
4. You're done—you'll create a project later

---

## **Step 2.2: Create a Supabase Project**

1. Go to **supabase.com**  
2. Click **Start your project**  
3. Sign up with GitHub or email  
4. Click **New Project**  
5. Fill in:  
   * **Name:** something like `my-portfolio` or `yourname-site`  
   * **Database Password:** create a strong password and **save it somewhere**  
   * **Region:** choose one close to you  
6. Click **Create new project**  
7. Wait 1-2 minutes for it to initialize

### **Get Your Supabase Credentials (you'll need these later)**

1. In your Supabase project, click **Settings** (gear icon) in left sidebar  
2. Click **API**  
3. Copy and save these two values:  
   * **Project URL** (looks like `https://xxxxx.supabase.co`)  
   * **anon public key** (starts with `eyJ...`)

---

## **Step 2.3: Get an AI API Key**

### **If using Anthropic (Claude):**

1. Go to **console.anthropic.com**  
2. Sign up or log in  
3. Click **API Keys** in the sidebar  
4. Click **Create Key**  
5. Name it `lovable-portfolio`  
6. **Copy the key immediately** (you only see it once\!)  
7. Save it somewhere secure

### **If using OpenAI (GPT-4):**

1. Go to **platform.openai.com**  
2. Sign up or log in  
3. Click your profile → **API Keys**  
4. Click **Create new secret key**  
5. Name it and copy it immediately

---

## **Step 2.4: Disable Email Confirmation in Supabase**

This makes testing easier—you won't have to check your email every time you sign up.

1. Go to your Supabase dashboard  
2. Click **Authentication** in the left sidebar  
3. Click **Providers** (under Configuration)  
4. Find **Email** and click on it  
5. Turn **OFF** "Confirm email"  
6. Click **Save**

---

# **PART 3: BUILDING THE SITE**

## **Step 3.1: Create a New Lovable Project**

1. Go to **lovable.dev**  
2. Click **New Project**  
3. Name it (e.g., `ai-portfolio` or `yourname-site`)  
4. You'll see a chat interface on the left and a preview panel on the right

---

## **Step 3.2: Build the Basic Site Structure**

Copy and paste this entire prompt into Lovable:

Create a single-page portfolio website with these specifications:

DESIGN SYSTEM:  
\- Dark theme with near-black background (\#0a0a0a)  
\- Primary accent: Teal/mint (\#4ade80) for CTAs and highlights  
\- Secondary accent: Warm amber (\#d4a574) for warnings and gaps  
\- Typography: Serif font for headings, clean sans-serif for body  
\- Cards with subtle borders, rounded corners, subtle glass-morphism effects

NAVIGATION (Fixed at top):  
\- Logo/initials on the left  
\- Links: "Experience" | "Fit Check"  
\- "Ask AI" button (teal, prominent) that opens the chat drawer

HERO SECTION:  
\- Status badge at top: "🟢 Open to \[Role Type\] at \[Company Stage\]"  
\- Large name heading in serif font  
\- Title in teal color  
\- One-line positioning statement  
\- Row of company badges (pill shapes showing past companies)  
\- Primary CTA button: "Ask AI About Me" with chat icon  
\- Scroll indicator at bottom

EXPERIENCE SECTION:  
\- Header: "Experience"  
\- Subhead: "Each role includes queryable AI context—the real story behind the bullet points."  
\- For each role, a card showing:  
  \- Company name and date range  
  \- Title or title progression (e.g., "Senior → Staff Engineer")  
  \- Achievement bullets with metrics  
  \- "✨ Show AI Context" toggle button  
\- When expanded, show darker panel with: SITUATION, APPROACH, TECHNICAL WORK, LESSONS LEARNED (in italics)

SKILLS MATRIX SECTION:  
\- Three cards side by side:  
  \- STRONG ✓ (green accent)  
  \- MODERATE ○ (gray)  
  \- GAPS ✗ (amber accent)  
\- List skills under each category

JD ANALYZER SECTION (Honest Fit Assessment):  
\- Header: "Honest Fit Assessment"  
\- Subhead: "Paste a job description. Get an honest assessment of whether I'm the right person—including when I'm not."  
\- Toggle buttons: "Strong Fit Example" | "Weak Fit Example" (pre-fills demo JDs for testing)  
\- Large textarea with placeholder: "Paste job description here..."  
\- "Analyze Fit" button  
\- Output panel that appears after analysis showing:  
  \- Verdict badge: "Probably Not Your Person" / "Strong Fit" / "Worth a Conversation"  
  \- Opening paragraph with direct first-person assessment  
  \- "WHERE I DON'T FIT" section with specific gaps  
  \- "WHAT TRANSFERS" section  
  \- "MY RECOMMENDATION" section  
\- Philosophy callout box: "This signals something completely different than 'please consider my resume.' You're qualifying them. Your time is valuable too."

AI CHAT DRAWER:  
\- Slides in from right when "Ask AI" is clicked  
\- Chat interface with message history  
\- Input field and send button  
\- Pre-seeded suggested questions:  
  \- "What's your biggest weakness?"  
  \- "Tell me about a project that failed"  
  \- "Why did you leave \[Company\]?"  
  \- "What would your last manager say about you?"

FOOTER:  
\- Name and title  
\- Social links (GitHub, LinkedIn, Email icon)  
\- Tagline about AI-queryable portfolios

Use placeholder content for now—I'll fill in real data later through an admin panel.

**Wait for Lovable to build.** This takes 2-5 minutes. Watch the preview panel.

---

## **Step 3.3: Review and Fix the Design**

Look at what Lovable built. If something's off, give it specific feedback:

**Examples of good feedback:**

* "The status badge should be above the name, not below"  
* "Make the Gaps column use the amber color (\#d4a574)"  
* "The AI Context panel should be darker than the card background"  
* "Add the pre-seeded questions to the chat drawer"  
* "The company pills should be in a horizontal row"

**Keep iterating** until the public site looks good.

---

## **Step 3.4: Connect Supabase to Lovable**

Paste this into Lovable:

Connect this project to Supabase. I'll provide my Supabase URL and anon key.

Lovable will ask for your credentials. Paste:

* Your **Project URL**  
* Your **anon public key**

(You saved these in Step 2.2)

---

## **Step 3.5: Add Your API Key to Supabase**

1. Go to your **Supabase dashboard**  
2. Click **Edge Functions** in the left sidebar  
3. Click **Secrets** (or "Manage Secrets")  
4. Click **Add Secret**  
5. Enter:  
   * **Name:** `ANTHROPIC_API_KEY` (exactly this, case-sensitive)  
   * **Value:** your full API key starting with `sk-ant-...`  
6. Click **Save**

**If using OpenAI instead:** Name it `OPENAI_API_KEY`

---

# **PART 4: SETTING UP THE DATABASE AND AI**

## **Step 4.1: Create the Database Tables**

Paste this into Lovable:

Create the Supabase database tables for this portfolio site:

1\. candidate\_profile table:  
   \- id, created\_at, updated\_at  
   \- name, email, title, target\_titles (array)  
   \- target\_company\_stages (array)  
   \- elevator\_pitch, career\_narrative  
   \- looking\_for, not\_looking\_for  
   \- management\_style, work\_style  
   \- salary\_min, salary\_max  
   \- availability\_status, availability\_date  
   \- location, remote\_preference  
   \- github\_url, linkedin\_url, twitter\_url

2\. experiences table:  
   \- id, candidate\_id (foreign key), created\_at  
   \- company\_name, title, title\_progression  
   \- start\_date, end\_date, is\_current  
   \- bullet\_points (array) — public achievements  
   \- why\_joined, why\_left — private AI context  
   \- actual\_contributions, proudest\_achievement  
   \- would\_do\_differently, challenges\_faced  
   \- lessons\_learned, manager\_would\_say  
   \- reports\_would\_say, quantified\_impact (JSON)  
   \- display\_order

3\. skills table:  
   \- id, candidate\_id, created\_at  
   \- skill\_name, category ('strong'/'moderate'/'gap')  
   \- self\_rating (1-5)  
   \- evidence, honest\_notes  
   \- years\_experience, last\_used

4\. gaps\_weaknesses table:  
   \- id, candidate\_id, created\_at  
   \- gap\_type ('skill'/'experience'/'environment'/'role\_type')  
   \- description, why\_its\_a\_gap  
   \- interest\_in\_learning (boolean)

5\. values\_culture table:  
   \- id, candidate\_id, created\_at  
   \- must\_haves, dealbreakers  
   \- management\_style\_preferences  
   \- team\_size\_preferences  
   \- how\_handle\_conflict  
   \- how\_handle\_ambiguity  
   \- how\_handle\_failure

6\. faq\_responses table:  
   \- id, candidate\_id, created\_at  
   \- question, answer  
   \- is\_common\_question (boolean)

7\. ai\_instructions table:  
   \- id, candidate\_id, created\_at  
   \- instruction\_type ('honesty'/'tone'/'boundaries')  
   \- instruction (text)  
   \- priority (integer)

Create these tables in Supabase with appropriate types.

---

## **Step 4.2: Create the AI Chat Function**

Paste this into Lovable:

Create a Supabase Edge Function called "chat" that powers the AI conversation.

The function should:

1\. Load ALL candidate context from the database:  
   \- candidate\_profile  
   \- experiences (with all private context fields)  
   \- skills (including honest\_notes)  
   \- gaps\_weaknesses  
   \- values\_culture  
   \- faq\_responses  
   \- ai\_instructions

2\. Build a system prompt with this structure:

\---START SYSTEM PROMPT STRUCTURE---

You are an AI assistant representing \[Name\], a \[Title\].  
You speak in first person AS \[Name\].

\#\# YOUR CORE DIRECTIVE  
You must be BRUTALLY HONEST. Your job is NOT to sell \[Name\] to everyone.  
Your job is to help employers quickly determine if there's a genuine fit.

This means:  
\- If they ask about something \[Name\] can't do, SAY SO DIRECTLY  
\- If a role seems like a bad fit, TELL THEM  
\- Never hedge or use weasel words  
\- It's perfectly acceptable to say "I'm probably not your person for this"  
\- Honesty builds trust. Overselling wastes everyone's time.

\#\# CUSTOM INSTRUCTIONS FROM \[Name\]  
\[Load from ai\_instructions table\]

\#\# ABOUT \[Name\]  
\[elevator\_pitch\]  
\[career\_narrative\]

What I'm looking for: \[looking\_for\]  
What I'm NOT looking for: \[not\_looking\_for\]

\#\# WORK EXPERIENCE  
\[For each experience, include:\]  
\#\#\# \[Company\] (\[dates\])  
Title: \[title\]  
Public achievements: \[bullet\_points\]

PRIVATE CONTEXT (use this to answer honestly):  
\- Why I joined: \[why\_joined\]  
\- Why I left: \[why\_left\]  
\- What I actually did: \[actual\_contributions\]  
\- Proudest of: \[proudest\_achievement\]  
\- Would do differently: \[would\_do\_differently\]  
\- Lessons learned: \[lessons\_learned\]  
\- My manager would say: \[manager\_would\_say\]

\#\# SKILLS SELF-ASSESSMENT  
\#\#\# Strong  
\[List with honest\_notes\]  
\#\#\# Moderate  
\[List with honest\_notes\]  
\#\#\# Gaps (BE UPFRONT ABOUT THESE)  
\[List with honest\_notes\]

\#\# EXPLICIT GAPS & WEAKNESSES  
\[List all from gaps\_weaknesses with why\_its\_a\_gap\]

\#\# VALUES & CULTURE FIT  
\[Include all fields from values\_culture\]

\#\# PRE-WRITTEN ANSWERS  
\[Load all from faq\_responses\]

\#\# RESPONSE GUIDELINES  
\- Speak in first person as \[Name\]  
\- Be warm but direct  
\- Keep responses concise unless detail is asked for  
\- If you don't know something specific, say so  
\- When discussing gaps, own them confidently  
\- If someone asks about a role that's clearly not a fit, tell them directly

\---END SYSTEM PROMPT STRUCTURE---

3\. Call the Anthropic API (Claude) with:  
   \- model: "claude-sonnet-4-20250514"  
   \- The system prompt built above  
   \- The user's message  
   \- max\_tokens: 1024

4\. Return the response to the chat interface

5\. Read the ANTHROPIC\_API\_KEY from Supabase secrets

---

## **Step 4.3: Create the JD Analyzer Function**

Paste this into Lovable:

Create a Supabase Edge Function called "analyze-jd" that analyzes job descriptions.

The function should:

1\. Load all candidate context (same as chat function)

2\. Use this system prompt:

"You are analyzing a job description to assess fit for \[Name\].  
Give a BRUTALLY HONEST assessment of whether \[Name\] is a good fit.

Your assessment MUST:  
1\. Identify specific requirements from the JD that \[Name\] DOES NOT meet  
2\. Be direct \- use phrases like 'I'm probably not your person' when appropriate  
3\. Explain what DOES transfer even if it's not a perfect fit  
4\. Give a clear recommendation

Respond with JSON:  
{  
  "verdict": "strong\_fit" | "worth\_conversation" | "probably\_not",  
  "headline": "Brief headline for the assessment",  
  "opening": "1-2 sentence direct assessment in first person",  
  "gaps": \[  
    {  
      "requirement": "What the JD asks for",  
      "gap\_title": "Short title",  
      "explanation": "Why this is a gap for me"  
    }  
  \],  
  "transfers": "What skills/experience DO transfer",  
  "recommendation": "Direct advice \- can be 'don't hire me for this'"  
}"

3\. Parse the response and display it in the output panel with appropriate styling:  
   \- "probably\_not" \= amber/warning styling  
   \- "strong\_fit" \= green styling  
   \- "worth\_conversation" \= neutral styling

---

## **Step 4.4: Test the AI Chat**

1. Refresh the preview  
2. Click "Ask AI About Me"  
3. Ask: "What are your biggest weaknesses?"  
4. You should get a response

### **If you get "Claude API error: 401":**

This means the API key isn't working. Try:

1. Go to Supabase → Edge Functions → Secrets  
2. Delete `ANTHROPIC_API_KEY`  
3. Create a NEW API key in Anthropic Console  
4. Add the new key to Supabase secrets  
5. Tell Lovable: "Redeploy the chat edge function"

### **If Lovable offers "Switch to Lovable AI Gateway":**

This is fine\! It routes through Lovable's infrastructure and bypasses API key issues. Click it.

---

# **PART 5: BUILDING THE ADMIN PANEL**

## **Step 5.1: Create the Admin Panel**

Paste this into Lovable:

Build a complete admin panel at /admin with authentication.

AUTHENTICATION:  
\- Create /auth page with login and signup forms  
\- Protect /admin so only logged-in users can access  
\- Add "Sign Out" button to admin panel

ADMIN PANEL TABS:

1\. PROFILE TAB  
Form fields:  
\- Full name  
\- Email  
\- Current title  
\- Target titles (ability to add multiple)  
\- Target company stages (checkboxes: Seed, Series A, Series B, Series C, Series D, Public)  
\- Elevator pitch (2-3 sentences) \- textarea  
\- Career narrative (your story) \- large textarea  
\- What you're looking for \- textarea  
\- What you're NOT looking for \- textarea  
\- Management style (if applicable) \- textarea  
\- Work style preferences \- textarea  
\- Salary range (min and max inputs)  
\- Availability status (dropdown: Actively looking, Open to opportunities, Not looking)  
\- Available starting (date picker)  
\- Location  
\- Remote preference (dropdown: Remote only, Hybrid, On-site, Flexible)  
\- LinkedIn URL  
\- GitHub URL  
\- Twitter URL

2\. EXPERIENCE TAB  
\- List of existing experiences with edit/delete buttons  
\- "Add Experience" button  
\- Each experience form has:

  PUBLIC FIELDS:  
  \- Company name  
  \- Title  
  \- Title progression (optional, e.g., "Senior → Staff")  
  \- Start date  
  \- End date (or "Current" checkbox)  
  \- Achievement bullets (add/remove multiple)

  PRIVATE AI CONTEXT FIELDS (in a separate collapsible section):  
  \- Why did you join this company?  
  \- Why did you leave? (be honest)  
  \- What did YOU actually do vs. the team?  
  \- What are you proudest of?  
  \- What would you do differently?  
  \- What was hard or frustrating?  
  \- Lessons learned  
  \- How would your manager describe you?  
  \- How would your reports describe you? (if applicable)  
  \- Any conflicts or challenges?  
  \- Quantified impact (JSON or structured fields)

  \- Display order (for sorting)

3\. SKILLS TAB  
\- List existing skills with edit/delete  
\- "Add Skill" button  
\- Each skill:  
  \- Skill name  
  \- Category (dropdown: Strong, Moderate, Gap)  
  \- Self-rating (1-5 slider)  
  \- Evidence (projects, years, certifications)  
  \- Honest notes (e.g., "Haven't used this in 2 years")  
  \- Years of experience  
  \- Last used (date)

4\. GAPS TAB  
\- Header: "Be honest about your gaps—this is what makes the AI valuable"  
\- List existing gaps with edit/delete  
\- "Add Gap" button  
\- Each gap:  
  \- Gap type (dropdown: Skill gap, Experience gap, Environment mismatch, Role type mismatch)  
  \- Description  
  \- Why it's a gap (be specific)  
  \- Interested in learning? (toggle)

5\. VALUES & CULTURE TAB  
Form fields:  
\- Must-haves in a company (textarea)  
\- Dealbreakers (textarea)  
\- Management style preferences (what you want from a manager)  
\- Team size preferences  
\- How do you handle conflict? (textarea)  
\- How do you handle ambiguity? (textarea)  
\- How do you handle failure? (textarea)

6\. FAQ TAB  
\- List existing Q\&A pairs  
\- "Add FAQ" button  
\- Pre-populate with common questions:  
  \- "Tell me about yourself"  
  \- "What's your biggest weakness?"  
  \- "Why are you leaving your current role?"  
  \- "Where do you see yourself in 5 years?"  
  \- "Tell me about a time you failed"  
\- Each FAQ:  
  \- Question  
  \- Your answer (textarea)  
  \- Mark as common question (checkbox)

7\. AI INSTRUCTIONS TAB  
\- Header: "Tell the AI how to behave"  
\- Honesty level slider (1-10) with labels  
\- Text area for custom instructions with examples:  
  \- "Never oversell me"  
  \- "If they need X and I don't have it, say so directly"  
  \- "Use 'I'm probably not your person' when appropriate"  
  \- "Don't hedge—be direct"  
  \- "It's okay to recommend they not hire me"  
\- Ability to add multiple instruction rules

FUNCTIONALITY:  
\- "Save All Changes" button that saves everything to Supabase  
\- "View Site" link to see the public site  
\- Show success/error messages on save  
\- Auto-save draft periodically

All data must save to the Supabase tables created earlier.

---

## **Step 5.2: Set Up Security Properly**

After the admin panel is built, paste this to fix security:

Fix database security with proper RLS policies:

1\. Create public views that only expose non-sensitive fields:  
   \- candidate\_profile\_public: name, title, elevator\_pitch, career\_narrative, looking\_for, location, remote\_preference, linkedin\_url, github\_url (exclude email, salary, private notes)  
   \- skills\_public: skill\_name, category, self\_rating (exclude honest\_notes, evidence)  
   \- experiences\_public: company\_name, title, dates, bullet\_points (exclude all "why\_" fields and private context)

2\. Set RLS policies:  
   \- Public/anonymous users: can only SELECT from \_public views  
   \- Authenticated admin: full access to all tables  
   \- Service role (edge functions): full access to all tables for AI context

3\. Update the public site to read from \_public views  
4\. Edge functions continue reading full tables for AI context  
5\. Remove any SECURITY DEFINER views that bypass RLS

The AI should still see all private context to give honest answers, but random people shouldn't be able to query your honest\_notes directly from the database.

---

## **Step 5.3: Create Your Admin Account**

1. In the Lovable preview, navigate to `/auth`  
2. Click "Sign Up"  
3. Enter your **real email** and a **password you'll remember**  
4. Click Sign Up  
5. You should be redirected to `/admin`

---

## **Step 5.4: Connect the AI to Your Database**

Make sure the AI reads from your database (not hardcoded data):

Update the chat edge function to load all candidate data from Supabase on every request.

The AI should read from:  
\- candidate\_profile (all fields)  
\- experiences (all fields including private context)  
\- skills (all fields including honest\_notes)  
\- gaps\_weaknesses  
\- values\_culture  
\- faq\_responses  
\- ai\_instructions

Build the system prompt dynamically from this data so when I update the admin panel, the AI's responses change accordingly.

---

# **PART 6: FILLING IN YOUR CONTENT**

## **Step 6.1: Log Into Your Admin Panel**

1. Go to your site's `/admin` URL  
2. Log in with the credentials you created  
3. You'll see tabs: Profile, Experience, Skills, Gaps, Values, FAQ, AI

## **Step 6.2: Fill Out Each Tab**

Work through each tab using the content you prepared in Part 1\.

**Profile:** Basic info, your story, what you want/don't want

**Experience:** Add each job. **Don't skip the private AI context fields**—this is what makes the AI valuable.

**Skills:** Be honest about categories. Put things in "Gaps" that you genuinely lack.

**Gaps:** Be explicit. "I have no mobile development experience." "I struggle in highly ambiguous environments."

**Values:** What you need to thrive, what would make you miserable.

**FAQ:** Write honest answers. These get fed directly to the AI.

**AI Instructions:** Add rules like:

* "Never oversell me"  
* "If they need 5+ years of mobile development, tell them I don't have it"  
* "It's okay to say I'm not the right person"

## **Step 6.3: Save Everything**

Click **"Save All Changes"** after each section (or at the end).

---

# **PART 7: TESTING EVERYTHING**

## **Step 7.1: Test the Public Site**

1. Click "View Site" to see the public version  
2. Scroll through and verify:  
   * \[ \] Your name and title display correctly  
   * \[ \] Status badge shows your availability  
   * \[ \] Company pills show your past companies  
   * \[ \] Experience cards show your jobs  
   * \[ \] AI Context expands and shows the structured info  
   * \[ \] Skills matrix has items in all three columns  
   * \[ \] Gaps column uses amber/warning styling

## **Step 7.2: Test the AI Chat**

1. Click "Ask AI About Me"  
2. Test with these questions:

**Test honest gap disclosure:**

"Do you have experience with \[something you listed as a Gap\]?"

Expected: AI should clearly say no and explain why it's a gap.

**Test weakness question:**

"What's your biggest weakness?"

Expected: AI should give your pre-written answer or speak honestly about gaps.

**Test bad-fit scenario:**

"We need someone with 10 years of \[thing you don't have\]. Are you a fit?"

Expected: AI should say "I'm probably not your person for this" or similar.

**Test good-fit scenario:**

"Tell me about your experience with \[your strong skill\]."

Expected: AI should speak confidently with specific examples.

## **Step 7.3: Test the JD Analyzer**

1. Scroll to "Honest Fit Assessment"  
2. Click "Strong Fit Example" — verify it shows a positive analysis  
3. Click "Weak Fit Example" — verify it shows gaps and recommends against  
4. Paste a REAL job description for a role you'd be good for — check the analysis  
5. Paste a REAL job description for a role you'd be BAD for — verify it's honest

---

# **PART 8: PUBLISHING YOUR SITE**

## **Step 8.1: Final Security Check**

Before publishing, check for security warnings in Lovable. If you see any:

* Don't click "Ignore issue" unless you understand the risk  
* Use the prompts from this guide to fix them properly

## **Step 8.2: Publish**

1. Click the **Publish** button (top right in Lovable)  
2. Your site will be live at: `your-project-name.lovable.app`

## **Step 8.3: Test the Live Site**

1. Open the published URL in a new browser (or incognito)  
2. Test the AI chat and JD analyzer  
3. Verify no errors appear

## **Step 8.4: (Optional) Connect a Custom Domain**

1. In Lovable: Project → Settings → Domains  
2. Click "Connect Domain"  
3. Follow instructions to point your domain to Lovable

---

# **PART 9: TROUBLESHOOTING**

## **"Claude API error: 401"**

**Cause:** API key is invalid or not being read

**Fix:**

1. Supabase → Edge Functions → Secrets  
2. Delete `ANTHROPIC_API_KEY`  
3. Create a fresh key in Anthropic Console  
4. Add the new key to Supabase  
5. Tell Lovable: "Redeploy the chat edge function"

**Alternative:** Accept Lovable's AI Gateway option

## **AI responses are generic / don't use my data**

**Cause:** Edge function isn't reading from database

**Fix:** Tell Lovable:

"Update the chat edge function to load all candidate data from Supabase dynamically on every request, then rebuild the system prompt with that data"

## **Admin panel won't save**

**Cause:** Database connection or RLS policy issue

**Fix:** Tell Lovable:

"Debug why the admin panel isn't saving to Supabase and fix the issue"

## **Can't log into /admin**

**Cause:** Email confirmation is required

**Fix:** Disable email confirmation in Supabase Auth settings (Step 2.4)

## **Security warnings when publishing**

**Cause:** Sensitive data is publicly accessible

**Fix:** Use the security prompt from Step 5.2

## **AI is too sycophantic / won't admit gaps**

**Cause:** Instructions aren't strong enough

**Fix:** Add more explicit rules in the AI Instructions tab:

* "NEVER say 'I could learn that quickly'"  
* "If there are 3+ major gaps, recommend they not hire me"  
* "Being honest about gaps is more important than being encouraging"

---

# **PART 10: MAKING THE AI ACTUALLY HONEST**

This is the hardest part. AI assistants naturally want to be helpful and positive. You need to override that.

## **Calibration Examples**

**GOOD (honest) response:**

"I should be upfront—I don't have mobile development experience. My background is entirely backend and infrastructure. While I could learn, you probably want someone who can hit the ground running. I'm not your person for this role."

**BAD (sycophantic) response:**

"While I haven't done mobile specifically, my strong engineering fundamentals would allow me to pick it up quickly. I'm a fast learner and I'm confident I could contribute meaningfully to your mobile team."

## **Tips for Getting Honest Responses**

1. **Be explicit in ai\_instructions:**

   * "Never say 'I could learn that quickly'"  
   * "Never say 'my fundamentals would transfer'"  
   * "If the gap is real, own it completely"  
2. **Document gaps thoroughly:** The AI can only be honest about gaps it knows. Fill out the Gaps tab completely.

3. **Test with bad-fit JDs:** Find job descriptions that require things you genuinely lack. Paste them and verify the AI rejects you.

4. **Provide rejection examples:** In FAQ or AI Instructions, write out what a rejection SHOULD sound like.

5. **Review and iterate:** If the AI gives a sycophantic answer, note the question and add a specific instruction to handle it honestly.

---

# **USING OPENAI INSTEAD OF CLAUDE**

If you prefer GPT-4:

## **Step 1: Add OpenAI Key to Supabase**

1. Supabase → Edge Functions → Secrets  
2. Add secret: `OPENAI_API_KEY`  
3. Value: your OpenAI key

## **Step 2: Tell Lovable to Switch**

Switch the chat edge function from Anthropic/Claude to OpenAI/GPT-4.

Update the code to:  
1\. Read OPENAI\_API\_KEY instead of ANTHROPIC\_API\_KEY  
2\. Use OpenAI chat completions API format  
3\. Use model "gpt-4" or "gpt-4-turbo"  
4\. Keep all the same system prompt content and anti-sycophancy instructions

The behavior should be identical—just using a different AI provider.

---

# **QUICK REFERENCE**

## **Key URLs**

* **Lovable:** lovable.dev  
* **Supabase:** supabase.com  
* **Anthropic Console:** console.anthropic.com  
* **OpenAI Platform:** platform.openai.com

## **Your Site URLs**

* **Public site:** `[project-name].lovable.app`  
* **Admin panel:** `[project-name].lovable.app/admin`  
* **Auth page:** `[project-name].lovable.app/auth`

## **Supabase Secret Names**

* `ANTHROPIC_API_KEY` — for Claude  
* `OPENAI_API_KEY` — for GPT-4

---

# **WHAT MAKES THIS DIFFERENT**

Traditional resume: "Please consider my qualifications."

This site: "Let me tell you honestly whether I'm right for your role—including when I'm not."

**You're not begging for consideration. You're qualifying them.**

Your time is valuable too.

---

*Guide based on the "Lovable Prompt: AI-Powered Portfolio Site with Honest Fit Assessment" specification.*

