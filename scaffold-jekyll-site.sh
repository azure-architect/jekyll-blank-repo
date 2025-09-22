#!/bin/bash

# LocallyKnown.pro Jekyll Site Scaffold Script
# Creates a complete conversion funnel landing page structure

set -e  # Exit on any error

echo "🚀 Starting Jekyll Site Scaffold for LocallyKnown.pro"
echo "=================================================="

# Set up Ruby environment
echo "📦 Setting up Ruby environment..."
source /opt/homebrew/share/chruby/chruby.sh
chruby ruby-3.4.1

# Verify Ruby version
RUBY_VERSION=$(ruby -v)
echo "✅ Ruby version: $RUBY_VERSION"

# Install bundler if not present
if ! command -v bundle &> /dev/null; then
    echo "📦 Installing bundler..."
    gem install bundler
fi

# Create Gemfile
echo "📦 Creating Gemfile..."
cat > Gemfile << 'EOF'
source "https://rubygems.org"

gem "jekyll", "~> 4.3.0"
gem "csv"
gem "logger"
gem "base64"

group :jekyll_plugins do
  gem "jekyll-seo-tag"
  gem "jekyll-sitemap"
  gem "jekyll-feed"
end
EOF

# Install dependencies
echo "📦 Installing Jekyll dependencies..."
bundle install

# Create Jekyll configuration
echo "⚙️ Creating Jekyll configuration..."
cat > _config.yml << 'EOF'
# Site Settings
title: LocallyKnown.pro
description: Professional conversion-focused landing pages for local businesses
url: https://locallyknown.pro
baseurl: ""

# SEO Settings
tagline: Convert More Visitors Into Customers
author:
  name: LocallyKnown.pro
  email: hello@locallyknown.pro

# Jekyll Configuration
markdown: kramdown
permalink: /blog/:year/:month/:day/:title/

# Plugins
plugins:
  - jekyll-seo-tag
  - jekyll-sitemap
  - jekyll-feed

# Collections
collections:
  testimonials:
    output: false

# Defaults
defaults:
  - scope:
      path: ""
      type: "posts"
    values:
      layout: "post"
      author: "LocallyKnown.pro"

# Service-specific settings
service_type: conversion_landing_page
consultation_price: "$497"
EOF

# Create directories
echo "📁 Creating directory structure..."
mkdir -p _layouts _includes _sass assets/css assets/js assets/images

# Download TailwindCSS and Alpine.js locally
echo "📦 Downloading frontend dependencies..."
curl -s -o assets/js/tailwind.min.js https://cdn.tailwindcss.com/3.4.0/tailwind.min.js
curl -s -o assets/js/alpine.min.js https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js

echo "✅ TailwindCSS and Alpine.js downloaded locally"

# Create default layout
echo "🎨 Creating default layout..."
cat > _layouts/default.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{% if page.title %}{{ page.title }} - {% endif %}{{ site.title }}</title>
    <meta name="description" content="{% if page.description %}{{ page.description }}{% else %}{{ site.description }}{% endif %}">

    <!-- TailwindCSS -->
    <script src="/assets/js/tailwind.min.js"></script>

    <!-- Alpine.js -->
    <script defer src="/assets/js/alpine.min.js"></script>

    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#3B82F6',
                        secondary: '#10B981',
                        accent: '#F59E0B'
                    }
                }
            }
        }
    </script>

    <!-- SEO Tags -->
    {% seo %}

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="/favicon.ico">

    <!-- Open Graph -->
    <meta property="og:title" content="{% if page.title %}{{ page.title }}{% else %}{{ site.title }}{% endif %}">
    <meta property="og:description" content="{% if page.description %}{{ page.description }}{% else %}{{ site.description }}{% endif %}">
    <meta property="og:type" content="website">
    <meta property="og:url" content="{{ site.url }}{{ page.url }}">
</head>
<body class="bg-white text-gray-900">
    {{ content }}
</body>
</html>
EOF

