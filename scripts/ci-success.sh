#!/bin/bash
# CI/CD Success Automation Script

echo "🚀 CI/CD Success Pipeline Automation"
echo "======================================"

echo ""
echo "📋 Step 1: Pre-flight Testing..."

# Test locally first
echo "🧪 Running tests..."
npm test --silent

if [ $? -eq 0 ]; then
    echo "✅ Tests: PASS"
else
    echo "❌ Tests: FAIL - Fix before continuing"
    exit 1
fi

# Check build
echo "🏗️ Testing build..."
npm run build --silent

if [ $? -eq 0 ]; then
    echo "✅ Build: PASS"
else
    echo "❌ Build: FAIL - Fix before continuing"
    exit 1
fi

# Check lint (warnings OK)
echo "🧹 Checking code quality..."
npm run lint --silent
echo "⚠️ Lint: Warnings allowed (non-blocking)"

echo ""
echo "📊 Pre-flight Summary:"
echo "├── Tests: ✅ PASS"
echo "├── Build: ✅ PASS"  
echo "└── Lint: ⚠️ WARNINGS OK"

echo ""
echo "🎯 Ready for CI/CD pipeline!"
echo "Next: git add . && git commit && git push"
echo ""
echo "📱 Monitor at: https://github.com/phuctranhoang0811/cicd-testing/actions"
echo "🟢 Expected: Green checkmark ✅ in ~2-3 minutes"