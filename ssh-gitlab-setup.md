
# 🔐 SSH Key Generation and Configuration for GitLab

**Author**: <a href="https://www.linkedin.com/in/ajayaniljadhav" target="_blank" rel="noopener noreferrer">Ajay Jadhav</a>

**Created Date**: June 24, 2025

This guide walks you through generating and configuring a new SSH key for GitLab access, using `ajayjadhav@gmail.com` as an example.

---

## 🔥 Step 1: Delete the Existing SSH Key (Optional)

### 🔍 Check if an SSH Key Already Exists

```bash
ls ~/.ssh/id_rsa.pub
```

If this file exists, you already have an SSH key.  
If not, skip to Step 2.

### ❌ Delete Old Key Files (Only If Required)

Only do this if you're sure you don’t need the old key anymore:

```bash
rm -f ~/.ssh/id_rsa ~/.ssh/id_rsa.pub
```

> ⚠️ **Warning**: This will permanently delete your existing SSH key.  
> Ensure it's not used by other services or accounts.

---

## 🆕 Step 2: Generate a New SSH Key for GitLab

Replace the email in the command with your GitLab account email:

```bash
ssh-keygen -t rsa -b 4096 -C "ajayjadhav@gmail.com"
```

**Example output:**

```
Generating public/private rsa key pair.
Enter file in which to save the key (/home/ajay/.ssh/id_rsa): [Press Enter]
Enter passphrase (empty for no passphrase): [Press Enter]
Enter same passphrase again: [Press Enter]
```

This will create:

- `~/.ssh/id_rsa` (Private key)  
- `~/.ssh/id_rsa.pub` (Public key)

---

## 📋 Step 3: Add the New SSH Key to GitLab

### 🔑 Copy the Public Key

```bash
cat ~/.ssh/id_rsa.pub
```

Copy the full output (starts with `ssh-rsa`).

### 💻 Add It to GitLab

1. Log in to GitLab.
2. Click your avatar → **Preferences** → **SSH Keys**.
3. Paste the key into the textbox.
4. Click **Add Key**.

---

## 🧪 Step 4: Test the SSH Connection

Use your GitLab server IP or domain. Example for a local GitLab instance:

```bash
ssh -T git@172.16.2.231
```

If successful, you'll see a message like:

```
Welcome to GitLab, @ajayjadhav!
```

---

✅ You’re now ready to securely access GitLab repositories using SSH!