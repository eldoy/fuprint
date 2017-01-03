# Fuprint request printer middleware
Rack middleware that prints information about your request to console in development. Perfect for Sinatra or Rack apps that don't come with request ouput built in.

### Installation
```ruby
gem install fuprint
```
or add to Gemfile.

### Settings
```ruby
# Print the whole env hash for each request if true
Fuprint.debug = false

# Fuprint only prints in development mode
@mode = ENV['RACK_ENV'] || 'development'
```

### Usage
```ruby
# Require fuprint if you're not using Bundler
require 'fuprint'

# Include as middleware
use Fuprint::Request
```

That's it!

This library is actively maintained by [Fugroup Ltd.](http://www.fugroup.net) We are the creators of [CrowdfundHQ.](https://crowdfundhq.com)

Thanks!

`@authors: Vidar`