# Create header include
echo "🏠 Creating header include..."
cat > _includes/header.html << 'EOF'
<header class="bg-white shadow-sm">
    <div class="max-w-6xl mx-auto px-4 py-4">
        <nav class="flex items-center justify-between">
            <div class="text-2xl font-bold text-primary">
                {{ site.title }}
            </div>
            <div class="hidden md:flex space-x-6">
                <a href="#hero" class="text-gray-700 hover:text-primary">Home</a>
                <a href="/about" class="text-gray-700 hover:text-primary">About</a>
                <a href="/contact" class="text-gray-700 hover:text-primary">Contact</a>
            </div>
        </nav>
    </div>
</header>
EOF

# Create footer include
echo "🦶 Creating footer include..."
cat > _includes/footer.html << 'EOF'
<footer class="bg-gray-900 text-white py-12">
    <div class="max-w-6xl mx-auto px-4">
        <div class="grid md:grid-cols-3 gap-8">
            <div>
                <h3 class="text-xl font-bold mb-4">{{ site.title }}</h3>
                <p class="text-gray-300">{{ site.description }}</p>
            </div>
            <div>
                <h4 class="font-semibold mb-4">Quick Links</h4>
                <ul class="space-y-2">
                    <li><a href="#hero" class="text-gray-300 hover:text-white">Home</a></li>
                    <li><a href="/about" class="text-gray-300 hover:text-white">About</a></li>
                    <li><a href="/contact" class="text-gray-300 hover:text-white">Contact</a></li>
                </ul>
            </div>
            <div>
                <h4 class="font-semibold mb-4">Contact Info</h4>
                <p class="text-gray-300">{{ site.author.email }}</p>
            </div>
        </div>
        <div class="text-center mt-8 pt-8 border-t border-gray-700">
            <p>&copy; {{ site.time | date: '%Y' }} {{ site.title }}. All rights reserved.</p>
        </div>
    </div>
</footer>
EOF

# Create conversion funnel sections
echo "🎯 Creating conversion funnel sections..."

# Section 1: Hero
cat > _includes/hero.html << 'EOF'
<section id="hero" class="bg-gradient-to-r from-primary to-blue-800 text-white py-20">
    <div class="max-w-6xl mx-auto px-4 text-center">
        <!-- Eyebrow Copy -->
        <p class="text-sm uppercase tracking-wide mb-4 opacity-90">
            For [Target Customer Avatar]
        </p>

        <!-- Headline -->
        <h1 class="text-4xl md:text-6xl font-bold mb-6">
            [Promise the Desired Outcome]
        </h1>

        <!-- Sub-headline -->
        <p class="text-xl md:text-2xl mb-8 opacity-95">
            [How you deliver + location]
        </p>

        <!-- CTA Button -->
        <a href="#contact" class="inline-block bg-secondary hover:bg-green-600 text-white font-bold py-4 px-8 rounded-lg text-lg transition duration-200">
            [Specific Action - Book Consultation]
        </a>

        <!-- Social Proof -->
        <div class="mt-8 flex items-center justify-center space-x-2">
            <div class="flex">
                {% for i in (1..5) %}
                <svg class="w-5 h-5 text-yellow-400 fill-current" viewBox="0 0 20 20">
                    <path d="M10 15l-5.878 3.09 1.123-6.545L.489 6.91l6.572-.955L10 0l2.939 5.955 6.572.955-4.756 4.635 1.123 6.545z"/>
                </svg>
                {% endfor %}
            </div>
            <p class="text-sm opacity-90">[Social proof number + testimonial snippet]</p>
        </div>
    </div>
</section>
EOF

# Section 2: Quick Wins
cat > _includes/quick-wins.html << 'EOF'
<section id="quick-wins" class="py-8 bg-gray-50">
    <div class="max-w-6xl mx-auto px-4">
        <div class="flex flex-col md:flex-row justify-center items-center space-y-4 md:space-y-0 md:space-x-8">
            <div class="flex items-center">
                <svg class="w-6 h-6 text-secondary mr-2" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                </svg>
                <span class="font-semibold">[Quick Win 1]</span>
            </div>
            <div class="flex items-center">
                <svg class="w-6 h-6 text-secondary mr-2" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                </svg>
                <span class="font-semibold">[Quick Win 2]</span>
            </div>
            <div class="flex items-center">
                <svg class="w-6 h-6 text-secondary mr-2" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                </svg>
                <span class="font-semibold">[Quick Win 3]</span>
            </div>
        </div>
    </div>
