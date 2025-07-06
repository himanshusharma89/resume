# Himanshu Sharma - Resume

This repository contains the LaTeX source for my resume with automated deployment to Cloudflare Pages.

## 🚀 Automated Deployment Setup

This repository is configured with GitHub Actions to automatically build and deploy your resume to Cloudflare Pages whenever you push changes to the main branch.

### How it works:

1. **Single Repository**: Contains both LaTeX source files and deploys to Cloudflare Pages
2. **GitHub Actions**: Automatically builds PDF and deploys on every push
3. **Cloudflare Pages**: Serves the resume at `https://himanshusharma.tech`

### Setup Instructions:

#### 1. Connect to Cloudflare Pages
1. Go to [Cloudflare Pages](https://pages.cloudflare.com/)
2. Click "Create a project"
3. Connect your GitHub repository
4. Set build settings:
   - **Build command**: Leave empty (GitHub Actions handles building)
   - **Build output directory**: Leave empty
   - **Root directory**: Leave empty
5. Click "Save and Deploy"

#### 2. Configure Custom Domain (Optional)
1. In your Cloudflare Pages project settings
2. Go to "Custom domains"
3. Add your domain (e.g., `himanshusharma.tech`)
4. Update DNS records as instructed

#### 3. Push your changes
The workflow will automatically run when you push to the main branch.

### Features Included:

- ✅ **PWA Support**: Progressive Web App with manifest.json and service worker
- ✅ **SEO Optimized**: Meta tags, Open Graph, and Twitter cards
- ✅ **Responsive Design**: Works on all devices
- ✅ **Security Headers**: Proper security configuration
- ✅ **Caching**: Optimized caching for better performance
- ✅ **Social Links**: Direct links to your professional profiles
- ✅ **Automatic Updates**: Every push triggers a new build and deploy

## 📝 Usage

### To update your resume:

1. **Edit the LaTeX source** (`CV.tex`)
2. **Commit and push** to the main branch
3. **GitHub Actions will automatically**:
   - Build the PDF using XeLaTeX
   - Create all necessary files (HTML, manifest, favicon, etc.)
   - Deploy it to Cloudflare Pages
   - Update the live website

### Manual trigger:

You can also manually trigger the workflow by:
1. Going to the Actions tab in this repository
2. Selecting "Build and Deploy Resume"
3. Clicking "Run workflow"

## 🛠️ Local Development

To build the resume locally:

```bash
# Install XeLaTeX (if not already installed)
# On macOS: brew install --cask mactex
# On Ubuntu: sudo apt-get install texlive-xetex

# Build the PDF
xelatex CV.tex
```

## 📁 File Structure

```
├── CV.tex                    # Main LaTeX source file
├── simpleresumecv.cls        # Custom LaTeX class
├── Fonts/                    # Font files
├── .github/workflows/        # GitHub Actions workflow
├── _headers                  # Cloudflare Pages security headers
├── _redirects                # Cloudflare Pages redirects
├── manifest.json             # PWA manifest (auto-generated)
├── favicon.svg               # Custom favicon (auto-generated)
├── index.html                # Main HTML page (auto-generated)
├── sw.js                     # Service worker (auto-generated)
└── README.md                 # This file
```

## 🔗 Links

- **Live Resume**: [himanshusharma.tech](https://himanshusharma.tech)
- **Repository**: [himanshusharma89/Himanshu_Resume](https://github.com/himanshusharma89/Himanshu_Resume)

## 📄 License

This project is based on the [Simple Resume CV](https://github.com/zachscrivena/simple-resume-cv) template, which is released into the public domain.
