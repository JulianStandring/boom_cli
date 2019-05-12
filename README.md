## Boom CLI. A command line interface for the GiantBomb api.

A command line interface written in Ruby with the Thor toolkit. It allows for api interactions with the "search", "game" and "dlcs" resources documented with [GiantBomb.com](https://www.giantbomb.com/api/). 

## How do I...
Basic outline of how to Run, Read and Change the contents of this repo.

# Run it
- Get the files
  - Clone or download the repository
- Setup your terminal
  - `gem install bundler`
  - `bundle install`
- Run `bin/boom`
- Add bin/boom to your PATH if you want to use it without specifying the full path
- Further setup and use is documented in the application

# Read it
- Files and Folders
  - bin/ : contains the initial Ruby code that is used
  - lib/ : contains further Ruby code
  - test/ : *should* contain rspec tests
  - README : These instructions
- Run it!
  - Thor has documented the options and commands that can be run. Run `bin/boom` or `ruby bin/boom` to see what it can do.

# Change it
- setup
  - Clone or Fork the repo
  - Write new code
- build
  - Not much here. This is currently just some Ruby code.
- test
  - Not much here. Some tests, rspec and a Rakefile would be good. Test Driven Development would be better to practice.
- process
  - Fork it.
  - No real process, just do it.
