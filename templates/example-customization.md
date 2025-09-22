# Example Customization Guide

## Quick Customization Workflow

After running `./scaffold-jekyll-site.sh`, customize your client's landing page:

### 1. Update Site Configuration
Edit `_config.yml`:
```yaml
title: "[Client Business Name]"
description: "[Client business description]"
url: "https://[client-domain].com"
author:
  name: "[Client Name]"
  email: "[client-email]"
consultation_price: "$497"  # Or client-specific pricing
```

### 2. Customize Hero Section
Edit `_includes/hero.html`:
- **Eyebrow Copy**: Replace `[Target Customer Avatar]` with specific client avatar
- **Headline**: Replace `[Promise the Desired Outcome]` with client's main value prop
- **Sub-headline**: Add client location and delivery method
- **CTA Button**: Specific action like "Book Free Kitchen Consultation"
- **Social Proof**: Add client-specific testimonial count and snippet

### 3. Update Quick Wins
Edit `_includes/quick-wins.html`:
- Replace `[Quick Win 1]`, `[Quick Win 2]`, `[Quick Win 3]` with client's top 3 benefits
- Examples: "Beautiful Kitchen", "Higher Home Value", "Zero Stress"

### 4. Problem Agitation
Edit `_includes/problem-agitation.html`:
- **Main Problem**: Client's target customer's biggest pain point
- **Symptoms**: 3-5 specific problems client's audience faces
- **Emotional Connection**: Statement showing understanding of their reality

### 5. Solution Introduction
Edit `_includes/solution-intro.html`:
- Add client credentials and qualifications
- Replace photo placeholder with actual client photo
- Brief explanation of client's unique approach

### 6. Three Main Benefits
Edit `_includes/benefits.html`:
- Replace benefit headlines with what clients GET (outcomes, not features)
- Update descriptions to be client-specific
- Ensure icons match the benefits

### 7. Testimonials
Edit `_includes/testimonials.html`:
- Add 3 real client testimonials that:
  - Overcome objections
  - Address pain points
  - Confirm promised outcomes
- Include customer names and titles/companies

### 8. Simple Process
Edit `_includes/process.html`:
- **Step 1**: How customer takes action (specific to client's CTA)
- **Step 2**: Client's simplified process description
- **Step 3**: The outcome customer experiences

### 9. Features List
Edit `_includes/features.html`:
- List 10-20 specific deliverables client provides
- Focus on "what they get" rather than "what you do"
- Use checkmarks for visual appeal

### 10. FAQ Section
Edit `_includes/faq.html`:
- Client's 5-6 most common questions
- Answers that build trust and overcome objections
- Include qualification information

### 11. Final CTA
Edit `_includes/final-cta.html`:
- Dream outcome-focused question specific to client's service
- Same CTA action as hero section
- Trust statement or guarantee

## Industry-Specific Examples

### Local Restaurant
- Hero: "For Busy Families" → "Never Wonder What's For Dinner Again"
- Quick Wins: "Fresh Meals", "Fast Delivery", "Family Favorite"
- Problem: "Tired of cooking after long workdays?"

### Home Contractor
- Hero: "For Homeowners" → "Transform Your Space Without the Stress"
- Quick Wins: "Beautiful Results", "On Time", "No Surprises"
- Problem: "Worried about unreliable contractors?"

### Professional Services
- Hero: "For Growing Businesses" → "Focus on Growth, Not Paperwork"
- Quick Wins: "Save Time", "Reduce Costs", "Stay Compliant"
- Problem: "Drowning in administrative tasks?"

## Testing Checklist

- [ ] All placeholder text replaced with client-specific content
- [ ] Contact form works and connects to client's CRM
- [ ] Mobile responsive design looks good
- [ ] All links work properly
- [ ] SEO meta tags updated
- [ ] Site loads fast (< 3 seconds)
- [ ] Conversion flow makes sense for client's business

## Common Mistakes to Avoid

1. **Generic Content** - Always customize for specific client and audience
2. **Feature Focus** - Emphasize outcomes/benefits, not features
3. **Weak CTAs** - Use specific actions, not generic "Contact Us"
4. **Missing Social Proof** - Include real testimonials and trust signals
5. **Complex Process** - Keep it simple (3 steps maximum)

This framework converts visitors into customers through proven psychological triggers. Every section serves a specific purpose in the conversion journey.