# Ser

Lightweight [foreman](https://github.com/ddollar/foreman) alternative.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ser'
# or this if you want to use ser master
# gem 'ser', github: 'patriciomacadden/ser'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install ser
```

## Usage

Just create a `Procfile`:

```
web: bundle exec rails server puma
sidekiq: bundle exec sidekiq -C config/sidekiq.yml
```

Then you can start those processes:

```bash
$ bundle exec ser start
web: started (2623)
sidekiq: started (2624)
```

Or stop them:

```bash
$ bundle exec ser stop
web: stopped
sidekiq: stopped
```

Or restart them:

```bash
$ bundle exec ser restart
web: started (2625)
sidekiq: started (2626)
```

Or see their status:

```bash
$ bundle exec ser restart
web: running (2625)
sidekiq: running (2626)
```

And of course, you can start, stop, restart or see the status of a specific
process (or a list of processes):

```bash
$ bundle exec ser restart web
web: restarted (2627)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## LICENSE

See the [LICENSE](https://github.com/patriciomacadden/ser/blob/master/LICENSE).
