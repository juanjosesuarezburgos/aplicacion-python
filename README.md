<div align="center">
  <h1>Python Application Repository</h1>

<hr />

<div align="center">
  <h2>Project Overview</h2>
</div>

This repository contains the source code for our Python application and the associated <b>CI/CD Pipeline</b> defined in GitHub Actions. The pipeline automates testing, Docker image building, and configuration updates for GitOps deployment.

<div align="center">
  <h3>Deployment Flow (CI/CD)</h3>
</div>

The process is triggered by a push to the designated branch (<code>main</code> in this setup):
<p align="center">
  <b>Push to 'main'</b> → <b>CITest</b> → <b>CDBuild Docker</b> → <b>CDUpdate Helm</b>
</p>

<hr />

<div align="center">
  <h2>Points of Customization for Future Use</h2>
</div>

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

<hr />

<div align="center">
  <h2>Repository Structure</h2>
</div>

| File/Folder | Purpose |
| :--- | :--- |
| <b>app.py</b> | Main application source code. |
| <b>test_app.py</b> | Unit tests that must pass for the pipeline to continue. |
| <b>requirements.txt</b> | List of Python dependencies needed for the app and tests. |
| <b>Dockerfile</b> | Instructions for building the application's Docker image. |
| <b>.github/workflows/main.yml</b> | The complete CI/CD Pipeline definition. |

<hr />

<div align="center">
  <h2>Guide for Developers (How to Contribute)</h2>
</div>

To contribute new features or fixes, follow these steps:

1.  <b>Clone the Repository:</b>
    ```bash
    git clone [https://github.com/juanjosesuarezburgos/aplicacion-python.git](https://github.com/juanjosesuarezburgos/aplicacion-python.git)
    cd aplicacion-python
    ```
2.  <b>Work on a Feature Branch:</b>
    Create a new branch: <code>git checkout -b feature/my-new-feature</code>.
    * <b>IMPORTANT:</b> The pipeline is currently configured to trigger only on pushes to the <b>main</b> branch. Use Pull Requests targeting that branch.
3.  <b>Local Testing (Recommended):</b>
    * Install dependencies: <code>pip install -r requirements.txt</code>
    * Run tests: <code>pytest</code>
4.  <b>Submitting Changes:</b>
    Push your branch and create a <b>Pull Request</b> to merge into <code>main</code>. The pipeline will run automatically on the PR.

<hr />

<div align="center">
  <h2>CI/CD Pipeline Details (main.yml)</h2>
</div>

The pipeline is structured in three sequential jobs using <code>needs:</code>:

| Job Name | Dependency | Purpose |
| :--- | :--- | :--- |
| <b>test</b> | None | <b>CI:</b> Runs unit tests using pytest. |
| <b>build-and-push</b> | needs: test | <b>Step 2:</b> Builds the Docker image and pushes it to GHCR. |
| <b>update-helm-repo</b> | needs: build-and-push | <b>Step 3:</b> Updates the version tag in the <code>charts-helm</code> repository. |

<hr />

<div align="center">
  <sub>Maintained by <a href="https://github.com/juanjosesuarezburgos">juanjosesuarezburgos</a></sub>
</div>
