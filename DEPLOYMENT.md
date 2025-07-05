# Resume Deployment Guide

This guide will help you set up automatic building and hosting of your LaTeX resume on Cloudflare Pages.

## Prerequisites

1. A GitHub account
2. A Cloudflare account
3. Your resume LaTeX files (already present in this repository)

## Setup Steps

### 1. Push to GitHub

First, push this repository to GitHub:

```bash
git init
git add .
git commit -m "Initial commit with resume and deployment setup"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
git push -u origin main
```

### 2. Get Cloudflare API Token

1. Go to [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. Navigate to **My Profile** → **API Tokens**
3. Click **Create Token**
4. Choose **Custom token**
5. Set permissions:
   - **Account** → **Cloudflare Pages** → **Edit**
   - **Zone** → **Zone** → **Read** (if you want to use a custom domain)
6. Set **Account Resources** to **Include** → **All accounts**
7. Set **Zone Resources** to **Include** → **All zones** (if using custom domain)
8. Click **Continue to summary** and then **Create Token**
9. Copy the token (you'll need it in the next step)

### 3. Get Cloudflare Account ID

1. In your Cloudflare Dashboard, look at the URL or go to **My Profile** → **Account Home**
2. Copy your Account ID (it's a 32-character hexadecimal string)

### 4. Set Up GitHub Secrets

1. Go to your GitHub repository
2. Navigate to **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Add these secrets:
   - **Name**: `CLOUDFLARE_API_TOKEN`
   - **Value**: Your Cloudflare API token from step 2
5. Click **Add secret**
6. Repeat for:
   - **Name**: `CLOUDFLARE_ACCOUNT_ID`
   - **Value**: Your Cloudflare Account ID from step 3

### 5. Create Cloudflare Pages Project

1. Go to [Cloudflare Pages](https://pages.cloudflare.com/)
2. Click **Create a project**
3. Choose **Connect to Git**
4. Select your GitHub repository
5. Configure the build settings:
   - **Project name**: `resume` (or your preferred name)
   - **Production branch**: `main`
   - **Framework preset**: None
   - **Build command**: Leave empty (handled by GitHub Actions)
   - **Build output directory**: Leave empty (handled by GitHub Actions)
6. Click **Save and Deploy**

### 6. Trigger the First Build

1. Make a small change to your `CV.tex` file (like updating the date)
2. Commit and push the changes:
   ```bash
   git add CV.tex
   git commit -m "Trigger first build"
   git push
   ```
3. Go to your GitHub repository → **Actions** tab to monitor the build
4. Once complete, your resume will be available at: `https://resume.pages.dev` (or your custom domain)

## How It Works

1. **GitHub Actions** automatically builds your LaTeX resume using XeLaTeX when you push changes
2. The workflow creates a beautiful landing page (`index.html`) that serves your PDF
3. **Cloudflare Pages** hosts the static files and provides a fast, global CDN
4. Your resume is accessible via a clean URL and can be easily shared

## Customization

### Custom Domain (Optional)

1. In your Cloudflare Pages project settings, go to **Custom domains**
2. Add your domain (e.g., `resume.yourdomain.com`)
3. Update the DNS records as instructed

### Update the Landing Page

Edit the HTML template in the GitHub Actions workflow file (`.github/workflows/build-resume.yml`) to customize the landing page appearance.

### Multiple Resume Versions

You can create different branches for different resume versions (e.g., `resume-google`, `resume-microsoft`) and they'll be deployed to different URLs.

## Troubleshooting

### Build Failures

- Check the GitHub Actions logs for LaTeX compilation errors
- Ensure all required fonts are included in the `Fonts/` directory
- Verify that `CV.tex` is the correct main file name

### Deployment Issues

- Verify your Cloudflare API token has the correct permissions
- Check that the Cloudflare Pages project name matches in the workflow
- Ensure your GitHub secrets are correctly set

### PDF Not Downloading

- Check that the PDF file is being generated correctly
- Verify the file path in the HTML template matches the actual PDF name

## Benefits

- **Automatic Updates**: Every push to main branch triggers a new build
- **Global CDN**: Fast loading from anywhere in the world
- **Version Control**: Track changes to your resume over time
- **Professional URL**: Clean, shareable link for your resume
- **Mobile Friendly**: Responsive landing page works on all devices 