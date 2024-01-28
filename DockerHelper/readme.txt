# DockerHelper Module - README

## Overview

This PowerShell module, named DockerHelper, provides cmdlets to build Docker images, copy prerequisites, and run Docker containers. The module includes functionality to create a Docker image for a Fibonacci sequence generator.

## Instructions

### 1. Folder Structure

- Create a folder named `DockerHelper`.
- Inside `DockerHelper`, create `DockerHelper.psm1` 
- Create a subfolder named `DockerFiles` inside `DockerHelper`.
- Inside `DockerFiles`, create `Dockerfile` and `Fibonacci.ps1` 

### 2. Load the Module

Open a PowerShell session and import the DockerHelper module:

Import-Module -Name "Path\To\DockerHelper\DockerHelper.psm1"

### Build Docker image

Build-DockerImage -Dockerfile "Path\To\DockerHelper\DockerFiles\Dockerfile" -Tag "fibonacci-image" -Context "Path\To\DockerHelper\DockerFiles"

### Input Prerequisites

Copy-Prerequisites -ComputerName "RemoteComputer" -Path @("Local\Path\To\Files") -Destination "C$\Path\On\Remote\Host"

### Run Docker container

Run-DockerContainer -ImageName "fibonacci-image"

Run-DockerContainer -ImageName "fibonacci-image" -DockerParams @("-n", "10")


