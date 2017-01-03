# Fuprint Rack request printer middleware

Rack middleware that prints information about your request to console in development. Perfect for Sinatra or Rack apps that don't come with request ouput built in.

### Installation
```ruby
gem install fuprint
```
or add to Gemfile.

### Usage
```ruby
# Require fuprint if you're not using Bundler
require 'fuprint'

# Include as middleware

use Fuprint::Request







```



