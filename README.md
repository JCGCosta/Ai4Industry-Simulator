# AI4Industry Simulator

> This project contains a Multi-Agent System developed using the JaCaMo Framework and a GUI made with react/spring to represent 4 different workshops within an industry, but also the interoperable description of the physical things/assets of the workshops.

## Acknowledgements:

> This project was done by the group 2 on part of the hackathon held in 2025 AI4Industry Summer School (https://ci.mines-stetienne.fr/ai4industry/2025/programme.html).

### Original Repositories:
- MultiAgentSystem: https://gitlab.emse.fr/ai4industry/hackathon

- IndustryGUI: https://gitlab.emse.fr/ai4industry/ai4industry-gui

- ThingsDescription: https://gitlab.emse.fr/ai4industry/ai4industry/-/tree/master/use-case/td

I would like to thank to the AI4Industry organization committee, for the amazing lectures and dissemination event.

## Architecture Overview

The architecture supporting the hackathon use case is structured along three layers fully supported by the Web architecture (i) to make interoperate the physical things or devices deployed in each of the workshops composing the factory, as well as the external devices or services exposed by other factories or utilities, (ii) to provide access to the shared data and knowledge produced by these different resources or published by external sources, and (iii) to coordinate and control flexible process enacted by a decentralized set of agents.

<img src="https://gitlab.emse.fr/ai4industry/hackathon/-/wikis/uploads/97b7d0299fcae8c0df9c82c7e91fe663/architecture-hackathon.png" alt="ProjectArchitecture" title="Project Architecture.">

For a deep explanation of the Industry setup and Scenario please see: https://gitlab.emse.fr/ai4industry/hackathon/-/wikis/scenario

## Running

For installation and replication of the scenario please see: https://gitlab.emse.fr/ai4industry/hackathon/-/wikis/hackathon-configuration

> You may encounter issues into installing the node-red-contrib-web-of-things plugin, this plugin requires nan and serialports@9.2.8 to run properly, but the serialports version requires the node version v18.20.3, so the earliest versions may crash. To solve this issue you can install [nvm](https://github.com/nvm-sh/nvm) to have multiple node environments.

For the dashboard after installation of the node-red dependencies, import the NodeRedFlows.json file.

## Results

- Node-red dashboard for monitoring the factory:



- MAS simulation running in the factory dashboard:

