
# Git from Scratch - Beginner Guide (Ubuntu + Eclipse + SSH)

**Author**: <a href="https://www.linkedin.com/in/ajayaniljadhav" target="_blank" rel="noopener noreferrer">Ajay Jadhav</a>

**Created Date**: June 24, 2025

## 📌 1. Introduction to Git
Git is a distributed version control system to track changes in source code.

![Git Intro](https://raw.githubusercontent.com/github/explore/main/topics/git/git.png)

---

## ⚙️ 2. Installing Git on Ubuntu

```bash
sudo apt update
sudo apt install git
```

![Install Git](https://i.postimg.cc/Fzmd9gqG/gitubuntu.png)

Verify installation:

```bash
git --version
```

---

## 📎 Before Global Configuration
If you're setting up Git for the first time, follow this user account creation process:

🔗<a href="gitlab-user-registration.md" target="_blank">GitLab User Registration Guide</a> 

---

## 🧑‍💻 3. Configure Git User

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

---

## 🔐 4. Set Up SSH for GitHub/GitLab

🔗<a href="ssh-gitlab-setup.md" target="_blank">SSH Key Generation for GitLab</a> 

---

## 📂 5. Basic Git Commands

Clone a repo:

```bash
git clone git@172.16.2.231:root/padm.git
```

![Git Clone](https://i.postimg.cc/59FhXq6D/gitclone.png)


🔗<a href="import-cloned-maven-project.md" target="_blank">Import Cloned Maven Project in Eclipse</a> 

🔗<a href="git-workflow-eclipse.md" target="_blank">🧭 Git Workflow in Eclipse (GUI-Based)</a> 


![gitflowgif](https://i.postimg.cc/xjx8bt5F/1720581317500-ezgif-com-overlay-1.gif)

---

## 🌿 6. Branching

```bash
git checkout -b new-feature
git checkout main
git merge new-feature
```

![Git Branch](https://wac-cdn.atlassian.com/dam/jcr:813202ee-f9de-41bc-bf0f-169b6adfb8fd/01.svg)

---

## 🧩 7. Git in Eclipse

Use EGit Plugin:
- Go to `Help` → `Eclipse Marketplace`
- Search: EGit

Clone using:
- `File` → `Import` → `Git` → `Projects from Git`
- Use SSH URL

![Eclipse Git](https://www.vogella.com/tutorials/EclipseGit/img/egit-import-0.png)

---

## 🔚 8. Git Cheat Sheet

| Command        | Description         |
|----------------|---------------------|
| git status     | Show changes        |
| git add .      | Stage all changes   |
| git commit -m  | Save changes        |
| git push       | Push to remote      |
| git pull       | Pull from remote    |
| git checkout   | Switch branches     |
| git merge      | Merge branches      |