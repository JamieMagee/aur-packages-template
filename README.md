# Arch User Repository Packages Repository Template

This repository is a template for maintaining [Arch User Repository (AUR)][1] packages automatically using [Renovate][2].

## How it works

Check out [the break down on my blog][3] for a detailed walkthrough.
The short version is:

1. Renovate will open PRs to update the `pkgver`
1. GitHub Actions will run in each PR to run `updpkgsums` and `makepkg --srcinfo > .SRCINFO`
1. When a PR is merged GitHub Actions will publish the package to the AUR (if you've configured the `AUR_USERNAME`, `AUR_EMAIL` and `AUR_SSH_PRIVATE_KEY` secrets).

## Adding a new package

1. Add a new directory with the package name
1. Create your `PKGBUILD` and `.SRCINFO`
1. Add a comment after pkgver with the [Renovate datasource][4] and package name

```
pkgver=1.2.3 # renovate: datasource=github-tags depName=git/git
```

## License

All code in this repository is licensed under [the MIT license][5].
See the `license` property in each `PKGBUILD` for the license under which each package is distributed.

[1]: https://wiki.archlinux.org/title/Arch_User_Repository
[2]: https://github.com/renovatebot/renovate/
[3]: https://jamiemagee.co.uk/blog/
[4]: https://docs.renovatebot.com/modules/datasource/
[5]: https://opensource.org/licenses/MIT
