# Ubuntu-package-install
Install the required packages and softwares with one script in Ubuntu

* To select packages to install, add the package name in `install.config` file
> Make sure to add an empty line at the end of the file
* For adding a new package, create a file in `package-info` directory with the package name and add shell instructions of its installation
> Again make sure to leave an empty line at the end

---
#### Features to add (to `main.sh`)
- [ ] Argument support for install
- [ ] Argument support for install `package-name`
- [ ] Argument support to list all available packages
- [ ] Argument support to list currently staged install packages
- [ ] Argument support to print help info