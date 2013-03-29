Stay Classy
===========

Framework for avoiding global pollution of class and module methods when stubbing

Example Usage
=============

```ruby
require 'stay_classy'
class Bob < String ; end
class Frank < Bob; end
stay_classy(Frank) { |stub| puts stub.inspect }
```
