## Boom CLI. A command line interface for the GiantBomb api.

A command line interface written in Ruby with the Thor toolkit. It allows for api interactions with the "search", "game" and "dlcs" resources documented on [GiantBomb.com](https://www.giantbomb.com/api/). This has been written on and is intended to work on *nix systems, namely Max OSX.

## How do I...
A basic outline of how to Run, Read and Change the contents of this repo.

# Pre-requesites
Some knowledge of github, terminal setup and Ruby are assumed.

# Run it
- Get the files to local disk
  - Clone, fork or download the repository
- Setup your terminal
  - `gem install bundler`, from the root of `boom_cli` if [bundler](https://bundler.io/) not installed yet.
  - `bundle install`, again from the root og `boom_cli`, this will setup the required Ruby gems.
- Run `bin/boom` - if this is not set to be executable then run `chmod +x bin/boom` to make it so.
- Add `bin/boom` to your PATH (if you want to use it without specifying the full path)

  [`echo $PATH` to see current setup, `export PATH=$PATH:/location/of/bin/boom` to add the new `bin/boom` location]
- Further setup and usage is documented in the application

# Read it
- Files and Folders
  - `bin/` : contains the initial Ruby code that is used
  - `lib/` : contains further Ruby code
  - `test/` : *should exist* and contain some tests for the code that's been written
  - README : These instructions
- Run it!
  - Thor has documented the options and commands that can be run. Run `bin/boom` or `ruby bin/boom` to see what it can do.

# Change it
- setup
  - Clone or Fork the repo
  - Setup yor terminal
  - Write new code
- build
  - Not much here. This is currently just some Ruby code.
- test
  - Not much here. Some tests, rspec and a Rakefile would be good. Is now a good time to try Test Driven Development?
- process
  - Fork it.
  - No real process, just do it and use it.
  
## Questions and Suggestions
If you have any questions about this please comment and feel free to send me a DM.
