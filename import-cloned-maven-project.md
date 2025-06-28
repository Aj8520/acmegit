# 📦 Importing Cloned Maven Project into Eclipse

**Use Case**: You have cloned a Git repository via SSH and now want to import the Maven project into Eclipse.

**Author**: [Ajay Jadhav](https://www.linkedin.com/in/ajayaniljadhav)  
**Last Updated**: June 28, 2025

---

## ✅ Prerequisite

- You have already cloned the project using:

```bash
git clone git@172.16.2.231:root/padm.git
```

Example:
```bash
git clone git@172.16.2.231:root/padm.git
```

---

## 🛠️ Step 1: Open Eclipse and Import Project

1. Open **Eclipse IDE**  
2. Go to `File` → `Import`

![Step 1](https://i.postimg.cc/v8rH9BK4/import.png)

---

## 🧱 Step 2: Select Maven Project

1. In the Import Wizard, select:  
   `Maven` → `Existing Maven Projects`  

![existingmaven.png](https://i.postimg.cc/j2x9Nh8c/existingmaven.png)

2. Click `Next`

---

## 📂 Step 3: Browse to Cloned Directory

1. Click on `Browse`

![brows.png](https://i.postimg.cc/W3Hz4ZBH/brows.png)

2. Navigate to the local directory where the project was cloned using Git  
   Example:
   ```
   /home/a/ajay2/padm
   ```
![slect.png](https://i.postimg.cc/59zpMmdT/slect.png)

3. Select the folder and click `Open`

---

## ✅ Step 4: Finish Import

1. Eclipse will detect the `pom.xml` files
2. Click on `Select All`

![slectall.png](https://i.postimg.cc/gc59gsy7/slectall.png)

3. Click `Finish`

![finish.png](https://i.postimg.cc/W4tCmJFV/finish.png)

Your Maven project will now be imported into the Eclipse workspace.

---

## ⚙️ Step 5: Configure Maven `settings.xml` (Optional but recommended)

1. Go to `Window` → `Preferences`

![windows.png](https://i.postimg.cc/yNPz1SgC/windows.png)

2. Search for **Maven** → Click on **User Settings**

![usersetting.png](https://i.postimg.cc/YqqRZLkm/usersetting.png)

3. Set path for `settings.xml`  
   Example:
   ```
   /home/a/Ajay2/padm/acme-document/profiles/settings.xml
   ```
![applyok.png](https://i.postimg.cc/8knfk7Mv/applyok.png)


4. Click `Apply` → `OK`

---

## 🧩 Tips

- If the project doesn't build automatically, right-click the project → `Maven` → `Update Project`
- Ensure JDK is properly configured under `Java` → `Installed JREs`

---

## 🧾 Summary

| Step             | Description                            |
|------------------|----------------------------------------|
| Clone Repository | Via SSH using `git clone`              |
| Import           | Using `Existing Maven Project` in Eclipse |
| Settings         | Configure Maven `settings.xml` path    |

---

🧠 **Note**: This process replaces the older SVN import steps and is fully Git-based. No need to configure SVN decorations.