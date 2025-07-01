# 🌱 Developer Git Workflow in Eclipse (Development Branch Access Only)

**Author**: <a href="https://www.linkedin.com/in/ajayaniljadhav" target="_blank" rel="noopener noreferrer">Ajay Jadhav</a>  
**Updated**: June 30, 2025

This guide explains the Git workflow **for developers** who only have access to the `development` branch in a Git-managed project. This includes:

- Checking out the remote `development` branch (if only available under Remote Tracking)
- Creating a new feature branch from `development`
- Pushing changes
- Creating a merge request (MR) **back to `development`**

---

## 🧩 Workflow Overview

```plaintext
origin/development (remote tracking)
   ↓
Checkout as local branch: development
   ↓
Create feature branch: ajay-login-fix
   ↓
Make changes, commit, push
   ↓
Create Merge Request → target: development
```

---

## 🪴 Step 1: Checkout `origin/development` (Remote Tracking Branch)

1. Open **Git Repositories** view in Eclipse 

![gitreporsitory.png](https://i.postimg.cc/DyvwMDbK/gitreporsitory.png)

2. Expand:  
   ```
   Branches → Remote Tracking → origin → development
   ```
![developmentbranch.png](https://i.postimg.cc/VLxH6y9x/developmentbranch.png)

3. Right-click `origin/development`  

![rightclickcheckout.png](https://i.postimg.cc/sxR4zyCm/rightclickcheckout.png)

4. Choose **Checkout As...**

![track1.png](https://i.postimg.cc/2yKjvjjF/track1.png)

5. In the dialog:
   - ✅ Create new local branch: `development`
   - ✅ Track remote branch: `origin/development`
   - Click **Finish**



![track1.png](https://i.postimg.cc/2ym9wnyC/createbranch.png)


---

## 🌿 Step 2: Create Feature Branch (from Local `development`)

1. In **Git Repositories**, right-click local 
2. Choose **Switch To ➡ New Branch**

![switchtonew.png](https://i.postimg.cc/W3BZybFw/switchtonew.png)

3. Enter a feature branch name, e.g., `ajay-jadhav`
4. ✅ Check **Checkout new branch**
5. Click **Finish**

 
![create-Branch](https://i.postimg.cc/nc0zjhFS/create-Branch.png)

---

## 🛠️ Step 3: Make Changes and Commit

1. Perform your code changes
2. Open **Git Staging View**
3. Drag files to **Staged Changes**
4. Add a commit message
5. Click **Commit**

![firstcommit.png](https://i.postimg.cc/yYJnQq08/firstcommit.png)

---

## 🚀 Step 4: Push Your Feature Branch

1. Right-click the project ➡ **Team ➡ Push Branch**

![pushbransh.png](https://i.postimg.cc/rzXkd1S6/pushbransh.png)

2. Ensure the remote branch name matches your local branch (e.g., `ajay-jadhav`)
3. Click **Next ➡ Finish**

![branchpush.png](https://i.postimg.cc/wxhHPPHg/branchpush.png)

---

## 🔁 Step 5: Create Merge Request to `development`

> MRs must be made from your feature branch → target: `development`

1. Open GitLab/GitHub web interface
2. It may show “Push successful. Create merge request?”

![mergerequestoption.png](https://i.postimg.cc/Yqvc7sBv/mergerequestoption.png)

3. Or create manually:
   - Source branch: `ajay-jadhav`
   - Target branch: `development`

![sourcetaget.png](https://i.postimg.cc/hGP6Cys4/sourcetaget.png)

4. Fill in title, description, reviewers

![description.png](https://i.postimg.cc/X75bFzHT/description.png)

5. Click **Create Merge Request**

![createmergerequestclick.png](https://i.postimg.cc/ydTTws8w/createmergerequestclick.png)


![Git merge](https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExazVmeGdkbmdiM3htM3praXcyaG8wdHR6a3NuczJvbzlzNmR0ODVlMCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/D0WOL0ogZIoG4/giphy.gif)



## 🧭 Summary Table

| Task                         | Eclipse Action / Note                                |
|------------------------------|------------------------------------------------------|
| Checkout `origin/development` | Remote Tracking → Checkout As Local                 |
| Create Feature Branch        | Right-click `development` ➡ Switch To ➡ New Branch  |
| Commit Changes               | Git Staging ➡ Stage ➡ Commit                         |
| Push Branch                  | Team ➡ Push Branch                                   |
| Create Merge Request         | GitLab Web ➡ Source ➡ Target = development           |

---


💡 _This setup ensures developers contribute safely in the `development` branch without modifying protected branches like `main`._