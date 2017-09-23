# crystal_twitter

Writing a Twitter API Wrapper for the purposes of application-specific queries and streaming. Mainly for my own use.
There are better Twitter libraries out there for user-specific queries, such as https://github.com/sferik/twitter-crystal.

# TODO

- Figure out how crystal library versions work
- Factor out core "cursor" iterator functionality into an interface/class, make individual subclasses/structs for individual cursors such as user id cursors and what not
- Ya know..., tests
- Verbose mode

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  crystal_twitter:
    github: akarimcheese/crystal_twitter
```

## Usage

```crystal
require "crystal_twitter"
```

TODO: Write usage instructions here

## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/akarimcheese/crystal_twitter/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [akarimcheese](https://github.com/[akarimcheese]) Ayman Karim - creator, maintainer
