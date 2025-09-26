# Standard Website Requirements for Jekyll Sites

## Core Layout Structure

### 1. Sticky Footer Implementation
**Requirement**: Footer must stick to bottom of viewport on tall screens
**Implementation**:
```html
<body class="min-h-screen flex flex-col">
  {% include header.html %}
  <main class="flex-grow">
    {{ content }}
  </main>
  {% include footer.html %}
</body>
```

### 2. Header/Footer Structure
**Requirement**: Single header and footer managed by layout, not individual pages
**Implementation**:
- Default layout includes header and footer
- Individual pages contain only main content
- No duplicate `{% include header.html %}` or `{% include footer.html %}` in pages

### 3. Responsive Navigation
**Requirement**: Functional mobile menu with hamburger button
**Implementation**:
- Alpine.js powered mobile menu toggle
- Hamburger menu for mobile/tablet
- Proper navigation links that work from any page
- Logo/brand clickable to homepage

## Typography Standards

### 1. Local Font Hosting
**Requirement**: Self-hosted fonts for performance and privacy
**Implementation**:
- TTF/WOFF2 fonts in `/assets/fonts/`
- @font-face declarations in `/assets/css/fonts.css`
- Font preloading for critical fonts
- CSS custom properties for consistent usage

### 2. Font Loading
**Requirement**: Proper font loading without FOUC
**Implementation**:
```html
<link rel="preload" href="/assets/fonts/font-regular.ttf" as="font" type="font/ttf" crossorigin>
<link rel="stylesheet" href="/assets/css/fonts.css">
```

## Performance Standards

### 1. Asset Optimization
**Requirements**:
- Local font hosting (no Google Fonts CDN)
- Optimized images with proper sizing
- Minimal external dependencies

### 2. Mobile-First Design
**Requirements**:
- Responsive breakpoints
- Touch-friendly navigation
- Fast loading on mobile

## SEO Standards

### 1. Meta Tags
**Requirements**:
- Title, description, keywords
- Open Graph tags
- Twitter Cards
- Canonical URLs

### 2. Structured Data
**Requirements**:
- Schema.org markup where applicable
- Proper heading hierarchy (H1, H2, H3)
- Alt tags for images

## Accessibility Standards

### 1. Navigation
**Requirements**:
- Keyboard navigation support
- ARIA labels for interactive elements
- Screen reader friendly

### 2. Content Structure
**Requirements**:
- Semantic HTML
- Proper contrast ratios
- Focus indicators

## Common Jekyll Patterns

### 1. Layout Inheritance
```yaml
# Page front matter
---
layout: default
title: Page Title
description: Page description
---
```

### 2. Include Structure
```
_includes/
  header.html       # Navigation and branding
  footer.html       # Footer content
  hero.html         # Homepage sections
  [component].html  # Reusable components
```

### 3. Asset Organization
```
assets/
  css/
    fonts.css       # Font declarations
    main.css        # Main styles
  fonts/
    [font-files]    # Local font files
  images/
    [images]        # Optimized images
  js/
    [scripts]       # JavaScript files
```

## Checklist for New Sites

- [ ] Sticky footer implemented
- [ ] Single header/footer in layout
- [ ] Mobile navigation functional
- [ ] Local fonts loading correctly
- [ ] No duplicate includes
- [ ] SEO meta tags complete
- [ ] Responsive design verified
- [ ] Navigation works from all pages
- [ ] Performance optimized

## Common Issues to Avoid

1. **Duplicate Headers/Footers**: Don't include header/footer in both layout and pages
2. **Missing Mobile Menu**: Always implement responsive navigation
3. **Footer Not Sticky**: Use flexbox layout with `flex-grow` for main content
4. **Font Loading Errors**: Verify font file paths and formats
5. **Broken Navigation**: Ensure links work from subdirectories
6. **Missing Responsiveness**: Test on mobile/tablet/desktop

## Testing Requirements

- [ ] Test on mobile, tablet, desktop
- [ ] Verify navigation from all pages
- [ ] Check footer position on tall screens
- [ ] Validate font loading in DevTools
- [ ] Test with slow network connections
- [ ] Verify SEO meta tags
- [ ] Check accessibility with screen reader

This document should be referenced for all Jekyll site development to ensure consistent, professional results.