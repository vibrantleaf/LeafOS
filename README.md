# Sharkfin 🦈
 &nbsp; [![bluebuild build badge](https://github.com/vibrantleaf/sharkfin/actions/workflows/build.yml/badge.svg)](https://github.com/vibrantleaf/sharkfin/actions/workflows/build.yml)

Just my personal fork of [Bluefin](https://projectbluefin.io/).

Built using [Blue Build](https://blue-build.org/) and [Universal Blue](https://universal-blue.org/).

I'm aiming for sharkfin to be a sort of half way point bettween Bluefin & Bazzite.

## Installation

> [!WARNING]  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.


> [!WARNING]
> Please verify the image's signature with cosign before rebasing to the image. [see](https://github.com/vibrantleaf/sharkfin/blob/main/README.md#verification).

To switch an existing atomic Fedora installation to the latest build:

- First switch to the unsigned image, to get the proper signing keys and policies installed: *(Not needed if your already using any of or any of which that is derived from any of Universal Blue's images.)*
  ```bash
  bootc switch --apply ghcr.io/vibrantleaf/sharkfin:latest
  ```
- Then switch to the signed image, like so:
  ```bash
  bootc switch --enforce-container-sigpolicy --apply ghcr.io/vibrantleaf/sharkfin:latest
  ```
The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

### nvidia supported variant
 - First switch to the unsigned image, to get the proper signing keys and policies installed: *(Not needed if your already using any of or any of which that is derived from any of Universal Blue's images.)*
  ```bash
  bootc switch --apply ghcr.io/vibrantleaf/sharkfin-nvidia:latest
  ```
- Then switch to the signed image, like so:
  ```bash
  bootc switch --enforce-container-sigpolicy --apply ghcr.io/vibrantleaf/sharkfin-nvidia:latest
  ```

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/how-to/generate-iso/). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

### ISO: Tldr

> [!WARNING]
> This process may take a while to fully complete.

> [!WARNING]
> Please verify the image's signature with cosign before building a iso from the image. [see](https://github.com/vibrantleaf/sharkfin/blob/main/README.md#verification).

If you have the [Bluebuild CLI](https://blue-build.org/how-to/local/), [Git](https://git-scm.com/),  [Just](https://just.systems/man/en/) and [Podman](https://podman.io/) or [Docker](https://www.docker.com/) and you can just use the following commands in your termimal to build yourself a offline ISO installer image.

```bash
git clone https://github.com/vibrantleaf/sharkfin.git
cd morgi-gwyrdd
just --justfile .justfile build-iso-from-image
```

If you don't have git (you will still need the other tools listed above) you can just download the [.zip file](https://github.com/vibrantleaf/sharkfin/archive/refs/heads/main.zip), extract it, open the `morgi-gwyrdd-main` folder in your termimal and run the following command:

```bash
just --justfile .justfile build-iso-from-image
```

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
curl -L -o /var/tmp/com.vibrantleaf.morgi-gwyrdd.cosign.pub https://raw.githubusercontent.com/vibrantleaf/sharkfin/refs/heads/main/cosign.pub

cosign verify --key /var/tmp/com.vibrantleaf.sharkfin.cosign.pub ghcr.io/vibrantleaf/sharkfin:latest
```

This command's output should **not** say that are no matching signatures

## FAQ
Q.1: I want to go back to x image

A.1: you can use the rebase back to your image

if you were using one of universial blue's images before see the ublues [images](https://github.com/orgs/ublue-os/packages) 

example for bluefin stable with out nvidia support:
```bash
curl -L -o /var/tmp/io.projectbluefin.cosign.pub https://raw.githubusercontent.com/ublue-os/bluefin/refs/heads/main/cosign.pub
cosign verify --key /var/tmp/io.projectbluefin.cosign.pub ghcr.io/ublue-os/bluefin:stable

sudo bootc switch --enforce-container-sigpolicy --apply ghcr.io/ublue-os/bluefin:stable
```


