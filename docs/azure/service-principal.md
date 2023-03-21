# Create a Dedicated Azure Service Principal with Azure CLI

## Overview

Automated tools that use Azure services should always have restricted permissions.

Instead of having applications sign in as a fully privileged user, Azure offers service principals.

## What is a Service Principal?

An Azure service principal is an identity created for use with applications, hosted services,
and automated tools to access Azure resources.

This access is restricted by the roles assigned to the service principal, giving you control over
which resources can be accessed and at which level.

For security reasons, it's always recommended to use service principals with automated tools rather
than allowing them to log in with a user identity.

This document shows the steps for creating, getting information about, and
resetting an Azure service principal with the Azure CLI.

## Create a Service Principal

Create an Azure service principal with the `az ad sp create-for-rbac` command.

The `appId` and `tenant` keys appear in the output of `az ad sp create-for-rbac` and
are used in service principal authentication.

Record their values, but they can be retrieved at any point with `az ad sp list`.

When creating a service principal, you choose the type of sign-in authentication it uses.

There are two types of authentication available for Azure service principals:

- password-based authentication
- certificate-based authentication

When you create an Azure service principal using the az ad sp create-for-rbac command, the output includes credentials that you must protect. Be sure that you do not include these credentials in your code or check the credentials into your source control. As an alternative, consider using managed identities if available to avoid the need to use credentials.

To reduce your risk of a compromised service principal, assign a more specific role and narrow the scopes to a resource or resource group. See Steps to add a role assignment for more information.

### Password Based Authentication

