# EdgeCase Ruby Koans

## Extended RSpec Edition by richstone.io

_These koans are originally from http://www.rubykoans.com/. This repo was forked by []() from
[alycit/ruby_koans_rspec](https://github.com/alycit/ruby_koans_rspec), and then [X] converted
the tests to use `expect` instead of `should`, aligning with best practices per [betterspecs.org](http://www.betterspecs.org/)._
I then forked the RSpec version repo, gave it a small refurbishment to make it
more maintainable, added some new examples and my own notes including
solutions in video form. 

Recommendation: Do an exercise on your own, then checkout [the according video]() as well
as [the notes section]() afterwards to compare your learnings with mine. Namaste!

## Ruby Koans

The Ruby Koans walk you along the path to enlightenment in order to learn Ruby.
The goal is to learn the Ruby language, syntax, structure, and some common
functions and libraries. We also teach you culture. Testing is not just something we
pay lip service to, but something we live.  It is essential in your quest to learn
and do great things in the language.

The koans are broken out into areas by file, hashes are covered in about_hashes.rb,
modules are introduced in about_modules.rb, etc. They are presented in order in the
`path_to_enlightenment.rb` file.

Each koan builds up your knowledge of Ruby and builds upon itself. It will stop at
the first place you need to correct.

Some koans simply need to have the correct answer substituted for an incorrect one.
Some, however, require you to supply your own answer. If you see the method `__`
(a double underscore) listed, it is a hint to you to supply your own code in order
to make it work correctly.

## Installation

```bash
~/code:$ git clone REPO
~/code:$ cd REPO
~/code/REPO:$ bundle install
```

## Usage

```bash
~/code/REPO:$ bundle exec rake
```

## richstone.io addenda

Rich Steinmetz from [richstone.io](https://richstone.io) found his Tao through
the teachings of the Ruby Koans. Here are his chronicles...

### Visual Video Meditations & Hallucinations

I am, I see 🧿

Live streamed on [twitch @code_small_programs](https://www.twitch.tv/code_small_programs)

Eternally persisted [on YouTube]()

### Universal Tao Questions

- Why the `.object_id` pattern (integer * 2 + 1)?

### Koans Kaizen Improvements & Updates

- add rake to Gemfile

TODO:

- remove warnings
- sort stacktrace with most important info on the top
- add RSpec version to Gemfile (for future generations to come)

https://github.com/ometa/ruby_koans_rspec_expect
