# AUR package repository template

This template uses [Renovate][2] to keep [Arch User Repository (AUR)][1] packages up to date.
You can see it in use in my [AUR packages repository][3].

## How it works

I explain the setup in more detail [on my blog][4]. The short version:

1. Renovate opens pull requests to update `pkgver`.
1. GitHub Actions runs `updpkgsums` and `makepkg --printsrcinfo > .SRCINFO` for every changed package.
1. Once the pull request is merged, GitHub Actions publishes each changed package to the AUR.

Publishing also needs the `AUR_USERNAME`, `AUR_EMAIL`, and `AUR_SSH_PRIVATE_KEY` repository secrets.

One pull request or push can update several packages.
GitHub Actions processes them separately.

## Adding a package

1. Create a directory named after the package.
1. Add the initial `PKGBUILD` and `.SRCINFO` files to the directory.
1. Add a comment after `pkgver` with the [Renovate datasource][5] and package name:

```bash
pkgver=1.2.3 # renovate: datasource=github-tags depName=git/git
```

## License

The code in this repository is licensed under [the MIT license][6].
Each package is distributed under the license declared in its `PKGBUILD`.

[1]: https://wiki.archlinux.org/title/Arch_User_Repository
[2]: https://github.com/apps/renovate
[3]: https://github.com/jamieMagee/aur-packages
[4]: https://jamiemagee.co.uk/blog/maintaining-aur-packages-with-renovate
[5]: https://docs.renovatebot.com/modules/datasource/
[6]: https://opensource.org/licenses/MIT
