# tier2 repo

A repository that includes YAML manifests. Manifests can define GCP resources in `config connector` format or the Kubernetes components and resources. Refer to this repo for additionnal information. TODO: add link

## csync

The `/csync` contains the configuration for what the ConfigSync operator should be observing. For example, It is within this configuration that you specify the `repo url`, the `folder`, the `branch` and the `tag`.

Contributing:

- Any modification should be implemented within the `source-customization` folder.

## tier2

The `/tier2` folder is where the client resources that enables the underneath structure to work. This functionality is also known as the `client` landing zone.

Contributing:

- Any modification should be implemented within the `source-customization` folder.

## Permissions

A pull request affecting `/*` will include the Platform admin as required reviewers.

## Tags

Tags are generated only when changes are affecting the `/tier2` folder. This functionality is possible because of the `version-tagging` pipeline.

The tags will be created by that pipeline job after commits are merge to the `main` branch.

### **IMPORTANT**

We recommend using those tags in the `setters-version.yaml` under the `/csync/source-customization` folder to define what has to be observed by the configsync operator.
