#!/bin/bash

# Local build script for testing resume compilation
# This script helps you test your LaTeX resume locally before pushing to GitHub

echo "Building resume locally..."

# Check if XeLaTeX is available
if ! command -v xelatex &> /dev/null; then
    echo "Error: XeLaTeX is not installed. Please install a TeX distribution like TeX Live or MiKTeX."
    exit 1
fi

# Clean previous builds
echo "Cleaning previous builds..."
rm -f CV.aux CV.log CV.out CV.toc CV.pdf

# Build the PDF
echo "Compiling CV.tex with XeLaTeX..."
xelatex -interaction=nonstopmode CV.tex

# Check if build was successful
if [ -f "CV.pdf" ]; then
    echo "✅ Resume built successfully!"
    echo "📄 PDF file: CV.pdf"
    echo "📏 File size: $(du -h CV.pdf | cut -f1)"
    
    # Open the PDF if possible
    if command -v open &> /dev/null; then
        echo "🔍 Opening PDF..."
        open CV.pdf
    elif command -v xdg-open &> /dev/null; then
        echo "🔍 Opening PDF..."
        xdg-open CV.pdf
    else
        echo "💡 You can manually open CV.pdf to view your resume"
    fi
else
    echo "❌ Build failed! Check the error messages above."
    exit 1
fi

echo ""
echo "🎉 Ready to push to GitHub for deployment!"
echo "💡 Run: git add . && git commit -m 'Update resume' && git push" 