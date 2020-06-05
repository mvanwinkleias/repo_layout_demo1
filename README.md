# Purpose

* To change "quick and dirty" to "quick and something that can be built upon"

# Forward

I don't consider this type of discipline only worth while for Developers.
My profession is System Administration, with emphasis on "other things".
While the ideas presented here might seem complex, they are presented in a
"do this" manner, and I understand there might be questions.

In my opinion, "I'm not a Developer" is not a good argument for not following
good programming practice; especially when people are literally showing
you how to make your life easier.

If you program, and think to yourself, "I'll never need to put this in a
source repo", this is for you.

These techniques are revision control system agnostic.  That said,
the majority of my work is in git.

## Repo Naming, Groups, etc

### One-Offs

You're going to have a lot of repos.  Don't fear that.  Sometimes the best names to give
a repo look like:

* ias_102003_hunt_mac_addresses

Where 102003 corresponds to a ticket number that can be referenced, and updated
by anybody with access to the ticketing system.

Sometimes you'll make a repo just for yourself in your private space.  My name is Martin VanWinkle .

I'll name repos like this:

* mv_fun_with_something

and put it in my private git space.  If I want to share it with a teammate, and they clone the repo
into their source directory, it's more obvious what that repo does and it manages expectations.

You will want to have a space for "production" repos.

If you deploy with packages, you'll want
a way to refer to the repository location that housed the code for the artifact.

### Grouped

I have repos for:

* firewall log parsing
* email log parsing
* smtp scripts
* syslog (combined) log parsing

You can group things together.  Just make sure that if they become a "thing" that they
then get organized.

### Monolithic vs Modular Environments

If you are capable of being modular, then go for it.  That's one of the things
this tutorial is all about.

If you are in a modular environment, with an actual release process,
commit messages become less important than changelogs.

As a rule, I NEVER let the fact that I don't know what to say in a commit message
prevent me from committing.  Most times in the earlier stages of a project you
edit many files and do many things.  If you organize the repo correctly, with
appropriate file names, you can easily see what's been going on without
reading the commit messages.  That, and given the nature of git, if you make
a mistake with a commit message (i.e. include a file that's unrelated to the
commit message in the commit) how often do you fix that?  You just needed a
checkpoint to not lose your work.

# "Start" Repo Layout

A ticket came in.  You need to write a script that looks for the mac address
in a DHCP log file, and pull out the IP addresses that the mac address has
been assigned.

You create the repo in your group space.

You name it something like:

* edu_19282_hunt_mac_addresses

Or, you put it in your personal space:

* mv_19282_hunt_mac_addresses

Clone the repo.

This should only cost you 2 minutes.

## You have a script you need to write!

```
.
├── .gitignore
├── README.md
└── src
    └── bin
        └── some_script.py
```

Of course, you can script something that creates this layout.  (I use a template
program I've been working on for some time.  The examples in this tutorial are
complete concepts that contribute to the system I use.)

A good .gitignore is very important.  Chances are you can make a large one that covers a bunch of
languages, and use liberally.

Here's what you could do, by hand:
```
cp /some/template/.gitignore .gitignore
touch README.md
mkdir -p src/bin
touch some_script.py
```

And you're off!  This should only cost you 2 minutes.

## You Can Stop Here?!

Yes.  Getting code into a revision control system is a big step.
Provided you're committing and pushing your code, you can share
and get help!

Also, I'll stress:  Don't let people complaining about how you
do revision control impact committing.  It's not nearly as bad
as choosing between food and medication, but when in doubt:

```
git add .
git commit -m 'progress'
git push
```
That takes less than 20 seconds.  I honestly don't care that the
commit message was short and non-descript.  I can read what changed
in the file.

Important changes however, do justify using more formal commit
messages.

## You Want to Add a Bash Script

Your script works.  But, you want to make it easy to run by creating
a Bash wrapper for it.

Put it in src/bin.  You've already created the layout.  That's where
stuff you run should go.  This costed you nothing above what you were
doing before.

```
.
├── .gitignore
├── README.md
└── src
    └── bin
        ├── run_me.sh
        └── some_script.py
```

## You're seeing patterns!

Maybe now you're 

# "Goal" Repo Layout


Here's how we're going to organize things during this tutorial:

```
.
├── .gitignore
├── README.md
└── src
    ├── bin
    │   ├── some_script.php
    │   ├── some_script.pl
    │   ├── some_script.py
    │   └── some_script.rb
    └── lib
        ├── perl5
        │   └── IAS
        │       └── HelloRepoLayout.pm
        ├── php7
        │   └── IAS
        │       └── HelloRepoLayout.php
        ├── python3
        │   └── IAS
        │       └── HelloRepoLayout
        │           ├── HelloRepoLayout.py
        │           └── __init__.py
        └── ruby2
            └── IAS
                └── HelloRepoLayout.rb
```

# Design Goals

All of these languages are unrelated, but they use the same layout.

You start from the perspective of accomodating for future growth by organizing
things.  Then you use the design as a template so that "quick and dirty"
is just "quick".

A problem with ALL programming languages is that you don't know how a library
is going to look ahead of time.  You struggle to find the right names, and
the right structure.  This allows you to just create functionality without
worrying about that stuff.

This is future-proof.  When you've finally gotten a good idea of how things
could be organized, you can pick off functionality and put them into more
"official" libraries.  You lose nothing.  You gain mobility.

# Features

All scripts can be symbolically linked to wherever.  They're capable of finding
the libraries they use.

# Rules / Guidelines

## Avoiding Conflicts and Breakage

If you use globally unique library names you don't have to worry about conflicts.

If, when unsure if an update is going to break backward compatibility with
another bit of software that uses these libraries, you can
simply copy the library and name it HelloRepoLayout2 (for example) .  It is always good to
retroactively examine what other source files are using the old version and
see if you can easily get them to use the new version.

## Semantic Versioning and Tags
If you use Semantic Versioning, then, for example, you can use a tagging scheme like this:

* 1.2.3-4

Where

* 1.2.3 is Major.Minor.Patch for things under src dir. (Functionality)
* 4 is the release number, when things outside of src have changed. (Deployment,
documentation, etc).


