# Test CMS Open data container in github action

From [Github actions instructions](https://help.github.com/en/actions/building-actions/creating-a-docker-container-action)

This workflow uses an action to pull [the slc6 container with the CMSSW_5_3_32 release installed](https://hub.docker.com/r/cmsopendata/cmssw_5_3_32), and to build another container on top of it. An OD file is inspected and an output file produced. It is passed as an artifact. 

Because of the default volume mount and home directory settings for the `docker run` command in github actions the following changes were required:
 - change to `/home/cmsusr` before building the CMSSW release area in Entrypoint
 - change owner to `cmsusr` for `/github/worspace` so that the output file can be passed as an artifact

The workflow is triggered by PR.

## Inputs

### `file-name`

**Required** The name of the file to inspect. Default `"root://eospublic.cern.ch//eos/opendata/cms/Run2012C/SingleElectron/AOD/22Jan2013-v1/10000/00626847-9EAC-E211-ABAA-00259059642E.root"`.

### `CMSSW_VERSION`

**Required**  Default `"CMSSW_5_3_32"`. Does not make much sense here as it is the only release area available in the image, but could be used if passed also to the base image name.

## Outputs

### `time`

The time of the run (just a trial).

### `another_output`

Output file name. 

## Artifacts

The output of edmProvDump.
