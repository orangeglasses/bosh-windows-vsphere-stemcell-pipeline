# bosh-windows-vsphere-stemcell-pipeline
Concourse CI/CD pipeline for creating a BOSH windows stemcell from a vSphere base VM as described [here](https://github.com/cloudfoundry-incubator/bosh-windows-stemcell-builder/blob/master/create-manual-vsphere-stemcells.md).

![Pipeline](pipeline.PNG?raw=true "Pipeline")

## Requirements

In order to use this pipeline you need:
- a Windows 2012R2 VM with [some minimal initial setup](BaseImage.md)
- Concourse 
- access to vRealize Orchestrator (for cloning the VM) and vCenter (to extract the prepared VM as OVA)
- a Redis deployment (used to store in flight parameters - like clone IP)
- a S3 deployment for storing the final stemcell
