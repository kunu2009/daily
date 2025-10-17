# 🚀 Deploying 7K Daily to Vercel

This guide will help you deploy your Flutter app to Vercel.

## ⚠️ Important Note

**Vercel has limited support for Flutter apps** because Flutter requires a specific build environment. Here are your best deployment options:

## 🎯 Recommended Deployment Options

### **Option 1: Firebase Hosting (Recommended for Flutter Web)**
Firebase Hosting is specifically optimized for Flutter web apps.

#### Steps:
1. **Install Firebase CLI**:
   ```bash
   npm install -g firebase-tools
   ```

2. **Login to Firebase**:
   ```bash
   firebase login
   ```

3. **Initialize Firebase** (in project directory):
   ```bash
   cd c:\Users\chhed\Desktop\dailyloerr\seven_k_daily
   firebase init hosting
   ```
   - Select "Use an existing project" or create a new one
   - Set public directory to: `build/web`
   - Configure as single-page app: Yes
   - Don't overwrite index.html

4. **Build your Flutter app**:
   ```bash
   flutter build web --release
   ```

5. **Deploy**:
   ```bash
   firebase deploy
   ```

✅ **Your app will be live at**: `https://your-project.web.app`

---

### **Option 2: Netlify (Easy Alternative)**
Netlify also works well with Flutter web apps.

#### Steps:
1. **Build the web app**:
   ```bash
   flutter build web --release
   ```

2. **Install Netlify CLI**:
   ```bash
   npm install -g netlify-cli
   ```

3. **Deploy**:
   ```bash
   cd c:\Users\chhed\Desktop\dailyloerr\seven_k_daily
   netlify deploy --prod --dir=build/web
   ```

---

### **Option 3: Vercel (With Limitations)**

Vercel can host Flutter web apps, but it's **not ideal** due to:
- Long build times (Flutter SDK installation)
- Build timeouts on free tier
- Not optimized for Flutter

#### If you still want to try Vercel:

1. **Install Vercel CLI**:
   ```bash
   npm install -g vercel
   ```

2. **Build locally first** (recommended):
   ```bash
   flutter build web --release
   ```

3. **Deploy the build folder**:
   ```bash
   cd c:\Users\chhed\Desktop\dailyloerr\seven_k_daily
   vercel --prod
   ```
   - When prompted for output directory, enter: `build/web`

**OR** use the included `vercel.json` and `build.sh`:

4. **Push to GitHub** (already done):
   ```bash
   git add .
   git commit -m "Add Vercel deployment config"
   git push origin main
   ```

5. **Connect on Vercel**:
   - Go to https://vercel.com
   - Import your GitHub repository: `kunu2009/daily`
   - Vercel will use the `vercel.json` configuration
   - Wait for build (may take 10-15 minutes first time)

⚠️ **Note**: Vercel's free tier has a 15-minute build timeout. Flutter builds might exceed this.

---

### **Option 4: GitHub Pages (Free & Simple)**

#### Steps:
1. **Build the app**:
   ```bash
   flutter build web --release --base-href "/daily/"
   ```

2. **Install gh-pages** (Node.js required):
   ```bash
   npm install -g gh-pages
   ```

3. **Deploy**:
   ```bash
   cd c:\Users\chhed\Desktop\dailyloerr\seven_k_daily
   gh-pages -d build/web
   ```

✅ **Your app will be live at**: `https://kunu2009.github.io/daily`

---

## 🏆 My Recommendation

**Use Firebase Hosting** because:
- ✅ Free tier is generous
- ✅ Optimized for Flutter web
- ✅ Fast deployment
- ✅ Automatic SSL
- ✅ CDN included
- ✅ Easy rollbacks

---

## 📦 Files Added for Deployment

I've added these files to your project:

1. **vercel.json** - Vercel configuration
2. **build.sh** - Build script for Vercel
3. **.vercelignore** - Files to ignore during deployment
4. **VERCEL_DEPLOYMENT.md** - This guide
5. Updated **web/index.html** - Better SEO metadata
6. Updated **web/manifest.json** - App manifest with proper branding

---

## 🔧 Before Deploying

Make sure Flutter is installed on your local machine:
```bash
flutter doctor
```

If not installed, download from: https://docs.flutter.dev/get-started/install/windows

---

## 🌐 After Deployment

Once deployed, your app will:
- ✅ Work on any modern browser
- ✅ Be installable as a PWA (Progressive Web App)
- ✅ Work on mobile devices via browser
- ✅ Have offline capabilities (with PWA)

---

## 🐛 Troubleshooting

### Build fails on Vercel:
- **Solution**: Build locally and deploy the `build/web` folder directly

### App doesn't load:
- **Check**: Base href in index.html matches your deployment path
- **Check**: Browser console for errors

### Routing doesn't work:
- **Solution**: Most hosting providers need SPA configuration (already in vercel.json)

---

## 📊 Build Your App Locally

Before deploying, always test the web build:

```bash
# Build for web
flutter build web --release

# Test locally
cd build/web
python -m http.server 8000
# Visit http://localhost:8000
```

---

## ✅ Quick Deploy Commands

### Firebase (Recommended):
```bash
flutter build web --release
firebase init hosting
firebase deploy
```

### Netlify:
```bash
flutter build web --release
netlify deploy --prod --dir=build/web
```

### Vercel (Build first):
```bash
flutter build web --release
vercel --prod
```

### GitHub Pages:
```bash
flutter build web --release --base-href "/daily/"
gh-pages -d build/web
```

---

Choose the option that works best for you! I recommend **Firebase Hosting** for the best Flutter web experience. 🚀