</section>
EOF

# Section 3: Problem Agitation
cat > _includes/problem-agitation.html << 'EOF'
<section id="problem-agitation" class="py-16">
    <div class="max-w-4xl mx-auto px-4">
        <h2 class="text-3xl font-bold mb-8 text-center">
            [Main Problem Headline]
        </h2>

        <div class="space-y-4">
            <div class="flex items-start">
                <svg class="w-6 h-6 text-red-500 mr-3 flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
                </svg>
                <p class="text-lg">[Problem symptom 1]</p>
            </div>

            <div class="flex items-start">
                <svg class="w-6 h-6 text-red-500 mr-3 flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
                </svg>
                <p class="text-lg">[Problem symptom 2]</p>
            </div>

            <div class="flex items-start">
                <svg class="w-6 h-6 text-red-500 mr-3 flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
                </svg>
                <p class="text-lg">[Problem symptom 3]</p>
            </div>
        </div>

        <div class="mt-8 p-6 bg-yellow-50 border-l-4 border-yellow-400">
            <p class="font-semibold text-yellow-800">
                [Emotional connection statement about their reality]
            </p>
        </div>
    </div>
</section>
EOF

# Section 4: Solution Introduction
cat > _includes/solution-intro.html << 'EOF'
<section id="solution-intro" class="py-16 bg-gray-50">
    <div class="max-w-4xl mx-auto px-4">
        <div class="text-center mb-8">
            <h2 class="text-3xl font-bold mb-4">
                [We Understand + Solution Statement]
            </h2>
            <p class="text-xl text-gray-600">
                [Brief positioning statement]
            </p>
        </div>

        <div class="grid md:grid-cols-2 gap-8 items-center">
            <div>
                <h3 class="text-2xl font-semibold mb-4">Our Credentials</h3>
                <ul class="space-y-3">
                    <li class="flex items-start">
                        <span class="text-primary font-bold mr-2">✓</span>
                        <span>[Credential 1]</span>
                    </li>
                    <li class="flex items-start">
                        <span class="text-primary font-bold mr-2">✓</span>
                        <span>[Credential 2]</span>
                    </li>
                    <li class="flex items-start">
                        <span class="text-primary font-bold mr-2">✓</span>
                        <span>[Credential 3]</span>
                    </li>
                </ul>
            </div>
            <div class="bg-white p-6 rounded-lg shadow-lg">
                <div class="w-32 h-32 bg-gray-200 rounded-full mx-auto mb-4">
                    <!-- Professional photo placeholder -->
                    <span class="text-xs text-gray-500">[Your Photo]</span>
                </div>
                <h4 class="font-semibold text-lg mb-2 text-center">[Your Name/Team]</h4>
                <p class="text-gray-700 text-center">[Brief approach explanation]</p>
            </div>
        </div>
    </div>
</section>
EOF

# Section 5: Benefits
cat > _includes/benefits.html << 'EOF'
<section id="benefits" class="py-16">
    <div class="max-w-6xl mx-auto px-4">
        <h2 class="text-3xl font-bold text-center mb-12">
            [What You Get When You Work With Us]
        </h2>

        <div class="grid md:grid-cols-3 gap-8">
            <!-- Benefit 1 -->
            <div class="text-center">
                <div class="bg-primary bg-opacity-10 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                    <svg class="w-8 h-8 text-primary" fill="currentColor" viewBox="0 0 20 20">
                        <!-- Icon placeholder -->
                        <path d="M10 2L3 7v11a1 1 0 001 1h3v-8h6v8h3a1 1 0 001-1V7l-7-5z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold mb-3">[Benefit 1 Headline]</h3>
                <p class="text-gray-600">
                    [What they GET from this benefit]
                </p>
            </div>

            <!-- Benefit 2 -->
            <div class="text-center">
                <div class="bg-secondary bg-opacity-10 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                    <svg class="w-8 h-8 text-secondary" fill="currentColor" viewBox="0 0 20 20">
                        <!-- Icon placeholder -->
                        <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold mb-3">[Benefit 2 Headline]</h3>
                <p class="text-gray-600">
                    [What they GET from this benefit]
                </p>
            </div>

            <!-- Benefit 3 -->
            <div class="text-center">
                <div class="bg-accent bg-opacity-10 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                    <svg class="w-8 h-8 text-accent" fill="currentColor" viewBox="0 0 20 20">
                        <!-- Icon placeholder -->
                        <path d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold mb-3">[Benefit 3 Headline]</h3>
                <p class="text-gray-600">
                    [What they GET from this benefit]
                </p>
            </div>
        </div>
    </div>
