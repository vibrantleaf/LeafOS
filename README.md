# Morgi Gwyrdd
 &nbsp; [![bluebuild build badge](https://github.com/vibrantleaf/morgi-gwyrdd/actions/workflows/build.yml/badge.svg)](https://github.com/vibrantleaf/morgi-gwyrdd/actions/workflows/build.yml)

Just my personal fork of [Bazzite](https://bazzite.gg/).

Built using [Blue Build](https://blue-build.org/) and [Universal Blue](https://universal-blue.org/).

## Installation

> [!WARNING]  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed: *(Not needed if your already using any of or any of which that is derived from any of Universal Blue's images.)*
  ```bash
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/vibrantleaf/morgi-gwyrdd:latest
  ```
- Reboot to complete the rebase: *(if needed)*
  ```bash
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```bash
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/vibrantleaf/morgi-gwyrdd:latest
  ```
- Reboot again to complete the installation
  ```bash
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](hhttps://blue-build.org/how-to/generate-iso/). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

### ISO: Tldr

> [!WARNING]
> This process may take a while to fully complete.

If you have [Git](https://git-scm.com/), the [Bluebuild CLI](https://blue-build.org/how-to/local/) and [Just](https://just.systems/man/en/) you can just use the following commands in your termimal to build yourself a offline ISO installer image.

```bash
git clone https://github.com/vibrantleaf/morgi-gwyrdd.git
cd morgi-gwyrdd
just --justfile ./.justfile build-iso-from-image
```

If you don't have git (you will still need the Bluebuild CLI and Just you can just download the [.zip file](https://github.com/vibrantleaf/morgi-gwyrdd/archive/refs/heads/main.zip), extract it, open the `morgi-gwyrdd-main` folder in your termimal and run the following command:

```bash
just --justfile ./.justfile build-iso-from-image
```

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/vibrantleaf/morgi-gwyrdd:latest
```

## FAQ

Q: No `sudo`?

A: I dont incude `sudo` in morgi-gwyrdd, Use `run0` instead, *please consider aliassing `sudo` to `run0` if you find that to be problematic*.

Here are two examples for how use `run0`:
```bash
run0 echo 'true'
```

```bash
run0 systemctl reboot
```
