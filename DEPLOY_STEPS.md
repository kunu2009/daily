# 🚀 Manual GitHub Pages Deployment Steps

## Follow these steps AFTER flutter build completes:

### Step 1: Wait for build to finish
Wait for this message:
```
√ Built build\web
```

### Step 2: Create clean gh-pages branch
```powershell
git checkout --orphan gh-pages
git rm -rf .
```

### Step 3: Copy ONLY web files
```powershell
Copy-Item -Path "build\web\*" -Destination "." -Recurse -Force
```

### Step 4: Create .nojekyll file (IMPORTANT!)
```powershell
New-Item -ItemType File -Name ".nojekyll" -Force
```

### Step 5: Add and commit
```powershell
git add .
git commit -m "Deploy to GitHub Pages"
```

### Step 6: Push to GitHub
```powershell
git push -f origin gh-pages
```

### Step 7: Go back to main
```powershell
git checkout main
```

### Step 8: Enable GitHub Pages
1. Go to: https://github.com/kunu2009/daily/settings/pages
2. Under "Source", select branch: **gh-pages**
3. Select folder: **/ (root)**
4. Click **Save**

### Step 9: Wait 1-2 minutes
Your app will be live at: **https://kunu2009.github.io/daily/**

---

## Important Notes:

- ✅ The `.nojekyll` file is CRITICAL (tells GitHub Pages not to use Jekyll)
- ✅ Make sure `--base-href "/daily/"` was used during build
- ✅ Only copy files from `build\web\`, not the entire project
- ✅ Use `-f` (force) when pushing to gh-pages

---

## If 404 error persists:

1. Check Settings > Pages is configured correctly
2. Verify gh-pages branch has `index.html` in root
3. Check that `.nojekyll` file exists in gh-pages branch
4. Clear browser cache
5. Try incognito/private browsing mode
