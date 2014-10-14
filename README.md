abbs
====

AutoBuild Building Service, a set of structure that provides automated source-to-package building and even ALFS building.

Specifications
----

abbs is supposed to have a git repository that stores the autobuild files AND abbs metadatas. The repository would be a
repository with multiple bare branches with a name like `os2-centralpoint/php5` (__WARNING:__ Not every developer agree
with this currently, so this may change. Just make it a replaceable module.) A full copy can be obtained using
`git clone --mirror`, and a simply copy can be optained using `--depth 1`. It's all git work to us. And it looks like the 
Archlinux repo. 

abbs implentations SHOULD support custom URLs.

After downloading the repository, abbs analyzes the dependency tree, and build the packages accordingly. abbs SHOULD use 
package archivers like `autobuild-aoscarchive`.

Since patches may vary on different platforms, abbs supports platform-specific patches. abbs also supports user-customized
compiler flags, just like ebuild.

### A. MetaData

### B. Storage

### C.
