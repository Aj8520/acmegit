
# 🌱 Developer Git Workflow in Eclipse (Development Branch Access Only)

**Author**: <a href="https://www.linkedin.com/in/ajayaniljadhav" target="_blank" rel="noopener noreferrer">Ajay Jadhav</a>

This guide explains the Git workflow **for developers** who only have access to the `Development` branch in a Git-managed project. This includes:

- Pulling code from `Development`
- Creating a new feature branch from `Development`
- Pushing changes
- Creating a merge request (MR) **back to `Development`**

---

## 🧩 Workflow Overview

```plaintext
Development (remote branch)
   ↓
Developer checks out Development
   ↓
Creates feature branch: ajay-login-fix
   ↓
Makes changes, commits, and pushes
   ↓
Creates Merge Request → target: Development
```

---

## 🪴 Step 1: Checkout `Development` Branch

1. Open **Git Repositories** view in Eclipse
2. Expand **Remotes ➡ origin ➡ development**
3. Right-click ➡ **Checkout As...**
4. Choose:  
   - Create new local branch: `development`  
   - Start tracking remote: `origin/development`  
   - Click **Finish**

📸 _Image Placeholder:_  
`images/eclipse-checkout-development.png`

---

## 🌿 Step 2: Create Feature Branch (from Development)

1. In **Git Repositories**, right-click on `development` (local)
2. Choose **Switch To ➡ New Branch**
3. Enter branch name, e.g., `ajay-login-fix`
4. Click **Checkout new branch**

📸 _Image Placeholder:_  
`images/eclipse-create-feature-branch.png`

---

## 🛠️ Step 3: Make Changes and Commit

1. Do your code modifications
2. Open **Git Staging View**
3. Stage files by dragging to **Staged Changes**
4. Add a commit message
5. Click **Commit**

📸 _Image Placeholder:_  
`images/eclipse-git-commit.png`

---

## 🚀 Step 4: Push Your Feature Branch

1. Right-click the project ➡ **Team ➡ Push Branch**
2. Ensure the remote branch is named the same (e.g., `ajay-login-fix`)
3. Click **Next ➡ Finish**

📸 _Image Placeholder:_  
`images/eclipse-push-feature-branch.png`

---

## 🔁 Step 5: Create Merge Request to Development Branch

> Merge requests must be made from feature branch ➡ `Development`

1. Go to GitLab/GitHub web interface
2. You'll see: "Push successful. Create merge request?"
3. Or, manually create it:
   - Source branch: `ajay-login-fix`
   - Target branch: `Development`
4. Add title, description, and reviewers
5. Click **Create Merge Request**

📸 _Image Placeholder:_  
`images/web-create-merge-request.png`

---

## 🔐 GitLab CI/CD `release_main` Job (Admin Only)

> This job is restricted to maintainers/admins. It:
- Switches to main branch
- Prepares release
- Creates tags
- Creates environment branches (Main, QA, Development)
- Force updates QA/Development from main

```yaml
# Triggered only on main branch push or MR
rules:
  - if: '($CI_COMMIT_BRANCH == "main" || $CI_COMMIT_BRANCH == "Main") && ($CI_PIPELINE_SOURCE == "push" || $CI_PIPELINE_SOURCE == "merge_request_event")'
```

🔐 Developers cannot run this pipeline. Only Maintainers trigger it from `main`.

---

## 🧭 Summary Table

| Task                         | Eclipse Action / Note                                |
|------------------------------|------------------------------------------------------|
| Checkout Development         | Git Repos ➡ Remotes ➡ origin/development ➡ Checkout |
| Create Feature Branch        | Right-click `development` ➡ Switch To ➡ New Branch  |
| Commit Changes               | Git Staging ➡ Stage ➡ Commit                         |
| Push Branch                  | Team ➡ Push Branch                                   |
| Create Merge Request         | GitLab/GitHub Web ➡ Source ➡ Target = Development    |

---

## 📂 Suggested Images

```
images/
├── eclipse-checkout-development.png
├── eclipse-create-feature-branch.png
├── eclipse-git-commit.png
├── eclipse-push-feature-branch.png
└── web-create-merge-request.png
```

---

💡 _This setup ensures developers work safely in `Development` without modifying protected `main` branch._