</section>
EOF

# Section 6: Testimonials
cat > _includes/testimonials.html << 'EOF'
<section id="testimonials" class="py-16 bg-gray-50">
    <div class="max-w-6xl mx-auto px-4">
        <h2 class="text-3xl font-bold text-center mb-12">
            What Our Clients Say
        </h2>

        <div class="grid md:grid-cols-3 gap-8">
            <div class="bg-white p-6 rounded-lg shadow">
                <div class="flex mb-4">
                    {% for i in (1..5) %}
                    <svg class="w-5 h-5 text-yellow-400 fill-current" viewBox="0 0 20 20">
                        <path d="M10 15l-5.878 3.09 1.123-6.545L.489 6.91l6.572-.955L10 0l2.939 5.955 6.572.955-4.756 4.635 1.123 6.545z"/>
                    </svg>
                    {% endfor %}
                </div>
                <p class="mb-4">"[Specific testimonial addressing pain point and outcome]"</p>
                <p class="font-semibold">- [Customer Name], [Title/Company]</p>
            </div>

            <div class="bg-white p-6 rounded-lg shadow">
                <div class="flex mb-4">
                    {% for i in (1..5) %}
                    <svg class="w-5 h-5 text-yellow-400 fill-current" viewBox="0 0 20 20">
                        <path d="M10 15l-5.878 3.09 1.123-6.545L.489 6.91l6.572-.955L10 0l2.939 5.955 6.572.955-4.756 4.635 1.123 6.545z"/>
                    </svg>
                    {% endfor %}
                </div>
                <p class="mb-4">"[Testimonial overcoming common objection]"</p>
                <p class="font-semibold">- [Customer Name], [Title/Company]</p>
            </div>

            <div class="bg-white p-6 rounded-lg shadow">
                <div class="flex mb-4">
                    {% for i in (1..5) %}
                    <svg class="w-5 h-5 text-yellow-400 fill-current" viewBox="0 0 20 20">
                        <path d="M10 15l-5.878 3.09 1.123-6.545L.489 6.91l6.572-.955L10 0l2.939 5.955 6.572.955-4.756 4.635 1.123 6.545z"/>
                    </svg>
                    {% endfor %}
                </div>
                <p class="mb-4">"[Testimonial confirming promised outcomes]"</p>
                <p class="font-semibold">- [Customer Name], [Title/Company]</p>
            </div>
        </div>
    </div>
</section>
EOF

# Section 7: Process
cat > _includes/process.html << 'EOF'
<section id="process" class="py-16">
    <div class="max-w-6xl mx-auto px-4">
        <h2 class="text-3xl font-bold text-center mb-12">
            Simple 3-Step Process
        </h2>

        <div class="grid md:grid-cols-3 gap-8">
            <div class="text-center">
                <div class="bg-primary bg-opacity-10 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                    <span class="text-2xl font-bold text-primary">1</span>
                </div>
                <h3 class="text-xl font-semibold mb-3">[Step 1: They Take Action]</h3>
                <p class="text-gray-600">
                    [Description of your CTA action]
                </p>
            </div>

            <div class="text-center">
                <div class="bg-secondary bg-opacity-10 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                    <span class="text-2xl font-bold text-secondary">2</span>
                </div>
                <h3 class="text-xl font-semibold mb-3">[Step 2: You Handle Everything]</h3>
                <p class="text-gray-600">
                    [Simplified process description]
                </p>
            </div>

            <div class="text-center">
                <div class="bg-accent bg-opacity-10 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                    <span class="text-2xl font-bold text-accent">3</span>
                </div>
                <h3 class="text-xl font-semibold mb-3">[Step 3: They Enjoy Result]</h3>
                <p class="text-gray-600">
                    [The outcome they experience]
                </p>
            </div>
        </div>
    </div>
