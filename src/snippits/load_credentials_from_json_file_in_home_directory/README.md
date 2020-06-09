# Loading Credentials From JSON Files Inside Your Home Directory

A common reason why people don't like to put their code into a revision control system
is that they store credentials "close" to the code.

One possible solution is to store credentials in your home directory.

I work at ias.edu .  I have a ~/.config/IAS/ directory where I put sensitive
configuration files.

For these examples to work, create ~/.config/IAS/some-awesome-project/ipam_credentials.json :

```
{
	"username" : "some-user",
	"password" : "super_secret_password"
}
```

Remember, **chmod 600** the file.

Optionally, you can create ~/.config/IAS/my_credentials/ipam_credentials.json and symbolically
link it to ~/.config/IAS/some-awesome-project/ipam_credentials.json .

This will allow you to use the same set of credentials for multiple projects that access
the same set of systems.

You can store non-sensitive information in your home directory as well.  I recommend storing
credentials in different (separate) files though.

For non-sensitive configuration files, you can store them inside the repo, like in src/etc
and symbolically link them to ~/.config/IAS/some-awesome-project/config.json

Then, when somebody wants to use your project for something, you can write instructions:

* Install ...
* Symlink src/etc/config.json to ~/.config/IAS/some-awesome-project/config.json
* Put your IPAM credentials "username", and "password" into ~/.config/IAS/some-awesome-project/ipam_credentials.json

# Lastpass!

For bonus points, you can use the lastpass command line utility to dump json files.
