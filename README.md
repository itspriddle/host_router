# Host Router

Rails plugin to create routes based on `HTTP_HOST` (or `HTTP_PORT`).

## Installation

    ./script/plugin install git://github.com/itspriddle/host_router.git

## Usage

    # Only available for http://abc.example.com/some/path
    map.connect '/some/path',
      :controller => 'somecontroller',
      :conditions => { :host => 'abc.example.com' }

    # Available for any site routing to your app, on port 1234
    map.connect '/some/path',
      :controller => 'othercontroller',
      :conditions => { :port => '1234' }

