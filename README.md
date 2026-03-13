<div align="center">
  <h1> Python Application Repository</h1>
  <p><strong>Source Code & CI/CD Pipeline Foundation</strong></p>
</div>

<hr />

## Project Overview
This repository contains the source code for our Python application and the associated <b>CI/CD Pipeline</b> defined in GitHub Actions. The pipeline automates testing, Docker image building, and configuration updates for GitOps deployment.

### Deployment Flow (CI/CD)
The process is triggered by a push to the designated branch (<code>main</code> in this setup):
<p align="center">
  <b>Push to 'main'</b> → <b>CITest</b> → <b>CDBuild Docker</b> → <b>CDUpdate Helm</b> → <b>ArgoCD Deployment</b>
</p>

---

## Points of Customization for Future Use
When reusing this pipeline for a new service, you <b>MUST</b> update the following sections in <code>.github/workflows/main.yml</code>:

<table>
  <tr>
    <th>Section</th>
    <th>Required Change</th>
  </tr>
  <tr>
    <td><b>Trigger Branch</b></td>
    <td>In the <code>on:</code> section, change <code>main</code> to the target branch for the new service.</td>
  </tr>
  <tr>
    <td><b>build-and-push (Step 3)</b></td>
    <td>Update the <code>images:</code> path to reflect the new image name in GHCR: <br><code>ghcr.io/your-username/new-service-name/app-name</code></td>
  </tr>
  <tr>
    <td><b>update-helm-repo (Step 1 & 3)</b></td>
    <td>Update the <code>repository:</code> to point to the correct Helm chart repository and update the <code>yq</code> command path to point to the correct <code>values.yaml</code> file.</td>
  </tr>
</table>

---

## Repository Structure
| File/Folder | Purpose |
| :--- | :--- |
| <b>app.py</b> | Main application source code. |
| <b>test_app.py</b> | Unit tests that must pass for the pipeline to continue. |
| <b>requirements.txt</b> | List of Python dependencies needed for the app and tests. |
| <b>Dockerfile</b> | Instructions for building the application's Docker image. |
| <b>.github/workflows/main.yml</b> | The complete CI/CD Pipeline definition. |

---

## Guide for Developers (How to Contribute)
To contribute new features or fixes, follow these steps:

1. <b>Clone the Repository:</b>
   ```bash
   git clone [https://github.com/juanjosesuarezburgos/aplicacion-python.git](https://github.com/juanjosesuarezburgos/aplicacion-python.git)
   cd aplicacion-python
