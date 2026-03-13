<div align="center">
  <h1>Python Application Repository</h1>
  <p><strong>Source Code & CI/CD Pipeline Foundation</strong> [cite: 3]</p>
</div>

<hr />

<div align="center">
  <h2>Project Overview</h2>
</div>

This repository contains the source code for our Python application and the associated <b>CI/CD Pipeline</b> defined in GitHub Actions[cite: 3]. The pipeline automates testing, Docker image building, and configuration updates for GitOps deployment[cite: 4].

<div align="center">
  <h3>Deployment Flow (CI/CD)</h3>
</div>

The process is triggered by a push to the designated branch (<code>development</code> in this setup)[cite: 6]:
<p align="center">
  <b>Push to 'development'</b> → <b>CITest</b> → <b>CDBuild Docker</b> → <b>CDUpdate Helm</b> → <b>ArgoCD Deployment</b> [cite: 7]
</p>

<hr />

<div align="center">
  <h2>Points of Customization for Future Use</h2>
</div>

When reusing this pipeline for a new service, you <b>MUST</b> update the following sections in <code>.github/workflows/main.yml</code>[cite: 32]:

<table>
  <tr>
    <th>Section</th>
    <th>Required Change</th>
  </tr>
  <tr>
    <td><b>Trigger Branch</b></td>
    <td>In the <code>on:</code> section, change <code>development</code> to the target branch for the new service[cite: 33].</td>
  </tr>
  <tr>
    <td><b>build-and-push (Step 3)</b></td>
    <td>Update the <code>images:</code> path to reflect the new image name in GHCR: <br><code>ghcr.io/your-username/new-service-name/app-name</code> [cite: 34, 35]</td>
  </tr>
  <tr>
    <td><b>update-helm-repo (Step 1 & 3)</b></td>
    <td>Update the <code>repository:</code> to point to the correct Helm chart repository [cite: 37] and update the <code>yq</code> command path to point to the correct <code>values.yaml</code> file[cite: 38].</td>
  </tr>
</table>

<hr />

<div align="center">
  <h2>Repository Structure</h2>
</div>

| File/Folder | Purpose |
| :--- | :--- |
| <b>app.py</b> | Main application source code[cite: 9]. |
| <b>test_app.py</b> | Unit tests that must pass for the pipeline to continue[cite: 9]. |
| <b>requirements.txt</b> | List of Python dependencies needed for the app and tests[cite: 9]. |
| <b>Dockerfile</b> | Instructions for building the application's Docker image[cite: 9]. |
| <b>.github/workflows/main.yml</b> | The complete CI/CD Pipeline definition[cite: 9]. |

<hr />

<div align="center">
  <h2>Guide for Developers (How to Contribute)</h2>
</div>

To contribute new features or fixes, follow these steps[cite: 10, 11]:

1.  <b>Clone the Repository:</b> [cite: 12]
    ```bash
    git clone [https://github.com/juanjosesuarezburgos/aplicacion-python.git](https://github.com/juanjosesuarezburgos/aplicacion-python.git)
    cd aplicacion-python
    ```
2.  <b>Work on a Feature Branch:</b> [cite: 15]
    Create a new branch: <code>git checkout -b feature/my-new-feature</code>[cite: 16].
    * <b>IMPORTANT:</b> The pipeline triggers only on pushes to <b>development</b>[cite: 17]. Use Pull Requests targeting that branch[cite: 18].
3.  <b>Local Testing (Recommended):</b> [cite: 19]
    * Install dependencies: <code>pip install -r requirements.txt</code> [cite: 20]
    * Run tests: <code>pytest</code> [cite: 21]
4.  <b>Submitting Changes:</b> [cite: 22]
    Push your branch [cite: 25] and create a <b>Pull Request</b> to merge into <code>development</code>[cite: 26]. The pipeline will run automatically on the PR[cite: 27].

<hr />

<div align="center">
  <h2> CI/CD Pipeline Details (main.yml)</h2>
</div>

The pipeline is structured in three sequential jobs using <code>needs:</code>[cite: 28, 29]:

| Job Name | Dependency | Purpose |
| :--- | :--- | :--- |
| <b>test</b> | None | <b>CI:</b> Runs unit tests using pytest[cite: 30]. |
| <b>build-and-push</b> | needs: test | <b>Step 2:</b> Builds the Docker image and pushes it to GHCR[cite: 30]. |
| <b>update-helm-repo</b> | needs: build-and-push | <b>Step 3:</b> Updates the version tag in the <code>charts-helm</code> repository[cite: 30]. |

<hr />

<div align="center">
  <sub>Maintained by <a href="https://github.com/juanjosesuarezburgos">juanjosesuarezburgos</a></sub>
</div>
