# ACME Release Flow Overview (build-script Folder)

## 1. Preparation & Build
- **Profile/Tag Selection:** Choose build profile or tag.
- **Scripts:**
  - [`build.sh`](acme-document/build-script/build.sh): Build all modules for a profile.
  - [`buildnew.sh`](acme-document/build-script/buildnew.sh): Like build.sh, but updates source from SVN.
  - [`build-all.sh`](acme-document/build-script/build-all.sh): Build all profiles.
  - [`tagBuild.sh`](acme-document/build-script/tagBuild.sh): Build modules for a specific tag.
  - [`tagBuild-all.sh`](acme-document/build-script/tagBuild-all.sh): Build all profiles for a tag.

## 2. Release Preparation
- **Scripts:**
  - [`release.sh`](acme-document/build-script/release.sh): Maven release, copies WARs.
  - [`buildRelease.sh`](acme-document/build-script/buildRelease.sh): Release for each module.
  - [`beforeRelease.sh`](acme-document/build-script/beforeRelease.sh): Clean and prepare for release.

## 3. Deployment
- **Scripts:**
  - [`releaseLocal.sh`](acme-document/build-script/releaseLocal.sh): Deploy WARs to local Tomcat.
  - [`releaseNew.sh`](acme-document/build-script/releaseNew.sh): Deploy to new servers.
  - [`releaseOldBuild.sh`](acme-document/build-script/releaseOldBuild.sh): Deploy old builds (rollback).

## 4. FTP Upload
- **Scripts:**
  - [`uploadVersionReleaseToFtp.sh`](acme-document/build-script/uploadVersionReleaseToFtp.sh): Upload WARs to FTP.
  - [`uploadServerVerReleaseOnFtp.sh`](acme-document/build-script/uploadServerVerReleaseOnFtp.sh): Upload server WARs for a version.

## 5. Jenkins/Automation
- **Scripts:**
  - [`4 Deploy Acme PADM OLD JENKIN SCRIPT`](acme-document/build-script/4%20Deploy%20Acme%20PADM%20OLD%20JENKIN%20SCRIPT)
  - [`4 Deploy Acme PADM NEW JENKIN SCRIPT`](acme-document/build-script/4%20Deploy%20Acme%20PADM%20NEW%20JENKIN%20SCRIPT)
  - Automate build, release, and deployment for different customers/environments.

## 6. SonarQube Analysis
- **Script:**
  - [`sonarqube_analysis.sh`](acme-document/build-script/sonarqube_analysis.sh): Run SonarQube analysis.

---

## **Summary Flow**
1. Choose profile/tag
2. Build WARs (`build.sh`, `tagBuild.sh`, etc.)
3. Release with Maven (`release.sh`)
4. Copy WARs to wars folder
5. Deploy to server (`releaseLocal.sh`, `releaseNew.sh`, etc.)
6. Upload to FTP if needed (`uploadVersionReleaseToFtp.sh`)
7. Automate via Jenkins scripts for customer-specific flows

**References:**  
- [BUILD-README.md](BUILD-README.md)  
- [acme-document/build-script/](acme-document/build-script/)