</section>
EOF

# Section 8: Flex Section
cat > _includes/flex-section.html << 'EOF'
<section id="flex-section" class="py-16 bg-gray-50">
    <div class="max-w-6xl mx-auto px-4">
        <h2 class="text-3xl font-bold text-center mb-12">
            [10 Reasons Why OR Comparison Chart]
        </h2>

        <!-- Option A: 10 Reasons Why List -->
        <div class="grid md:grid-cols-2 gap-6">
            <div class="space-y-4">
                <div class="flex items-start">
                    <svg class="w-6 h-6 text-secondary mr-3 flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                    <span>[Reason 1 - addresses buying concern]</span>
                </div>

                <div class="flex items-start">
                    <svg class="w-6 h-6 text-secondary mr-3 flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                    <span>[Reason 2]</span>
                </div>

                <div class="flex items-start">
                    <svg class="w-6 h-6 text-secondary mr-3 flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                    <span>[Reason 3]</span>
                </div>

                <div class="flex items-start">
                    <svg class="w-6 h-6 text-secondary mr-3 flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                    <span>[Reason 4]</span>
                </div>

                <div class="flex items-start">
                    <svg class="w-6 h-6 text-secondary mr-3 flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                    <span>[Reason 5]</span>
                </div>
            </div>

            <div class="space-y-4">
                <div class="flex items-start">
                    <svg class="w-6 h-6 text-secondary mr-3 flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                    <span>[Reason 6]</span>
                </div>

                <div class="flex items-start">
                    <svg class="w-6 h-6 text-secondary mr-3 flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                    <span>[Reason 7]</span>
                </div>

                <div class="flex items-start">
                    <svg class="w-6 h-6 text-secondary mr-3 flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                    <span>[Reason 8]</span>
                </div>

                <div class="flex items-start">
                    <svg class="w-6 h-6 text-secondary mr-3 flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                    <span>[Reason 9]</span>
                </div>

                <div class="flex items-start">
                    <svg class="w-6 h-6 text-secondary mr-3 flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                    <span>[Reason 10]</span>
                </div>
            </div>
        </div>
    </div>
</section>
EOF

# Section 9: Features
cat > _includes/features.html << 'EOF'
<section id="features" class="py-16">
    <div class="max-w-6xl mx-auto px-4">
        <h2 class="text-3xl font-bold text-center mb-12">
            Everything You Get
        </h2>

        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            <div class="flex items-start space-x-3">
                <svg class="w-6 h-6 text-secondary flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                </svg>
                <span>[Feature 1 - specific deliverable]</span>
            </div>

            <div class="flex items-start space-x-3">
                <svg class="w-6 h-6 text-secondary flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                </svg>
                <span>[Feature 2]</span>
            </div>

            <div class="flex items-start space-x-3">
                <svg class="w-6 h-6 text-secondary flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                </svg>
                <span>[Feature 3]</span>
            </div>

            <div class="flex items-start space-x-3">
                <svg class="w-6 h-6 text-secondary flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                </svg>
                <span>[Feature 4]</span>
            </div>

            <div class="flex items-start space-x-3">
                <svg class="w-6 h-6 text-secondary flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                </svg>
                <span>[Feature 5]</span>
            </div>

            <div class="flex items-start space-x-3">
                <svg class="w-6 h-6 text-secondary flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                </svg>
                <span>[Feature 6]</span>
            </div>
        </div>
    </div>
</section>
EOF

# Section 10: FAQ
cat > _includes/faq.html << 'EOF'
<section id="faq" class="py-16 bg-gray-50">
    <div class="max-w-4xl mx-auto px-4">
        <h2 class="text-3xl font-bold text-center mb-12">
            Frequently Asked Questions
        </h2>

        <div class="space-y-6">
            <div class="bg-white p-6 rounded-lg shadow">
                <h3 class="font-semibold text-lg mb-2">[Common Question 1]</h3>
                <p class="text-gray-700">[Answer that builds trust and overcomes objection]</p>
            </div>

            <div class="bg-white p-6 rounded-lg shadow">
                <h3 class="font-semibold text-lg mb-2">[Common Question 2]</h3>
                <p class="text-gray-700">[Qualification information answer]</p>
            </div>

            <div class="bg-white p-6 rounded-lg shadow">
                <h3 class="font-semibold text-lg mb-2">[Common Question 3]</h3>
                <p class="text-gray-700">[Proactive objection rebuttal]</p>
            </div>

            <div class="bg-white p-6 rounded-lg shadow">
                <h3 class="font-semibold text-lg mb-2">[Common Question 4]</h3>
                <p class="text-gray-700">[Answer addressing concern]</p>
            </div>

            <div class="bg-white p-6 rounded-lg shadow">
                <h3 class="font-semibold text-lg mb-2">[Common Question 5]</h3>
                <p class="text-gray-700">[Final concern handling]</p>
            </div>
        </div>
    </div>
