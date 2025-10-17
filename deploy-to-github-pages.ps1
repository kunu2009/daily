# Simple GitHub Pages Deployment Script

Write-Host "🚀 Deploying 7K Daily to GitHub Pages..." -ForegroundColor Green
Write-Host ""

# Step 1: Build the app
Write-Host "📦 Building Flutter web app..." -ForegroundColor Yellow
flutter build web --release --base-href "/daily/"

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Build failed!" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Build completed!" -ForegroundColor Green
Write-Host ""

# Step 2: Create/switch to gh-pages branch
Write-Host "🌿 Setting up gh-pages branch..." -ForegroundColor Yellow
git checkout --orphan gh-pages-new 2>$null
git rm -rf . 2>$null

# Step 3: Copy only web build files
Write-Host "📁 Copying web files..." -ForegroundColor Yellow
Copy-Item -Path "build\web\*" -Destination "." -Recurse -Force

# Step 4: Create .nojekyll file (important for GitHub Pages)
Write-Host "📝 Creating .nojekyll file..." -ForegroundColor Yellow
New-Item -ItemType File -Name ".nojekyll" -Force | Out-Null

# Step 5: Commit
Write-Host "💾 Committing files..." -ForegroundColor Yellow
git add .
git commit -m "Deploy to GitHub Pages"

# Step 6: Force push to gh-pages
Write-Host "⬆️  Pushing to GitHub..." -ForegroundColor Yellow
git branch -M gh-pages
git push -f origin gh-pages

# Step 7: Return to main
Write-Host "🔄 Returning to main branch..." -ForegroundColor Yellow
git checkout main

Write-Host ""
Write-Host "✅ Deployment complete!" -ForegroundColor Green
Write-Host ""
Write-Host "🌐 Your app will be live in 1-2 minutes at:" -ForegroundColor Cyan
Write-Host "   https://kunu2009.github.io/daily/" -ForegroundColor Cyan
Write-Host ""
Write-Host "📋 To enable GitHub Pages (if not already enabled):" -ForegroundColor Yellow
Write-Host "   1. Go to: https://github.com/kunu2009/daily/settings/pages" -ForegroundColor White
Write-Host "   2. Under 'Source', select 'gh-pages' branch" -ForegroundColor White
Write-Host "   3. Click 'Save'" -ForegroundColor White
