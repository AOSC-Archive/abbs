AutoBuild Build Service
=======================

A system for managing autobuild(1) definitions in a repository. Of course it
depends on autobuild. Yes, autobuild3 for the libraries.

Storage
-------

abbs puts all the autobuild specs in `repo/target-section/pkgname/autobuild/`,
where:

* `repo` is the root dir for the repository. **Git-managed ones preferred.**
* `target` defines how important the package is. Offically used values are
  `core`, `base` and `extra`.
* `section` defines what kind of package it is, e.g. `shell`, `devel`, `libs`.
  The sections doesn't have much to do with autobuild's sections.
* `pkgname` is.. uh, just the name of the package. Typically there should not
  be any packages of the same name in a repo.

The following new members are also added to a repo:

* `groups/*` are text files consisting of packages to build in groups. The pkgs
  can be deliminated by any characters in the bash `$IFS`, that is, a space, a
  newline and a tab. The contents of it will be directly passed to
  `abbs-process`.
* `repo-spec/` is the directory for storing weird repo specifications. Don't
  ask me why it is not something like `.abbs-repo`.
  * `external-packages` defines the list of packages that should be searched
    outside of the repo.
* `repo/target-section/pkgname/spec` is the place for package data needed for
  abbs. It holds the versioning info which will later be used to override
  `autobuild/defines`, and some URL stuffs. Sorry, but I don't know what DRY
  is. Would you like any Phosphorus pentoxide to make yourself dry?

An abbs package should have three types of names:

* Package name: the naked `pkgname`.
* In-Repo name: `target-section/pkgname`.
* Fully qualified name: `repo-name/target-section/pkgname`. This is a **TODO**,
  since we do not have a scheme like symlinks named `repos/repo-name`.

Building
--------

The `abbs-build` is the main tool for building. It accepts all implemented abbs
pkgname types. After expanding the names to **In-repo Names** (note this will
change soon), it passes the resulting list as the args of `abbs-process` on each
output of `abbsgenall "$@"`.

The `abbsgenall` scriptlet does the recurse-print-sort-dedup job.

The `abbs-process` scriptlet does the following:

  * Use `abbscalcdep` to get a full list of dependencies. Now it is just naive
    subshell or process-level recursing, so don't be surprised by its speed.
	Advanced pm abstrations, like Provides/Replaces, is not yet	implemented.
	
	We are now trying to let sqlite do the job for us, so we can have a faster
	platform to do the silly job slowly.
	
	* Yes you are abso-flying-lutely right! No arch support exists yet.
  * Asks the `pm` functions if all dependencies are met. If the check fails, we
    simply kicks the bucket. No we don't even let ab do the job, even though it
	will certainly do some install correctly.
  * Gets a temp dir.
  * Grabs the source. The definition scheme is too verbose to document.
  * Unpacks the source, puts the ab defs inside and run autobuild.

It's so simple that a naive, young children can understand it, excited!