</section>
EOF

# Final CTA Section
cat > _includes/final-cta.html << 'EOF'
<section id="final-cta" class="py-16 bg-primary text-white">
    <div class="max-w-4xl mx-auto px-4 text-center">
        <h2 class="text-3xl font-bold mb-4">
            [Dream Outcome-Focused Question]
        </h2>
        <p class="text-xl mb-8 opacity-90">
            [Reinforcement of value proposition]
        </p>

        <a href="#contact" class="inline-block bg-secondary hover:bg-green-600 text-white font-bold py-4 px-8 rounded-lg text-lg transition duration-200">
            [Same Specific Action as Hero]
        </a>

        <p class="mt-4 text-sm opacity-75">
            [Trust statement or guarantee]
        </p>
    </div>
</section>
EOF

# Create main index page
echo "🏠 Creating main index page..."
cat > index.html << 'EOF'
---
layout: default
title: Professional Conversion Landing Pages
description: Convert more visitors into customers with professionally designed landing pages tailored to your local business.
---

{% include header.html %}
{% include hero.html %}
{% include quick-wins.html %}
{% include problem-agitation.html %}
{% include solution-intro.html %}
{% include benefits.html %}
{% include testimonials.html %}
{% include process.html %}
{% include flex-section.html %}
{% include features.html %}
{% include faq.html %}
{% include final-cta.html %}
{% include footer.html %}
EOF

# Create about page
echo "📄 Creating about page..."
cat > about.html << 'EOF'
---
layout: default
title: About Us
description: Learn about our mission to help local businesses convert more visitors into customers.
---

{% include header.html %}

<section class="py-20">
    <div class="max-w-4xl mx-auto px-4">
        <h1 class="text-4xl font-bold mb-8 text-center">About {{ site.title }}</h1>

        <div class="prose prose-lg mx-auto">
            <p class="text-xl text-gray-600 mb-8 text-center">
                [Your mission statement and approach to helping local businesses]
            </p>

            <div class="grid md:grid-cols-2 gap-8 items-center">
                <div>
                    <h2 class="text-2xl font-semibold mb-4">Our Story</h2>
                    <p>[Background about why you started this business and your experience]</p>

                    <h2 class="text-2xl font-semibold mb-4 mt-8">Our Approach</h2>
                    <p>[Your methodology and what makes you different]</p>
                </div>

                <div class="bg-gray-100 p-8 rounded-lg">
                    <div class="w-32 h-32 bg-gray-200 rounded-full mx-auto mb-4">
                        <!-- Professional photo placeholder -->
                        <span class="text-xs text-gray-500">[Team Photo]</span>
                    </div>
                    <h3 class="font-semibold text-lg text-center">[Your Name/Team]</h3>
                    <p class="text-gray-600 text-center">[Title/Credentials]</p>
                </div>
            </div>
        </div>
    </div>
</section>

{% include footer.html %}
EOF

# Create contact page
echo "📞 Creating contact page..."
cat > contact.html << 'EOF'
---
layout: default
title: Contact Us
description: Get in touch to discuss your conversion landing page project.
---

{% include header.html %}

