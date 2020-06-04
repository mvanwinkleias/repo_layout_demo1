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

## A Note About Repo Naming

You're going to have a lot of repos.  Don't fear that.  Sometimes the best names to give
a repo look like:

* ias_102003_hunt_mac_addresses

We use RT.  [ias #102003] corresponds to a ticket number that can be referenced, and updated
by anybody with access to the ticketing system.

Sometimes you'll make a repo just for yourself in your private space.  My name is Martin VanWinkle .

I'll name repos like this:

* mv_fun_with_something

and put it in my private git space.  If I want to share it with a teammate, and they clone the repo
into their source directory, it's more obvious what that repo does and it manages expectations.

You will want to have a space for "production" repos.

If you deploy with packages, you'll want
a way to refer to the repository location that housed the code for the artifact.

## Monolithic vs Modular Environments

If you are capable of being modular, then go for it.  That's one of the things
this tutorial is all about.

# Repo Layout

A good .gitignore is very important.  Chances are you can make a large one that covers a bunch of
languages, and use it.

Here's how we're going to organize things during this tutorial:

```
.
├── .gitignore
├── README.md
└── src
    ├── bin
    │   ├── some_script.pl
    │   ├── some_script.py
    │   └── some_script.rb
    └── lib
        ├── perl5
        │   └── IAS
        │       └── HelloRepoLayout.pm
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


