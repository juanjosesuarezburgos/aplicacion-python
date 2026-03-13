# aplicacion-python

<div align="center">
  <h1> Python Pipeline Skeleton</h1>
  <p><strong>Standardized Source Code & CI/CD Structure for GitHub Actions & GitOps</strong></p>
</div>

<hr />

## Project Overview
This repository contains the core source code for a Python application and a pre-configured <b>CI/CD Pipeline</b>[cite: 3]. The pipeline automates testing, Docker image construction, and configuration updates for <b>GitOps deployment</b> via ArgoCD[cite: 4, 40].

### Deployment Flow
The automation follows a sequential logic triggered by pushes to the <code>development</code> branch[cite: 6, 7]:
<p align="center">
  <b>Push to Development</b> → <b>CI Test</b> → <b>CD Build Docker</b> → <b>CD Update Helm</b> → <b>ArgoCD Deployment</b> [cite: 7]
</p>

---

## MANDATORY: Customization for New Services
When reusing this structure for a new implementation, you <b>MUST</b> update these sections in <code>.github/workflows/main.yml</code>:

<table>
  <tr>
    <th>Target Area</th>
    <th>Adjustment Required</th>
  </tr>
  <tr>
    <td><b>Trigger Branch</b></td>
    <td>In the <code>on:</code> section, change <code>development</code> to your new target branch[cite: 33].</td>
  </tr>
  <tr>
    <td><b>Image Path</b></td>
    <td>Update <code>images:</code> in the <code>build-and-push</code> job to reflect your new GHCR path: <br><code>ghcr.io/your-username/new-service-name/app-name</code>[cite: 34, 35].</td>
  </tr>
  <tr>
    <td><b>Helm Repository</b></td>
    <td>Update the <code>repository:</code> field in the <code>update-helm-repo</code> job[cite: 36, 37].</td>
  </tr>
  <tr>
    <td><b>Manifest Path</b></td>
    <td>Update the <code>yq</code> command path to point to the correct <code>values.yaml</code> file in your Helm repo[cite: 38].</td>
  </tr>
</table>

---

##  Repository Structure
| File/Folder | Purpose |
| :--- | :--- |
| <b>app.py</b> | Main application source code[cite: 9]. |
| <b>test_app.py</b> | Unit tests (must pass for the pipeline to continue)[cite: 9]. |
| <b>requirements.txt</b> | Python dependencies for app and testing[cite: 9]. |
| <b>Dockerfile</b> | Instructions for building the container image[cite: 9]. |
| <b>.github/workflows/</b> | The complete CI/CD Pipeline definition (main.yml)[cite: 9]. |

---

##  Developer Guide (How to Contribute)
1. <b>Clone:</b> <code>git clone https://github.com/juanjosesuarezburgos/aplicacion-python.git</code>[cite: 13].
2. <b>Branching:</b> Create a feature branch (e.g., <code>feature/my-new-feature</code>)[cite: 16]. 
   * <i>Note: The pipeline triggers only on pushes to <code>development</code>[cite: 17]. Use Pull Requests to merge feature work[cite: 18].</i>
3. <b>Local Testing:</b> 
   * Install: <code>pip install -r requirements.txt</code>[cite: 20].
   * Run: <code>pytest</code>[cite: 21].
4. <b>Submit:</b> Push your branch and open a PR[cite: 25, 26]. The pipeline will run automatically on the PR[cite: 27].

---

##  Pipeline Details (Jobs)
The <code>main.yml</code> file uses <code>needs:</code> to ensure sequential execution[cite: 29]:
* <b>test:</b> Runs unit tests[cite: 30].
* <b>build-and-push:</b> Builds and pushes the image to GHCR (Depends on <code>test</code>)[cite: 30].
* <b>update-helm-repo:</b> Updates the version tag in the Helm repository (Depends on <code>build-and-push</code>)[cite: 30].

<hr />

<div align="center">
  <sub>Managed via <b>ArgoCD (GitOps)</b> — The Helm repository is the Source of Truth[cite: 40].</sub>
</div>
