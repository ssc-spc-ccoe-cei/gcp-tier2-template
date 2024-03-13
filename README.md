# tier2 repo

A repository that includes YAML manifests. Manifests can define GCP resources in `config connector` format or the Kubernetes components and resources. Refer to this repo for additional information. TODO: add link

- The `/*/configcontroller` folder is where GCP resources are defined using their `config connector` schema.
- The `/*/kubernetes/_X-FLEET-ID/**/_NAMESPACE` folder is where resources that have to be provisioned in a kubernetes `namespace` are defined. The `x-fleet-id` is the GCP project-id where the kubernetes clusters are deployed with character "x" as the environment code because this folder will contain the configuration for all environments.

  The GKE clusters are joined to an [Anthos Fleet](https://cloud.google.com/anthos/fleet-management/docs). This enables Anthos policy controller, Anthos config management and Anthos service mesh(future).

## csync

The `/csync` contains the configuration for what the ConfigSync operator should be observing. For example, It is within this configuration that you specify the `repo url`, the `folder`, the `branch` and the `tag`.

### Contributing

- Any modification should be implemented within the `source-customization` folder.

## tier2

The `/tier2` folder is where the client resources that enables the underneath structure to work. This functionality is also known as the `client` landing zone.

### Contributing

- Any modification should be implemented within the `source-customization` folder.

### Permissions

A pull request affecting `/*` will include the Platform admin as required reviewers.

## Branch Protection

The main branch of this repository is protected meaning that pushing a new commit to it will be denied. To implement changes, A Pull Request has to be completed.

Every other branches configured to be observed by ConfigSync will also have a branch protection rule defined.