<section class="py-20">
    <div class="max-w-4xl mx-auto px-4">
        <h1 class="text-4xl font-bold mb-8 text-center">Contact Us</h1>

        <div class="grid md:grid-cols-2 gap-8">
            <div>
                <h2 class="text-2xl font-semibold mb-4">Get Started Today</h2>
                <p class="text-gray-600 mb-6">
                    Ready to convert more visitors into customers? Fill out the form and we'll get back to you within 24 hours.
                </p>

                <div class="space-y-4">
                    <div class="flex items-center">
                        <svg class="w-6 h-6 text-primary mr-3" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
                            <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
                        </svg>
                        <span>{{ site.author.email }}</span>
                    </div>

                    <div class="flex items-center">
                        <svg class="w-6 h-6 text-primary mr-3" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-12a1 1 0 10-2 0v4a1 1 0 00.293.707l2.828 2.829a1 1 0 101.415-1.415L11 9.586V6z" clip-rule="evenodd"/>
                        </svg>
                        <span>Response within 24 hours</span>
                    </div>
                </div>
            </div>

            <div class="bg-gray-50 p-6 rounded-lg">
                <form action="#" method="POST" class="space-y-4">
                    <div>
                        <label for="name" class="block text-sm font-medium text-gray-700 mb-1">Full Name *</label>
                        <input type="text" id="name" name="name" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary">
                    </div>

                    <div>
                        <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email Address *</label>
                        <input type="email" id="email" name="email" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary">
                    </div>

                    <div>
                        <label for="business" class="block text-sm font-medium text-gray-700 mb-1">Business Name</label>
                        <input type="text" id="business" name="business" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary">
                    </div>

                    <div>
                        <label for="message" class="block text-sm font-medium text-gray-700 mb-1">Project Details *</label>
                        <textarea id="message" name="message" rows="4" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary" placeholder="Tell us about your business and conversion goals..."></textarea>
                    </div>

                    <button type="submit" class="w-full bg-primary hover:bg-blue-700 text-white font-bold py-3 px-6 rounded-md transition duration-200">
                        Send Message
                    </button>
                </form>
            </div>
        </div>
    </div>
</section>

{% include footer.html %}
EOF

# Initialize git repository
echo "🔧 Initializing git repository..."
git init
git add .
git commit -m "Initial Jekyll site scaffold with conversion funnel structure

🚀 Generated with LocallyKnown.pro Jekyll Scaffold

Features:
- Complete 10-section conversion funnel
- TailwindCSS styling
- Modular Liquid templates
- Mobile responsive design
- SEO optimized
- Contact form ready
- Git repository initialized

Ready for customization and deployment."

echo ""
echo "🎉 Jekyll Site Scaffold Complete!"
echo "================================="
echo ""
echo "✅ Ruby 3.4.1 environment activated"
echo "✅ Jekyll dependencies installed"
echo "✅ Complete site structure created"
echo "✅ All 10 conversion sections scaffolded"
echo "✅ TailwindCSS integrated"
echo "✅ Git repository initialized"
echo ""
echo "📁 Created Files:"
echo "   - _config.yml (Jekyll configuration)"
echo "   - _layouts/default.html (base layout)"
echo "   - _includes/header.html, footer.html"
echo "   - _includes/hero.html through faq.html (10 sections)"
echo "   - _includes/final-cta.html"
echo "   - index.html (main landing page)"
echo "   - about.html, contact.html"
echo ""
echo "🚀 Next Steps:"
echo "   1. bundle exec jekyll serve --livereload"
echo "   2. Customize content in _includes/ files"
echo "   3. Test and optimize conversion flow"
echo "   4. Deploy to GitHub Pages"
echo ""
echo "🌐 Ready to convert visitors into customers!"
EOF

chmod +x scaffold-jekyll-site.sh

<function_calls>
<invoke name="TodoWrite">
<parameter name="todos">[{"content": "Clear locallyknown.pro folder and start fresh", "status": "completed", "activeForm": "Clearing locallyknown.pro folder and starting fresh"}, {"content": "Set up Ruby 3.4.1 environment", "status": "completed", "activeForm": "Setting up Ruby 3.4.1 environment"}, {"content": "Document product specification", "status": "completed", "activeForm": "Documenting product specification"}, {"content": "Create Jekyll scaffold script", "status": "completed", "activeForm": "Creating Jekyll scaffold script"}, {"content": "Initialize new git repository", "status": "pending", "activeForm": "Initializing new git repository"}, {"content": "Test scaffold script", "status": "pending", "activeForm": "Testing scaffold script"}]