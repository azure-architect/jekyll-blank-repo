# Quick Start Guide

## For New Client Projects

### 1. Clone Template
```bash
git clone [template-repo-url] client-project-name
cd client-project-name
```

### 2. Run Setup Script
```bash
# Ensure Ruby 3.4.1 is active (with chruby)
./scaffold-jekyll-site.sh
```

### 3. Start Development
```bash
bundle exec jekyll serve --livereload
```

### 4. Customize Content
- Edit `_config.yml` for client details
- Update all `_includes/*.html` files with client content
- See `templates/example-customization.md` for guidance

### 5. Deploy
```bash
# Initialize git for client project
git init
git add .
git commit -m "Initial client landing page"

# Deploy to GitHub Pages or preferred hosting
```

## Agent System

Load Jekyll development agent:
```bash
load jekyll
```

Available commands:
- `*serve` - Start development server
- `*build` - Build for production
- `*create-page` - Add new pages
- `*deploy` - Deploy to hosting

## File Structure After Setup

```
client-project/
├── _config.yml
├── index.html                  # Main landing page
├── about.html
├── contact.html
├── _layouts/
│   └── default.html
├── _includes/
│   ├── header.html
│   ├── hero.html              # Section 1
│   ├── quick-wins.html        # Section 2
│   ├── problem-agitation.html # Section 3
│   ├── solution-intro.html    # Section 4
│   ├── benefits.html          # Section 5
│   ├── testimonials.html      # Section 6
│   ├── process.html           # Section 7
│   ├── flex-section.html      # Section 8
│   ├── features.html          # Section 9
│   ├── faq.html              # Section 10
│   ├── final-cta.html
│   └── footer.html
└── assets/
    └── js/
        ├── tailwind.min.js    # Local TailwindCSS
        └── alpine.min.js      # Local Alpine.js
```

## Business Workflow

1. **Client Consultation** - Understand business and goals
2. **Clone Template** - Start with proven conversion structure
3. **Run Setup Script** - Create complete Jekyll site
4. **Customize Content** - Tailor to client's business and audience
5. **Test & Optimize** - Ensure conversion flow works
6. **Deploy & Deliver** - Launch professional landing page

**Average Timeline: 2-4 hours from setup to delivery**