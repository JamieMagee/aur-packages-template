# Arch User Repository (AUR) Packages Repository Template

This repository is a template for maintaining [Arch User Repository (AUR)][1] packages automatically using [Renovate][2].
Check out my [AUR packages repository][3] to see it working.

## How it works

Check out [the breakdown on my blog][4] for a step-by-step walkthrough.
The short version is:

1. Renovate will open PRs to update the `pkgver`
1. GitHub Actions will run `updpkgsums` and `makepkg --printsrcinfo > .SRCINFO` for each PR
1. When a PR is merged GitHub Actions will publish the package to the AUR (if you've configured the `AUR_USERNAME`, `AUR_EMAIL` and `AUR_SSH_PRIVATE_KEY` secrets).

## Adding a new package

1. Add a new directory with the package name
1. Manually create your `PKGBUILD` and `.SRCINFO`
1. Add a comment after pkgver with the [Renovate datasource][5] and package name

```
pkgver=1.2.3 # renovate: datasource=github-tags depName=git/git
```

## License

All code in this repository is licensed under [the MIT license][6].
See the `license` property in each `PKGBUILD` for the license under which each package is distributed.

[1]: https://wiki.archlinux.org/title/Arch_User_Repository
[2]: https://github.com/apps/renovate
[3]: https://github.com/jamieMagee/aur-packages
[4]: https://jamiemagee.co.uk/blog/maintaining-aur-packages-with-renovate
[5]: https://docs.renovatebot.com/modules/datasource/
[6]: https://opensource.org/licenses/MIT
