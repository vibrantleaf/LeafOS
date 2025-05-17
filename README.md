# Morgi Gwyrdd
 &nbsp; [![bluebuild build badge](https://github.com/vibrantleaf/morgi-gwyrdd/actions/workflows/build.yml/badge.svg)](https://github.com/vibrantleaf/morgi-gwyrdd/actions/workflows/build.yml)

Just my personal fork of [Bazzite](https://bazzite.gg/).

Built using [Blue Build](https://blue-build.org/) and [Universal Blue](https://universal-blue.org/).

## Installation

> [!WARNING]  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed: *(Not needed if your already using any of or any of which that is derived from any of Universal Blue's images.)*
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/vibrantleaf/morgi-gwyrdd:latest
  ```
- Reboot to complete the rebase: *(if needed)*
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/vibrantleaf/morgi-gwyrdd:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/vibrantleaf/morgi-gwyrdd:latest
```

## FAQ

Q: No `sudo`?

A: Use `run0` instead, *please consider aliassing `sudo` to `run0` if you find that to be problematic*.

Here are two examples for how use `run0`:
```
run0 echo 'true'
```

```
run0 systemctl reboot -r +60
```
