# Bug me not - Not

This gem allows you to easily retrieve logins posted on bugmenot.com, which you can then use to disable or remove the accounts from your site's system.

## Usage

Install the gem:

```
gem install bugmenotnot
```

Require it, use it:

```ruby
require 'bugmenotnot'

logins = Bugmenotnot.retrieve_logins('example.org') # Returns an array of hashes

logins.each do |login|
  # login here will be:
  # {
  #   :username => 'some username',
  #   :password => 'some password',
  #   :other    => 'any other info' 
  # }
end
```

`:other` is only available in the hash if it was available on bugmenot for this item.

