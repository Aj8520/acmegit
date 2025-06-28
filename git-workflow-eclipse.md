# 🧭 Git Workflow in Eclipse (GUI-Based)

**Author**: <a href="https://www.linkedin.com/in/ajayaniljadhav" target="_blank" rel="noopener noreferrer">Ajay Jadhav</a>

This guide walks you through the complete Git workflow **using Eclipse**, showcasing how common Git commands (`status`, `add`, `commit`, `push`, `pull`) map to GUI actions.

---

## 🛠️ Prerequisite: Git Project in Eclipse

> Make sure you have a project cloned via **Git (SSH/HTTPS)** in Eclipse.

---

## 🔍 1. Git Status in Eclipse

### ▶️ What it does:
Checks the current state of the working directory — unstaged, staged, untracked files.

### 📍 In Eclipse:

- Right-click on the project ➡️ **Team** ➡️ **Synchronize Workspace**

![Synchronize Workspace](https://i.postimg.cc/rwxwXn0J/syncronize.png)

- Or click the **Synchronize** icon in the Git Perspective

📸 **Image:**
![Git Status - Synchronize](https://i.postimg.cc/q77BhkDm/fileshowing.png)

> 🔄 Modified/untracked files will be listed under "Outgoing", "Incoming", or "Conflicts".

---

## 📥 2. Git Add (Stage Files)

### ▶️ What it does:
Moves modified/untracked files into the staging area.

### 📍 In Eclipse:

- Open **Git Staging** view: `Window ➡ Show View ➡ Other ➡ Git ➡ Git Staging`

![showview other](https://i.postimg.cc/zvTHtzrC/viewother.png)

![git staging](https://i.postimg.cc/90BFwr2n/stagingarea.png)

- Drag files from **Unstaged Changes** to **Staged Changes**

📸 **Image:**
![Git Add - Git Staging](https://i.postimg.cc/j2qY9vVM/git-Staging.png)

> 📦 Once files are in “Staged Changes,” they are ready to commit.

---

## 🧾 3. Git Commit

### ▶️ What it does:
Commits staged changes with a commit message to the local Git repository.

### 📍 In Eclipse:

- In the **Git Staging** view:
  - Add a commit message
  - Click the **Commit** or **Commit and Push** button

📸 **Image:**
![Git Commit](https://i.postimg.cc/fybTXMbW/commit.png)

> 📝 The snapshot is now part of your local Git history.

---

## 🚀 4. Git Push

### ▶️ What it does:
Uploads local commits to the remote repository.

### 📍 In Eclipse:

- Right-click project ➡️ **Team** ➡️ **Push to Upstream**

📸 **Image:**
![Git Push](https://i.postimg.cc/mgdDLzZX/pushtoupstream.png)

- Or use **Git Staging** ➡ Click **Commit and Push**
![Git Commit](https://i.postimg.cc/fybTXMbW/commit.png)


> 📤 Push will send your latest commits to GitHub, GitLab, or any configured remote.

---

## ⬇️ 5. Git Pull

### ▶️ What it does:
Brings in remote changes and merges them into your current branch.

### 📍 In Eclipse:

- Right-click project ➡️ **Team** ➡️ **Pull**
- Or click **Pull** icon in Git Repositories view

📸 **Image:**
![Git Pull](https://i.postimg.cc/3rnJC0mK/pull.png)

> 🔁 Remote changes are merged with your local branch.

---

## 🧭 Summary Table: Git vs Eclipse GUI

| Git Command      | Eclipse Action                                 |
|------------------|------------------------------------------------|
| `git status`     | Team ➡ Synchronize / Git Staging               |
| `git add .`      | Git Staging ➡ Drag to “Staged Changes”         |
| `git commit -m`  | Git Staging ➡ Enter message ➡ Commit           |
| `git push`       | Team ➡ Push to Upstream                        |
| `git pull`       | Team ➡ Pull                                    |

---